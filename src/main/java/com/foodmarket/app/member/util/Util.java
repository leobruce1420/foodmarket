package com.foodmarket.app.member.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import org.apache.commons.codec.binary.Hex;
import org.json.JSONObject;

public class Util {

	public static final String KEY = "KittySnoopyMicky";

	// 加密
	public static String encryptString(String message) {

		String encryptedString = "";
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			encryptedString = DatatypeConverter.printBase64Binary(cipher.doFinal(message.getBytes()));
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return encryptedString;
	}

	// 解密
	public static String decryptString(String key, String stringToDecrypt) {
		String decryptedString = "";
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			byte[] b = DatatypeConverter.parseBase64Binary(stringToDecrypt);
			decryptedString = new String(cipher.doFinal(b));
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return decryptedString;
	}

	// String轉SHA-512
	public String encodeSha512(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.update(str.getBytes("utf-8"));
			byte[] digest = md.digest();
			return byteToHexString(digest);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String byteToHexString(byte[] bytes) {
		return String.valueOf(Hex.encodeHex(bytes));
	}
	
	public static byte[] HexStringToByte(String hexStr) {
        if (hexStr.length() < 1)
                return null;
        byte[] result = new byte[hexStr.length()/2];
        for (int i = 0;i< hexStr.length()/2; i++) {
                int high = Integer.parseInt(hexStr.substring(i*2, i*2+1), 16);
                int low = Integer.parseInt(hexStr.substring(i*2+1, i*2+2), 16);
                result[i] = (byte) (high * 16 + low);
        }
        return result;
}

	// byte[]轉Base64字串
	public String encoder(byte[] textByte) {
		final Base64.Encoder encoder = Base64.getEncoder();
		final String encodedText = encoder.encodeToString(textByte);
		return encodedText;
	}

	// Base64字串轉byte[]
	public byte[] decoder(String encodedText) {
		final Base64.Decoder decoder = Base64.getDecoder();
		byte[] decodedArray = decoder.decode(encodedText);
		return decodedArray;
	}

	// InputStream轉byte[]
	public byte[] inputToBytes(InputStream ins) {
		byte[] inputArray = null;
		try {
			ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
			byte[] buff = new byte[128];
			int rc = 0;
			while ((rc = ins.read(buff, 0, 100)) > 0) {
				swapStream.write(buff, 0, rc);
			}
			inputArray = swapStream.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return inputArray;
	}
	
	public synchronized boolean isCaptchaValid(String secretKey, String response) {
	    try {
	        String url = "https://www.google.com/recaptcha/api/siteverify",
	                params = "secret=" + secretKey + "&response=" + response;

	        System.out.println(params);
	        HttpURLConnection http = (HttpURLConnection) new URL(url).openConnection();
	        http.setDoOutput(true);
	        http.setRequestMethod("POST");
	        http.setRequestProperty("Content-Type",
	                "application/x-www-form-urlencoded; charset=UTF-8");
	        OutputStream out = http.getOutputStream();
	        out.write(params.getBytes("UTF-8"));
	        out.flush();
	        out.close();

	        InputStream res = http.getInputStream();
	        BufferedReader rd = new BufferedReader(new InputStreamReader(res, "UTF-8"));

	        StringBuilder sb = new StringBuilder();
	        int cp;
	        while ((cp = rd.read()) != -1) {
	            sb.append((char) cp);
	        }
	        JSONObject json = new JSONObject(sb.toString());
	        res.close();

	        return json.getBoolean("success");
	    } catch (Exception e) {
	        //e.printStackTrace();
	    }
	    return false;
	}
	//暫時用不到
	public String createToken() {
		int randomNum = (int)(Math.random()*1000000);
		String randomStr = ""+ randomNum;
		String token = "splitFromHere" + encryptString(randomStr);
		return token;
	}
}
