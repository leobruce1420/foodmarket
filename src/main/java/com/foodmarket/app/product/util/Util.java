package com.foodmarket.app.product.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

public class Util {

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

//		 InputStream轉byte[]
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
	
	
}
