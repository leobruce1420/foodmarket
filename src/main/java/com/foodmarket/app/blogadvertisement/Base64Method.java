package com.foodmarket.app.blogadvertisement;

import java.util.Base64;

public class Base64Method {
	public String encoder(byte[] textByte) {
		final Base64.Encoder encoder = Base64.getEncoder();
		final String encodedText = encoder.encodeToString(textByte);
		return encodedText;
	}

	public byte[] decoder(String encodedText) {
		final Base64.Decoder decoder = Base64.getDecoder();
		byte[] decodedArray = decoder.decode(encodedText);
		return decodedArray;
	}
}
