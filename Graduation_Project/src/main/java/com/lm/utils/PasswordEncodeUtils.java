package com.lm.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncodeUtils {

    private static BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();

    public static String passwordEncode(String password){
        return passwordEncoder.encode(password);
    }

    public static void main(String[] args) {
        String password="123456";
        String pwd = passwordEncode(password);
        System.out.println(pwd);
    }
}
