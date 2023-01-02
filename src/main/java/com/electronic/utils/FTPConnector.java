package com.electronic.utils;

import java.io.*;
import java.nio.file.Files;

import org.apache.commons.net.ftp.*;


public class FTPConnector {
    String server_address = "103.97.126.21";
    String username = "ftp-user@group7datawarehouse.tk";
    String password = "ftp-user";
    int timeout = 60000, port = 21;
    private static FTPClient ftpClient;

    public void connect() {
        ftpClient = new FTPClient();
        try {

            // connect to ftp server
            ftpClient.setDefaultTimeout(timeout);
            ftpClient.connect(server_address, port);
            ftpClient.login(username, password);
            // run the passive mode command
            ftpClient.enterLocalPassiveMode();
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            // check reply code
            if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {
                disconnectFTPServer();
                throw new IOException("FTP server not respond!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
// check contain File and Directory
    public boolean containFile(String remotePath) {
        try {
            FTPFile remoteFile = ftpClient.mlistFile(remotePath);
            return remoteFile != null;
        } catch (Exception e) {
            return false;
        }
    }
    public boolean containDirectory(String directory) throws IOException {
        ftpClient.changeWorkingDirectory(directory);
        int returnCode = ftpClient.getReplyCode();
        return returnCode != 550;
    }

    public void uploadFile(String path, String directory, String remote) {
        try {
            File localFile = new File(path);
            if (!localFile.exists()) throw new Exception("File not exists");
            InputStream inputStream = Files.newInputStream(localFile.toPath());
            boolean hasDirectory = containDirectory(directory);
            if (!hasDirectory) {
                boolean createdDir = ftpClient.makeDirectory(directory);
                if (!createdDir) throw new Exception("Create directory in ftp server is failed");
                ftpClient.changeWorkingDirectory(directory);
            }
            boolean createdFile = ftpClient.storeFile(remote, inputStream);
            inputStream.close();
            if (!createdFile) throw new Exception("Create file " + directory + "/" + remote + " in ftp server is fail");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void downloadFile(String remoteFile, String localFile) throws Exception {
        try {
            File downloadFile = new File(localFile);
            OutputStream output = new BufferedOutputStream(Files.newOutputStream(downloadFile.toPath()));
            boolean success = ftpClient.retrieveFile(remoteFile, output);
            output.close();
        } catch (Exception e) {
            return;
        }
    }
    public void disconnectFTPServer() {
        if (ftpClient != null && ftpClient.isConnected()) {
            try {
                ftpClient.logout();
                ftpClient.disconnect();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
