package com.guanglumedia.api.utils;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import com.google.zxing.common.BitMatrix;
 
 
 public final class MatrixToImageWriter {
 
   private static final int BLACK = 0xFF000000;
   private static final int WHITE = 0xFFFFFFFF;
 
   private MatrixToImageWriter() {}
 
   
   public static BufferedImage toBufferedImage(BitMatrix matrix) {
     int width = matrix.getWidth();
     int height = matrix.getHeight();
     BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
     for (int x = 0; x < width; x++) {
       for (int y = 0; y < height; y++) {
         image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
       }
     }
     return image;
   }
 
   
   public static void writeToFile(BitMatrix matrix, String format, File file)
       throws IOException {
     BufferedImage image = toBufferedImage(matrix);
     if (!ImageIO.write(image, format, file)) {
       throw new IOException("Could not write an image of format " + format + " to " + file);
     }
   }
 
   public static void writeToStream(BitMatrix matrix, String format, OutputStream stream) throws IOException{
	   writeToStream(matrix, format, stream, null);
   }
   
   public static void writeToStream(BitMatrix matrix, String format, OutputStream stream, String waterImg)
       throws IOException {
     BufferedImage image = toBufferedImage(matrix);
     
     if(waterImg != null && new File(waterImg).exists()){
	     Graphics2D g = image.createGraphics();
	     g.drawImage(image, 0, 0, image.getWidth(), image.getHeight(), null);
	  
	     Image waterImage = ImageIO.read(new File(waterImg));    // 水印文件
	     int width_1 = waterImage.getWidth(null);
	     int height_1 = waterImage.getHeight(null);
//	     g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0));
	      
	     int widthDiff = image.getWidth() - width_1;
	     int heightDiff = image.getHeight() - height_1;
	     int x = widthDiff / 2;
	     int y = heightDiff / 2;
	     g.drawImage(waterImage, x, y, width_1, height_1, null); // 水印文件结束
	     g.dispose();
     }
     
     if (!ImageIO.write(image, format, stream)) {
       throw new IOException("Could not write an image of format " + format);
     }
   }
 
 }