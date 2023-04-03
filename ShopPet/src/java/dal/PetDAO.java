/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.PetMapping;
import models.Pet;

/**
 *
 * @author 12050
 */
public class PetDAO {

    Connection connection = null;
    ResultSet rs = null;
    PreparedStatement stm = null;
    DBContext db = DBContext.getInstance();

    public List<Pet> getAllPet() {
        List<Pet> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String query = "select * from shop_pet.Pet";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Pet pets = PetMapping.daoToObject(rs);
                list.add(pets);
            }

        } catch (Exception e) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Pet> getListPetByID(int id) {
        List<Pet> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "SELECT * FROM shop_pet.Pet WHERE id = " + id;
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Pet pets = PetMapping.daoToObject(rs);
                list.add(pets);
            }

        } catch (Exception e) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Pet> getListPetByColor(String color) {

        List<Pet> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "SELECT * FROM shop_pet.Pet WHERE color like " + color;
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + color + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Pet pets = PetMapping.daoToObject(rs);
                list.add(pets);
            }

        } catch (Exception e) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public Pet getPetByID(int id) {
        // Thực hiện truy vấn tới database để lấy thông tin sản phẩm dựa theo id
        // Ví dụ:

        try {
            connection = db.getConnection();
            String sql = "SELECT * FROM shop_pet.Pet WHERE id = " + id;
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                Pet pets = PetMapping.daoToObject(rs);
                return pets;
            }
        } catch (Exception e) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return null;
    }

    public void insertPet(int id, Date dateOfBirth, String healthStatus, boolean gender, double weight, String color, boolean vaccinated, String identification) {
        try {
            connection = db.getConnection();
            String query = "INSERT INTO `shop_pet`.`pet` (`id`, `date_of_birth`, `health_status`, `gender`, `weight`, `color`, `vaccinated`, `identification`) VALUES(?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            stm.setDate(2, dateOfBirth);
            stm.setString(3, healthStatus);
            stm.setBoolean(4, gender);
            stm.setDouble(5, weight);
            stm.setString(6, color);
            stm.setBoolean(7, vaccinated);
            stm.setString(8, identification);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int getTotalPet() {

        try {

            connection = db.getConnection();
            String sql = "select count(*) from `shop_pet`.`pet`";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return 0;
    }
    public int getMaxIdPet() {

        try {

            connection = db.getConnection();
            String sql = "select max(id) from shop_pet.pet";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return 0;
    }

    public void updatePet(int id, Date dateOfBirth, String healthStatus, boolean gender, double weight, String color, boolean vaccinated, String identification) {
        try {
            connection = db.getConnection();
            String query = "UPDATE `shop_pet`.`pet` SET  `date_of_birth`=?, `health_status`=?, `gender`=?, `weight`=?, `color`=?, `vaccinated`=?, `identification`=? WHERE id = ?";
            stm = connection.prepareStatement(query);
            stm.setDate(1, dateOfBirth);
            stm.setString(2, healthStatus);
            stm.setBoolean(3, gender);
            stm.setDouble(4, weight);
            stm.setString(5, color);
            stm.setBoolean(6, vaccinated);
            stm.setString(7, identification);
            stm.setInt(8, id);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deletePet(int id) {
        try {
            connection = db.getConnection();
            String query = "DELETE  from pet  WHERE id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);

            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void main(String[] args) {
        PetDAO p = new PetDAO();
        System.out.println(p.getPetByID(1));
    }
}
