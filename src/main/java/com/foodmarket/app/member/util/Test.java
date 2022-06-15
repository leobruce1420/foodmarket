package com.foodmarket.app.member.util;

public class Test {
	public static void main(String[] args) {
		String pwd = "1";
		String cipherText = Util.encryptString(pwd);
		System.out.println(cipherText);
		String plainText = Util.decryptString("KittySnoopyMicky", cipherText);
		System.out.println(plainText);
	}	
}
