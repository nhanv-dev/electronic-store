package com.electronic.utils.digital_signature;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public class KeyWriter {

    public static void writePublicKey(String path, byte[] key) {
        try {
            X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(key);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(x509EncodedKeySpec.getEncoded());
            fos.close();
        } catch (Exception e) {
            return;
        }
    }

    public static void writePrivateKey(String path, byte[] bytes) {
        try {
            PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(bytes);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(pkcs8EncodedKeySpec.getEncoded());
            fos.close();
        } catch (Exception e) {
            return;
        }
    }
}
