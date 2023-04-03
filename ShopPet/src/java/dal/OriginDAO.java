/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.OriginMapping;
import models.Origin;


/**
 *
 * @author 12050
 */
public class OriginDAO {

    DBContext db = DBContext.getInstance();
    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public List<Origin> getAllOrigins() {
        List<Origin> list = new ArrayList<>();
        String sql = "select * from Origin";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Origin origins = OriginMapping.daoToObject(rs);
                list.add(origins);
            }

        } catch (Exception e) {
            Logger.getLogger(OriginDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Origin> getListOrigins(int id) {

        List<Origin> list = new ArrayList<>();
        String sql = "SELECT * FROM shop_pet.Origin WHERE id = " + id;
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Origin origins = OriginMapping.daoToObject(rs);
                list.add(origins);
            }

        } catch (Exception e) {
            Logger.getLogger(OriginDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Origin> getListOriginByRegion(String region) {

        List<Origin> list = new ArrayList<>();
        String sql = "SELECT * FROM shop_pet.Origin WHERE region like ? ";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + region + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Origin origins = OriginMapping.daoToObject(rs);
                list.add(origins);
            }

        } catch (Exception e) {
            Logger.getLogger(OriginDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public Origin getOriginByID(int id) {
        // Thực hiện truy vấn tới database để lấy thông tin sản phẩm dựa theo id
        // Ví dụ:

        try {
            String sql = "SELECT * FROM shop_pet.Origin WHERE id = " + id;
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                Origin origins = OriginMapping.daoToObject(rs);
                return origins;
            }
        } catch (Exception e) {
            Logger.getLogger(OriginDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return null;
    }
    public void insertOriginProduct(int id, String region) {
        try {
            connection = db.getConnection();
            String query = "INSERT INTO Origin (id, region)\n"
                    + "VALUES(?,?)";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            stm.setString(2, region);         
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    public int getIdOriginByName ( String name){
        int id=0;
         try {
            String sql = "select id from origin where region like ?";
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1,  name);
            rs = stm.executeQuery();
            if (rs.next()) {
                id=rs.getInt("id");
            }
        } catch (Exception e) {
            Logger.getLogger(OriginDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return id;
    }

    public static void main(String[] args) {
        OriginDAO a = new OriginDAO();
        System.out.println(a.getIdOriginByName("VietNam"));
    }
}
