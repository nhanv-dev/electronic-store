package com.electronic.utils.digital_signature;

import java.security.*;

public class KeyPairUtils {
    private static KeyPair keyPair;

    public static void generateKeyPair() {
        try {
            KeyPairGenerator kpg = KeyPairGenerator.getInstance("DSA");
            kpg.initialize(1024, new SecureRandom());
            keyPair = kpg.generateKeyPair();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public KeyPair getKeyPair() {
        try {
            KeyPairGenerator kpg = KeyPairGenerator.getInstance("DSA");
            kpg.initialize(1024, new SecureRandom());
            return kpg.generateKeyPair();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static PublicKey getPublicKey() {
        if (keyPair == null) KeyPairUtils.generateKeyPair();
        return keyPair.getPublic();
    }

    public static PrivateKey getPrivateKey() {
        if (keyPair == null) KeyPairUtils.generateKeyPair();
        return keyPair.getPrivate();
    }
}
