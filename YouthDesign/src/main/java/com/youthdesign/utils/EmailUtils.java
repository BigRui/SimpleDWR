package com.youthdesign.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailUtils {

	public static void main(String[] args) {
		String emails = "null;null;yu.chenly@alipay.com;xianyun.wr@alipay.com;";
		if(null != emails) {
			String[] addressee = EmailUtils.getAddressArray(emails, ";");
			for(String address : addressee) {
				System.out.println(address);
			}
		}
	}

    /**
     * 
     * @param addressTo
     * @param separator
     * @return
     */
    private static String[] getAddressArray(String addressTo, String separator) {
		StringBuffer addressStringBuffer = new StringBuffer();
		String[] emailArray = addressTo.split(separator);
		for(String email : emailArray) {
			if(isEmailFormat(email)) {
				addressStringBuffer.append(email).append(separator);
			}
		}
		return addressStringBuffer.toString().split(separator);
	}
    
    /**
     * 校验收件人地址格式
     * @param email
     * @return
     */
    private static boolean isEmailFormat(String email) {
		boolean isMatched = false;
		String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(email);
		isMatched = matcher.matches();
		return isMatched;
	}
}
