package com.electronic.utils;

import java.security.SecureRandom;

public class RandomStringGenerator {
    private static final String all = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private static final String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private static final String numbers = "0123456789";
    private static final SecureRandom random = new SecureRandom();

    public static String randomString(int length) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++)
            sb.append(all.charAt(random.nextInt(all.length())));
        return sb.toString();
    }

    public static String randomNumber(int length) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++)
            sb.append(numbers.charAt(random.nextInt(numbers.length())));
        return sb.toString();
    }

    public static String randomCharacter(int length) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++)
            sb.append(characters.charAt(random.nextInt(characters.length())));
        return sb.toString();
    }
}
