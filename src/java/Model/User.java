/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * class represent user in application
 * @author Admin
 */
public class User {

    private long id;
    private String email;
    private String password;
    private String name;
    private String phone;
    private String address;
    private boolean sex;
    private boolean status;
    private String verificationCode;
    private boolean isGoogleUser = false;
    private Role role;

    public User() {
    }
    

    public User(long id, String email, String password, String name, String phone, String address, boolean sex, boolean status, String verificationCode, Role role) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.sex = sex;
        this.status = status;
        this.verificationCode = verificationCode;
        this.role = role;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isIsGoogleUser() {
        return isGoogleUser;
    }

    public void setIsGoogleUser(boolean isGoogleUser) {
        this.isGoogleUser = isGoogleUser;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", phone=" + phone + ", address=" + address + ", sex=" + sex + ", status=" + status + ", verificationCode=" + verificationCode + ", role=" + role + '}';
    }

   
}
