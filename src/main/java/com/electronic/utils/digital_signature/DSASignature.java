package com.electronic.utils.digital_signature;

import com.electronic.service.IUserService;
import com.electronic.service.implement.UserService;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.*;
import java.math.BigInteger;
import java.nio.file.Files;
import java.security.*;
import java.util.Base64;

public class DSASignature {

    public static String hashFile(String path) {
        File file = new File(path);
        if (!file.exists()) return null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            BufferedInputStream bis = new BufferedInputStream(Files.newInputStream(file.toPath()));
            DigestInputStream dis = new DigestInputStream(bis, messageDigest);
            int count = -1;
            byte[] bytes = new byte[1024];
            do {
                count = dis.read(bytes);
            } while (count != -1);
            BigInteger number = new BigInteger(1, dis.getMessageDigest().digest());
            dis.close();
            return number.toString(16);
        } catch (IOException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String encryptHash(String msg, PrivateKey privateKey) {
        try {
            Cipher cipher = Cipher.getInstance("DSA");
            cipher.init(Cipher.ENCRYPT_MODE, privateKey);
            byte[] encryptedMessage = cipher.doFinal(msg.getBytes());
            return new String(Base64.getEncoder().encode(encryptedMessage));
        } catch (NoSuchPaddingException | NoSuchAlgorithmException | InvalidKeyException | IllegalBlockSizeException |
                 BadPaddingException e) {
            return null;
        }
    }

    public static String decryptHash(String msg, PublicKey publicKey) {
        try {
            Cipher cipher = Cipher.getInstance("DSA");
            cipher.init(Cipher.DECRYPT_MODE, publicKey);
            byte[] encryptedMessage = cipher.doFinal(Base64.getDecoder().decode(msg));
            return new String(encryptedMessage);
        } catch (NoSuchPaddingException | NoSuchAlgorithmException | InvalidKeyException | IllegalBlockSizeException |
                 BadPaddingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void sign(String src, String dest, PrivateKey privateKey) throws Exception {
        Signature signature = Signature.getInstance("DSA");
        signature.initSign(privateKey, new SecureRandom());
        FileInputStream fis = new FileInputStream(src);
        byte[] bytes = new byte[fis.available()];
        fis.close();
        signature.update(bytes);
        byte[] bsign = signature.sign();

        FileOutputStream fos = new FileOutputStream(dest);
        fos.write(bsign);
    }

    public static boolean verify(String src, String sign, PublicKey publicKey) throws Exception {
        Signature signature = Signature.getInstance("DSA");
        signature.initVerify(publicKey);
        FileInputStream fis = new FileInputStream(src);
        byte[] bytes = new byte[fis.available()];
        fis.close();

        signature.update(bytes);
        fis = new FileInputStream(sign);
        byte[] bsign = new byte[fis.available()];
        fis.read(bsign);
        fis.close();

        return signature.verify(bsign);
    }

}
