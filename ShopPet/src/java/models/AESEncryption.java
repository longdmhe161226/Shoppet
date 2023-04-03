/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class AESEncryption {

    private static final String ALGORITHM = "AES/CBC/PKCS5PADDING";
    private static final byte[] IV = "1234567890123456".getBytes(); // 16 bytes initialization vector
    private static final String SECRET_KEY = "mysecretkey12345"; // 16 bytes secret key

    public static String encrypt(String plainText) {
        try {
            IvParameterSpec iv = new IvParameterSpec(IV);
            SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");

            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);

            byte[] encrypted = cipher.doFinal(plainText.getBytes());
            return Base64.getEncoder().encodeToString(encrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String decrypt(String encryptedText) {
        try {
            IvParameterSpec iv = new IvParameterSpec(IV);
            SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");

            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);

            byte[] decrypted = cipher.doFinal(Base64.getDecoder().decode(encryptedText));
            return new String(decrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        System.out.println(encrypt("nong2km@gmail.com"));
        System.out.println(decrypt("MU/KFfT5n1Psh+eqmF4Xo+eaj0xzPTU1OADM1ezddXU="));
    }
}
