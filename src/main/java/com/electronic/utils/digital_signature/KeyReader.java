package com.electronic.utils.digital_signature;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public class KeyReader {

    public static PublicKey readPublicKey(String path) {
        try {
            File filePublicKey = new File(path);
            FileInputStream fis = new FileInputStream(path);
            byte[] encodedPublicKey = new byte[(int) filePublicKey.length()];
            int index = fis.read(encodedPublicKey);
            fis.close();
            X509EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(encodedPublicKey);
            return KeyFactory.getInstance("DSA").generatePublic(publicKeySpec);
        } catch (Exception e) {
            return null;
        }
    }

    public static PrivateKey readPrivateKey(String path) {
        try {
            File filePrivateKey = new File(path);
            FileInputStream fis = new FileInputStream(path);
            byte[] encodedPrivateKey = new byte[(int) filePrivateKey.length()];
            int index = fis.read(encodedPrivateKey);
            fis.close();
            PKCS8EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(encodedPrivateKey);
            return KeyFactory.getInstance("DSA").generatePrivate(privateKeySpec);
        } catch (Exception e) {
            return null;
        }
    }
}
