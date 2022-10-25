package com.electronic.utils;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import static java.util.stream.Collectors.joining;

public class ReadUtils {

    public static String readInputStream(InputStream stream) {
        return new BufferedReader(new InputStreamReader(stream)).lines().collect(joining("\n"));
    }

    public static JSONObject parseFromJSON(HttpServletRequest request) {
        System.out.println(request.getRequestURI());
        Object object;
        try {
            String json = readInputStream(request.getInputStream());
            System.out.println(json);
            object = new JSONParser().parse(json);
        } catch (ParseException | IOException e) {
            throw new RuntimeException(e);
        }
        return (JSONObject) object;
    }
}
