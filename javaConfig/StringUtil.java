package com.hikvision.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串工具类
 * @author yuyanwu
 * @date 2018-3-5
 */
public class StringUtil {

    /**
     * inputStream转化成字符串
     * @param in
     * @return
     * @throws IOException
     */
    public  static String   inputStream2String   (InputStream in)   throws IOException {
        StringBuffer   out   =   new   StringBuffer();
        byte[]   b   =   new   byte[40960];
        for   (int   n;   (n   =   in.read(b))   !=   -1;)   {
            out.append(new   String(b,   0,   n));
        }
        return   out.toString();
    }

    /**
     * 正则表达式查找
     * @param str
     * @param regex
     * @return
     */
    public static String regex(String str, String regex){

        String result = "";
        Pattern r = Pattern.compile(regex);
        Matcher m = r.matcher(str);
        while (m.find()) {
            result = m.group(0);
        }
        return result;
    }


    public static String extractNumberFromString(String str){
        String regEx="[^0-9|^\\.]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.replaceAll("").trim();
    }









}
