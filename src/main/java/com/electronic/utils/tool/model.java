package com.electronic.utils.tool;

import java.io.*;
import java.nio.charset.StandardCharsets;

public class model {
    public String readFile(String path) {
        String result = "";
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(path), StandardCharsets.UTF_8));
            String line = bufferedReader.readLine();
            while (line != null) {
                result += line;
                line = bufferedReader.readLine();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;

    }
    public static void saveFile(String fileName, String input) {
        try {
            FileWriter fw = new FileWriter(fileName);
            fw.write(input);
            fw.close();
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
