package com.foodmarket.app.member.util;

public class Test {
	public static void main(String[] args) {
		
		Util util = new Util();
		
//		String pwd = "a12345";
//		String cipherText = Util.encryptString(pwd);
//		System.out.println(cipherText);
		String plainText = Util.decryptString("KittySnoopyMicky", "mhqwb+vYGaN+6D4FUNNk0w==");
		System.out.println(plainText);
//		
//		String token = "(n3PwmIx4NeKhyX9T4bYUsQ==)";
//		System.out.println(token.substring(1, token.length()-1));
		
		
		
//		System.out.println(util.encodeSha512("18"));
		
//		JavaMail mail = new JavaMail();
//		mail.SendMail("molamolaking8602011@gmail.com", "測試", "ttttteeeeesssssttttt");
	}	
}
