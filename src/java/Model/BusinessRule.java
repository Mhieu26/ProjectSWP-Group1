/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 * class represent business rules of system
 * @author Admin
 */
public class BusinessRule {
    /**
     * method to encode password by MD5
     * @param password user password
     * @return hash password
     * @throws NoSuchAlgorithmException 
     */
    public static String encodePassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] digest = md.digest();
        String hashPassword = DatatypeConverter
                .printHexBinary(digest).toUpperCase();

        return hashPassword;
    }
}
