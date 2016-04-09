package com.guanglumedia.api.utils;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QRCodeUtil {
	public static byte[] makeCode(String str, int width, int height, String logoPath) throws WriterException, IOException{
		String format = "png";
		Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
		BitMatrix bitMatrix = new MultiFormatWriter().encode(
				str, BarcodeFormat.QR_CODE, width,
				height, hints);
		
		ByteArrayOutputStream buff = new ByteArrayOutputStream();
		MatrixToImageWriter.writeToStream(bitMatrix, format, buff, logoPath);
		return buff.toByteArray();
	}
	
	public static void main(String[] args) throws Exception {
		byte[] buff = makeCode("http://bj.sofamovie.cn/epg/marketactivity/luckDraw.jsp", 500, 500, null);
		FileOutputStream output = new FileOutputStream("d:\\code.png");
		output.write(buff);
		output.close();
	}
}
