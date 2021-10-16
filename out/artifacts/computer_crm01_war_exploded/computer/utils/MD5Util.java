package com.computer.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class MD5Util {

	public String getMD5(String str) {
		try {
            // 创建MD5加密对象
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 
            md.update(str.getBytes());
            // digest()
            // BigIntegerֵ
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            e.printStackTrace();
            return str;
        }
   }
	
}
