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
