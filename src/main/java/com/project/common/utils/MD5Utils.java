package com.project.common.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class MD5Utils {

    //    MD5加密算法 16位
    public static String encrptyPassword(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {

        String result = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte b[] = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            result = buf.toString();
            System.out.println(result);
        } catch (NoSuchAlgorithmException e) {
            System.out.println(e);
        }
        return result;

    }

    //32位
    public static String getMD5Str(String str)
    {
        MessageDigest messageDigest = null;
        try
        {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(str.getBytes("UTF-8"));
        } catch (NoSuchAlgorithmException e)
        {
            System.out.println("NoSuchAlgorithmException caught!");
            System.exit(-1);
        } catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }

        byte[] byteArray = messageDigest.digest();

        StringBuffer md5StrBuff = new StringBuffer();

        for (int i = 0; i < byteArray.length; i++)
        {
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
            else
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
        }
        return md5StrBuff.toString();
    }

//    校验密码方法  MD5

    public static boolean checkPassword(String inputPwd,String dbPwd) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String result = encrptyPassword(inputPwd);
        if (result.equals(dbPwd)){
            return true;
        }else {
            return false;
        }
    }

    public static void main(String[] args){
        System.out.println(getMD5Str("dfsadgjdkad"));
    }
}

