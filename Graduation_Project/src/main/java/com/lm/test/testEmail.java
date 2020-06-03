package com.lm.test;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Random;

public class testEmail {
    private static int emailCode;

    public static void main(String[] args) {

        try{
            HtmlEmail htmlEmail = new HtmlEmail();
            htmlEmail.setHostName("smtp.163.com");
            htmlEmail.setCharset("utf-8");
            htmlEmail.addTo("192720197@qq.com");
            htmlEmail.setFrom("lemon192720197@163.com","aa");
            htmlEmail.setAuthentication("lemon192720197@163.com","FGEQNKHLYOGQSGWO");
            htmlEmail.setSubject("测试哈哈哈哈哈哈");
            emailCode= new Random().nextInt(1000000);
            htmlEmail.setMsg(String.valueOf(emailCode));
            htmlEmail.send();
        }catch (Exception e){

        }
    }
}
