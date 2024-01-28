/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Arrays;

/**
 *
 * @author Admin
 */
public class PhoneNGender {
    
    public class PhoneNumbers{
        private String value;

        public PhoneNumbers() {
        }

        public PhoneNumbers(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        @Override
        public String toString() {
            return "PhoneNumbers{" + "Phonevalue=" + value + '}';
        }
        
    }
    
    
    public class Genders{
        private String value;

        public Genders() {
        }

        public Genders(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        @Override
        public String toString() {
            return "Genders{" + "Gendervalue=" + value + '}';
        }
        
    }
    
    private PhoneNumbers[] phoneNumbers;
    private Genders[] genders;

    public PhoneNGender() {
    }

    public PhoneNGender(PhoneNumbers[] phoneNumbers, Genders[] genders) {
        this.phoneNumbers = phoneNumbers;
        this.genders = genders;
    }

    public PhoneNumbers[] getPhoneNumbers() {
        return phoneNumbers;
    }

    public void setPhoneNumbers(PhoneNumbers[] phoneNumbers) {
        this.phoneNumbers = phoneNumbers;
    }

    public Genders[] getGenders() {
        return genders;
    }

    public void setGenders(Genders[] genders) {
        this.genders = genders;
    }

    @Override
    public String toString() {
        return "PhoneNGender{" + "phoneNumbers=" + Arrays.toString(phoneNumbers) + ", genders=" + Arrays.toString(genders) + '}';
    }
    
    
    
}
