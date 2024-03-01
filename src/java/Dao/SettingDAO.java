/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Setting;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class SettingDAO extends DBContext {

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public List<Setting> getSettings(int page, int PAGE_SIZE, String value) {
        List<Setting> settings = new ArrayList<>();
        try {
            con = connection;
            if (con != null) {
                String sql = "with t as (select ROW_NUMBER() over (order by S.settingId asc) as r,\n"
                        + "   S.* from Setting AS S where value like ?)\n"
                        + "   select * from t where r between ?*?-(?-1) and ?*?";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + value + "%");
                pst.setInt(2, page);
                pst.setInt(3, PAGE_SIZE);
                pst.setInt(4, PAGE_SIZE);
                pst.setInt(5, page);
                pst.setInt(6, PAGE_SIZE);
                rs = pst.executeQuery();
                while (rs.next()) {
                    Setting setting = new Setting();
                    setting.setSettingId(rs.getInt(1));
                    setting.setOrder(rs.getInt(5));
                    setting.setTypeId(rs.getString(2));
                    setting.setValue(rs.getString(4));
                    setting.setStatus(rs.getBoolean(3));
                    settings.add(setting);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return settings;

    }

    public List<Setting> getSettingsByTypeAndStatus(int page, int PAGE_SIZE, String type, boolean status) {
        List<Setting> settings = new ArrayList<>();
        try {
            con = connection;
            if (con != null) {
                String sql = "with t as (select ROW_NUMBER() over (order by S.settingId asc) as r,\n"
                        + "                    S.* from Setting AS S where typeId like ? and status = ?)\n"
                        + "                                                       select * from t where r between ?*?-(?-1) and ?*?";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + type + "%");
                pst.setBoolean(2, status);
                pst.setInt(3, page);
                pst.setInt(4, PAGE_SIZE);
                pst.setInt(5, PAGE_SIZE);
                pst.setInt(6, page);
                pst.setInt(7, PAGE_SIZE);
                rs = pst.executeQuery();
                while (rs.next()) {
                    Setting setting = new Setting();
                    setting.setSettingId(rs.getInt(1));
                    setting.setOrder(rs.getInt(5));
                    setting.setTypeId(rs.getString(2));
                    setting.setValue(rs.getString(4));
                    setting.setStatus(rs.getBoolean(3));
                    settings.add(setting);

                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return settings;

    }

    public boolean insertSetting(Setting setting) {
        try {
            con = connection;
            if (con != null) {
                String sql = "insert into Setting values (?,?, ?, ?);";
                pst = con.prepareStatement(sql);
                pst.setString(1, setting.getTypeId());
                pst.setBoolean(2, setting.isStatus());
                pst.setString(3, setting.getValue());
                pst.setInt(4, setting.getOrder());
                if (pst.executeUpdate() > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean updateSetting(Setting setting) {
        try {
            con = connection;
            if (con != null) {
                String sql = "UPDATE `swp391`.`settting`\n"
                        + "SET\n"
                        + "`type` = ?,\n"
                        + "`status` = ?,\n"
                        + "`value` = ?,\n"
                        + "`order` = ?\n"
                        + "WHERE `settingId` = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, setting.getTypeId());
                pst.setBoolean(2, setting.isStatus());
                pst.setString(3, setting.getValue());
                pst.setInt(4, setting.getOrder());
                pst.setInt(5, setting.getSettingId());
                if (pst.executeUpdate() > 0) {
                    return true;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public int getTotalSetting() {
        try {
            con = connection;
            if (con != null) {
                String sql = "select count(settingId) as total\n"
                        + "from Setting";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public Setting getSettingById(int SettingId) {
        try {
            con = connection;
            if (con != null) {
                String sql = "Select * from Setting where settingId = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, SettingId);
                rs = pst.executeQuery();
                if (rs.next()) {
                    Setting setting = new Setting();
                    setting.setSettingId(rs.getInt(1));
                    setting.setOrder(rs.getInt(5));
                    setting.setTypeId(rs.getString(2));
                    setting.setValue(rs.getString(4));
                    setting.setStatus(rs.getBoolean(3));
                    return setting;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public boolean updateSettingStatus(int settingId, boolean status) {
        try {
            con = connection;
            if (con != null) {
                String sql = "update Setting set status = ? where settingId = ?";
                pst = con.prepareStatement(sql);
                pst.setBoolean(1, status);
                pst.setInt(2, settingId);

                if (pst.executeUpdate() > 0) {
                    return true;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
