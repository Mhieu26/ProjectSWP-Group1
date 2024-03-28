/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.BusinessRule;
import Model.Image;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.xml.bind.DatatypeConverter;
import Model.Role;
import Model.User;
import java.util.List;

/**
 * object that get Users in application
 *
 * @author Admin
 */
public class UserDAO extends DBContext {
        public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void updateStatus(long userId, boolean newStatus) {
    try {
        String sql = "UPDATE user SET status = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setBoolean(1, newStatus);
        statement.setLong(2, userId);
        statement.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}
    
    public ArrayList<User> searchCustomerByName(String name) {
        ArrayList<User> users = new ArrayList<>();

        String sql = " select user.id, email, password, name, phone, address, sex, "
                + "status, verificationCode, roleid, role \n"
                + "from user join role on user.roleid = role.id where role.id = 1 and name like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + name + "%");
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(new Role(rs.getLong("roleid"), rs.getString("role")));

                users.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return users;
    }

    public int getNumberOfRecords() {
    int count = 0;
    try {
        String sql = "SELECT COUNT(*) AS count FROM user JOIN role ON user.roleid = role.id WHERE role.id = 1";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            count = rs.getInt("count");
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return count;
}
    
    public ArrayList<User> getCustomers(int offset, int limit) {
        ArrayList<User> users = new ArrayList<>();

        String sql = " select user.id, email, password, name, phone, address, sex, "
                + "status, verificationCode, roleid, role \n"
                + "from user join role on user.roleid = role.id where role.id = 1 "
                + "LIMIT ?, ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, offset);
            statement.setInt(2, limit);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(new Role(rs.getLong("roleid"), rs.getString("role")));

                users.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return users;
    }

    public ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();

        String sql = " select user.id, email, password, name, phone, address, sex, "
                + "status, verificationCode, roleid, role \n"
                + "from user join role on user.roleid = role.id ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(new Role(rs.getLong("roleid"), rs.getString("role")));

                users.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return users;
    }

    public ArrayList<User> getUsersByRoleID(int id) {
        ArrayList<User> users = new ArrayList<>();

        String sql = " select user.id, email, password, name, phone, address, sex, "
                + "status, verificationCode, roleid, role \n"
                + "from user join role on user.roleid = role.id \n"
                + "where roleid=? ";
        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(new Role(rs.getLong("roleid"), rs.getString("role")));

                users.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return users;
    }

    public User getUserByLogin(String email, String hashPassword) {
        String sql = "select user.id, email, password, name, phone, address, sex, status, verificationCode, roleid, role \n"
                + "from user join role on user.roleid = role.id\n"
                + "where email=? AND password=? AND status = true";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, hashPassword);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(new Role(rs.getLong("roleid"), rs.getString("role")));

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * get user by email that have not expired yet or curren
     *
     * @param email email that user enter
     * @return user
     */
    public User getUserByEmail(String email) {
        String sql = " select * from user \n"
                + "where email = ? \n"
                + "		AND \n"
                + "        (status is not null \n"
                + "			OR \n"
                + "			(status is null AND expiredDatetime > now())\n"
                + "		) ";// email da ton tai hoac chua het han

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(null);

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getGoogleUser(String email) {
        String sql = " select * from user where email = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(new Role(rs.getLong("roleid"), ""));
                u.setIsGoogleUser(rs.getBoolean("isGoogleUser"));

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertUser(String email, String password, String name, String phone, String address, boolean sex, String verificationCode) {
        String sql = " insert into user(email, password, name, phone, address, sex, status, verificationCode, expiredDatetime, roleid)\n "
                + " values(?, ?, ?, ?, ?, ?, null, ?, (now() + interval 1 minute), 1) ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setString(4, phone);
            statement.setString(5, address);
            statement.setBoolean(6, sex);
            statement.setString(7, verificationCode);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertGoogleUser(String email, String name, String phone, String sex) {
        String sql = " insert into user(email, name, phone, sex, status, isGoogleUser, roleid) "
                + " values(?,?,?,?, true, true, 1)";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, name);
            if (phone != null) {
                statement.setString(3, phone.replace(" ", ""));
            } else {
                statement.setString(3, null);
            }
            if (sex == null) {
                statement.setString(4, sex);
            } else {
                if (sex.equalsIgnoreCase("male")) {
                    statement.setBoolean(4, true);
                }
                if (sex.equalsIgnoreCase("female")) {
                    statement.setBoolean(4, false);
                }
            }

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void setGoogleUser(String email) {
        String sql = " update user "
                + " set isGoogleUser = true "
                + " where email = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int verifyUser(String email, String verifyCode) {
        String sql = " update user\n"
                + " set status=true, verificationCode=null, expiredDatetime=null \n"
                + " Where email = ?  AND verificationCode = ? AND expiredDatetime > now() ";
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, verifyCode);
            row = statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return row;
    }

    public void updatePassword(String pass, String email) throws NoSuchAlgorithmException {
        try {
            String sql = "update user\n"
                    + " set password = ?\n"
                    + "where email =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, BusinessRule.encodePassword(pass));
            statement.setString(2, email);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Image getImageByUserID(int id) {
        String sql = " select * from image where userid=? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                Image img = new Image();
                img.setId(rs.getLong("id"));
                img.setSource(rs.getString("source"));
                img.setType(rs.getString("type"));
                img.setProductId(null);
                img.setBlogId(null);
                img.setSliderId(null);
                img.setUserId(rs.getLong("userid"));

                return img;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateUser(User user, String name, String phone, Boolean sex, String address) {
        try {
            String sql = "UPDATE user\n"
                    + "SET name = ?,\n"
                    + "    phone = ?,\n"
                    + "    sex = ?,\n"
                    + "    address = ?\n"
                    + "WHERE id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, phone);
            statement.setBoolean(3, sex);
            statement.setString(4, address);
            statement.setLong(5, user.getId());  // Thay user.getId() bằng cách lấy id của user cần cập nhật.

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserByName(String name) {
        String sql = " select * from user where name = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(null);

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByID(long id) {
        String sql = " select * from user where id = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(null);

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateImageByID(String source, long id) throws NoSuchAlgorithmException {
        try {
            String sql = "update image\n"
                    + " set source = ?\n"
                    + "where userid =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, source);
            statement.setLong(2, id);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void createUserCart(Long userid) {
        String sql = " insert into cart(total, userid)\n"
                + "values(0, ? ) ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, userid);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<User> getAllUsers() {
        ArrayList<User> list = new ArrayList<>();

        String sql = " select user.id, email, name, phone, address, sex, "
                + "status, roleid, role \n"
                + "from user join role on user.roleid = role.id "
                + "order by user.id asc";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setName(rs.getString("name"));
                u.setSex(rs.getBoolean("sex"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setStatus(rs.getBoolean("status"));
                u.setRole(new Role(rs.getLong("roleid"), rs.getString("role")));

                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
//    public User getUserById(long id) {
//    String sql = "SELECT u.id, u.name, u.sex, u.email, u.phone, u.status, r.id " +
//                 "FROM User u " +
//                 "JOIN Role r ON u.roleid = r.id " + 
//                 "WHERE u.id = ?";
//
//    try {
//        PreparedStatement statement = connection.prepareStatement(sql);
//        statement.setLong(1, id);
//        ResultSet rs = statement.executeQuery();
//
//        if (rs.next()) {
//            User u = new User();
//            u.setId(rs.getLong("id"));
//            u.setEmail(rs.getString("email"));
//            u.setName(rs.getString("name"));
//            u.setPhone(rs.getString("phone"));
//            u.setSex(rs.getBoolean("sex"));
//            u.setStatus(rs.getBoolean("status"));
//            // Tạo đối tượng Role từ dữ liệu cột role
//            Role role = new Role();
//            role.setRole(rs.getString("role"));
//            u.setRole(role);
//
//            return u;
//        }
//    } catch (SQLException e) {
//        System.out.println(e);
//    }
//    return null;
//}

    public User getUserById(long id) {
        String sql = "SELECT u.id, u.name, u.sex, u.email, u.phone, u.status, u.roleid "
                + "FROM User u "
                + "WHERE u.id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                Role role = new Role();
                role.setId(rs.getLong("roleid"));
                u.setRole(role);

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateRoleAndStatus(User user, int roleId, boolean status) {
        try {
            String sql = "UPDATE User SET roleid = ?, status = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roleId);
            statement.setBoolean(2, status);
            statement.setLong(3, user.getId());
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addUser(String email, String password, String name, String phone, String address, boolean sex) throws NoSuchAlgorithmException {
        String sql = " insert into user(email, password, name, phone, address, sex, status, roleid)\n "
                + " values(?, ?, ?, ?, ?, ?, 1, 1) ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, BusinessRule.encodePassword(password));
            statement.setString(3, name);
            statement.setString(4, phone);
            statement.setString(5, address);
            statement.setBoolean(6, sex);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//     public static void main(String[] args) throws NoSuchAlgorithmException {
//        UserDAO udb = new UserDAO();
//        udb.addUser("manhhieu2678@gmail.com", "Manhhieu123", "NguyenManhHieu2", "0565021699", "HaiPhong", true);
//    }
//     

    public List<User> get5LastestUsers() {
        ArrayList<User> users = new ArrayList<>();

        String sql = "SELECT * FROM user where roleid = 1 order by id desc limit 5";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));

                users.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return users;

    }

}
