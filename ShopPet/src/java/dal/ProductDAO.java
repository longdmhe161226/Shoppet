/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.ProductMapping;
import mapping.SubCategoryMapping;
import models.SubCategory;

public class ProductDAO {

    DBContext db = DBContext.getInstance();
    Connection connection = null;
    ResultSet rs = null;
    PreparedStatement stm = null;

    ImageProductDAO imageProductDAO = new ImageProductDAO();

    // lay ra san pham dua theo productId (id)
    public Product getProductById(int id) {

        try {
            String sql = "SELECT * FROM product WHERE id = " + id;
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                products.setImageProduct(imageProductDAO.getImagebyProductID(products.getId()));
                return products;
            }
        } catch (Exception e) {

        }
        return null;
    }

    // lay ra tat ca product
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String query = "select * from Product";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }

        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//           finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> getProductsById(ArrayList<Integer> productIds) {
        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String query = "select * from shop_pet.Product where id  in ( ";
            String temp = "0,";
            for (int i = 0; i < productIds.size(); i++) {
                temp += ",?";
            }
            temp = temp.replaceFirst(",", "");
            temp += ")";

            query = query + temp;
            stm = connection.prepareStatement(query);
            for (int i = 0; i < productIds.size(); i++) {
                stm.setInt(i + 1, productIds.get(i));

            }
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = ProductMapping.daoToObject(rs);
                product.setImageProduct(imageProductDAO.getImagebyProductID(product.getId()));

                list.add(product);

            }

        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//           finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    // sum tong so san pham
    public int getTotalProducts() {

        try {

            connection = db.getConnection();
            String sql = "select count(*) from shop_pet.product";
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
    public int getMaxIdProduct() {

        try {

            connection = db.getConnection();
            String sql = "select max(id) from shop_pet.product";
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

    // phan trang san pham
    public List<Product> pagingProducts(int limit, int index) {
        List<Product> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String sql = "select * from shop_pet.product LIMIT ? OFFSET ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, limit);
            stm.setInt(2, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);

                list.add(products);
            }

        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    // dem so san pham co ten 
    public int countProduct(String txtsearch) {

        try {
            String sql = "select count(*) from shop_pet.product where name like ?";
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + txtsearch + "%");
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

    // tim kiem san pham
    public List<Product> Search(int index, int size, String txtsearch) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "WITH x AS (SELECT @row := @row + 1 AS r, h.* \n"
                    + "FROM shop_pet.product h, (SELECT @row := 0) AS init \n"
                    + "              WHERE name like ?) \n"
                    + "              SELECT * FROM x WHERE r BETWEEN (? - 1) * 6 + 1 AND ? * 6";
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + txtsearch + "%");
            stm.setInt(2, index);
            stm.setInt(3, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> SearchByPrice(String color, float start_price, float end_price, String region, int count, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *"
                + " FROM shop_pet.product spp2  inner join  shop_pet.Pet spp on spp.id=spp2.pet_id"
                + " inner join shop_pet.origin spo on spp2.origin_id=spo.id "
                + "where spp.color  like ? and spp2.price >= ? and spp2.price <= ? and spo.region like ?"
                + "order by spp2.name limit ? offset ?";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + color + "%");
            stm.setFloat(2, start_price);
            stm.setFloat(3, end_price);
            stm.setString(4, "%" + region + "%");
            stm.setInt(5, count);
            stm.setInt(6, (index - 1) * count);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> pagingProductsByRandom(String code) {
        List<Product> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String sql = "select * from shop_pet.product spp inner join shop_pet.pet spp2 on spp.pet_id=spp2.id where spp.code like ? ORDER BY RAND() LIMIT 5";
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + code + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);

                list.add(products);
            }

        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> getProductRelativePet(int id_subcategory, int id) {
        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String query = "select*from shop_pet.product spp inner join shop_pet.subcategory sps on spp.subcategory_id = sps.id inner join shop_pet.pet spp2 on spp.pet_id = spp2.id where spp.subcategory_id = ? and spp.id != ?;";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id_subcategory);
            stm.setInt(2, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }

        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//           finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> getProductRelativeAccessory(int id_subcategory, int id) {
        List<Product> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String query = "select*from shop_pet.product spp inner join shop_pet.subcategory sps \n"
                    + "on spp.subcategory_id = sps.id  where spp.subcategory_id = ? and spp.id != ?;";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id_subcategory);
            stm.setInt(2, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }

        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//           finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> SearchProductByCategoryPet(int categoryid, int count, int index) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "SELECT *\n"
                    + "                 FROM shop_pet.product spp2 inner join shop_pet.Pet spp on spp.id=spp2.pet_id\n"
                    + "                 inner join shop_pet.origin spo on spp2.origin_id=spo.id \n"
                    + "                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                 inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                where spc.id = ?\n"
                    + "                limit ? offset ?;";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryid);
            stm.setInt(2, count);
            stm.setInt(3, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> sortPetPriceAsc(int categoryid, int count, int index) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "SELECT *   FROM shop_pet.product spp2  inner join shop_pet.Pet spp on spp.id=spp2.pet_id\n"
                    + "                                 inner join shop_pet.origin spo on spp2.origin_id=spo.id\n"
                    + "                                  inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                                   inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                 where 1 = 1 ";
            if (categoryid != 0) {
                sql += " and spc.id= " + categoryid;
            }
            sql += " order by spp2.price asc limit ? offset ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, count);
            stm.setInt(2, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> sortPetPriceDesc(int categoryid, int count, int index) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "SELECT *   FROM shop_pet.product spp2 inner join  shop_pet.Pet spp on spp.id=spp2.pet_id\n"
                    + "                                 inner join shop_pet.origin spo on spp2.origin_id=spo.id\n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                                  inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                 where 1 = 1 ";
            if (categoryid != 0) {
                sql += " and spc.id= " + categoryid;
            }
            sql += " order by spp2.price desc limit ? offset ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, count);
            stm.setInt(2, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> SearchProductByCategoryAsscessory(int categoryid, int count, int index) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "  SELECT *      FROM  shop_pet.product spp2 \n"
                    + "                                inner join shop_pet.origin spo on spp2.origin_id=spo.id \n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                                inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                 where spc.id = ?\n"
                    + "                                    limit ? offset ? ;";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryid);
            stm.setInt(2, count);
            stm.setInt(3, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> sortAccessoryPriceAsc(int categoryid, int count, int index) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "  SELECT *      FROM  shop_pet.product spp2 \n"
                    + "                                inner join shop_pet.origin spo on spp2.origin_id=spo.id \n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                                inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                 where 1=1";
            if (categoryid != 0) {
                sql += " and spc.id= " + categoryid;
            }
            sql += " order by spp2.price asc limit ? offset ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, count);
            stm.setInt(2, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> sortAccessoryPriceDesc(int categoryid, int count, int index) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "  SELECT *      FROM  shop_pet.product spp2 \n"
                    + "                                inner join shop_pet.origin spo on spp2.origin_id=spo.id \n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                                inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                 where 1=1";
            if (categoryid != 0) {
                sql += " and spc.id= " + categoryid;
            }
            sql += " order by spp2.price desc limit ? offset ?";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, count);
            stm.setInt(2, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> filterColorPet(int categoryid, String color) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "SELECT *  FROM shop_pet.product spp2 inner join  shop_pet.Pet spp on spp.id=spp2.pet_id\n"
                    + "                                 inner join shop_pet.origin spo on spp2.origin_id=spo.id\n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                                  inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                 where 1 = 1 ";
            if (categoryid != 0) {
                sql += " and spc.id= " + categoryid;
            }
            if (color != null | color.equals("")) {
                sql += " and spp.color in ('" + color + "')";
            }

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> filterSubCategoryPet(int subCategoryId) {

        List<Product> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String sql = "SELECT *    FROM shop_pet.product spp2 inner join shop_pet.Pet spp on spp.id=spp2.pet_id\n"
                    + "                                 inner join shop_pet.origin spo on spp2.origin_id=spo.id\n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id      \n"
                    + "                                 inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                where  sps.id= ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, subCategoryId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> filterSubCategoryAccessory(int subCategoryId) {

        List<Product> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String sql = "SELECT *  FROM  shop_pet.product spp2\n"
                    + "                                 inner join shop_pet.origin spo on spp2.origin_id=spo.id\n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id      \n"
                    + "                                 inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                where  sps.id= ?   ";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, subCategoryId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> searchProductPet(int categoryid, String search) {

        List<Product> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String sql = "SELECT *  FROM shop_pet.product spp2 inner join  shop_pet.Pet spp on spp.id=spp2.pet_id\n"
                    + "                                 inner join shop_pet.origin spo on spp2.origin_id=spo.id\n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                                  inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                 where 1 = 1";
            if (categoryid != 0) {
                sql += " and spc.id= " + categoryid;
            }
            if (search != null && !search.equals("")) {
                sql += " and( spp2.name like '%" + search + "%' or spo.region like '%" + search + "%')";
            }
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> searchProductAdmin(String search) {

        List<Product> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String sql = "SELECT *  FROM shop_pet.product spp2 \n"
                    + "    inner join shop_pet.origin spo on spp2.origin_id=spo.id\n"
                    + "      inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "         inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "         where 1=1";
            if (search != null && !search.equals("")) {
                sql += " and( spp2.name like '%" + search + "%' )";
            }
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public List<Product> searchProductAccessory(int categoryid, String search) {

        List<Product> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String sql = "SELECT *      FROM  shop_pet.product spp2 \n"
                    + "							inner join shop_pet.origin spo on spp2.origin_id=spo.id \n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "							inner join shop_pet.category spc on sps.category_id=spc.id \n"
                    + "                                 where 1=1  ";
            if (categoryid != 0) {
                sql += " and spc.id= " + categoryid;
            }
            if (search != null && !search.equals("")) {
                sql += " and( spp2.name like '%" + search + "%' or spo.region like '%" + search + "%')";
            }
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product products = ProductMapping.daoToObject(rs);
                list.add(products);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

//   lay ra All productByCategoryID
//    select * from category as c join subcategory as s   join product as p where c.id=s.category_id and c.id=1 and p.subcategory_id= s.id;
    public int getNumberProductsByCategoryID(int categoryId) {

        try {

            connection = db.getConnection();
            String sql = "select count(*) from category as c join subcategory as s "
                    + "  join product as p where  c.id= ? and c.id=s.category_id and p.subcategory_id= s.id;";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            if (rs.next()) {
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

//        get NamesubCategory by categoryId;
//     select s.name from subcategory as s join category as c where s.category_id=c.id and c.id=2;
    public List<SubCategory> getNameSubCategoryByCategoryId(int categoryId) {
        List<SubCategory> getNameSubCategory = new ArrayList<>();
        try {

            connection = db.getConnection();
            String sql = "select * from subcategory where category_id= ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            while (rs.next()) {
                SubCategory s = SubCategoryMapping.daoToObject(rs);
                getNameSubCategory.add(s);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return getNameSubCategory;
    }

    // lay ra petId tu categoryId
    public boolean getPetIdFromCategoryId(int categoryid) {
        boolean check = false;
        try {
            connection = db.getConnection();
            String sql = " select pet_id from product as p join category as c join subcategory as s where c.id=s.category_id and c.id=? and p.subcategory_id=s.id";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryid);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (rs.getString(1) == null) {
                    check = false;
                } else {
                    check = true;
                }
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return check;
    }

    public boolean getPetIdFromSubCategoryId(int subCategoryid) {
        boolean check = false;
        try {
            connection = db.getConnection();
            String sql = "  select pet_id from product as p "
                    + " join subcategory as s where p.subcategory_id=s.id"
                    + " and s.id=?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, subCategoryid);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (rs.getString(1) == null) {
                    check = false;
                } else {
                    check = true;
                }
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return check;
    }

    public boolean getPetIdFromProductId(int productId) {
        boolean check = false;
        try {
            connection = db.getConnection();
            String sql = "select pet_id from product where id=?;";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            rs = stm.executeQuery();
            while (rs.next()) {
                if (rs.getString(1) == null) {
                    check = false;
                } else {
                    check = true;
                }
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return check;
    }

    public int getsubCategoryfromproductId(int productId) {
        int subCategory = 0;
        try {
            connection = db.getConnection();
            String sql = " select subcategory_id from product where id=? ;";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            rs = stm.executeQuery();
            while (rs.next()) {
                subCategory = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return subCategory;
    }

    public int getCategoryIdfromproductId(int productId) {
        int subCategory = 0;
        try {
            connection = db.getConnection();
            String sql = " select category_id from category c inner join subcategory as s inner join product  p where c.id=s.category_id and p.subcategory_id=s.id and p.id=? ;";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            rs = stm.executeQuery();
            while (rs.next()) {
                subCategory = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return subCategory;
    }

    public void insertProductIsPet(int id, String name, String code, double price, int quantity, String description, int petId, int subId, int originId) {
        try {
            connection = db.getConnection();
            String query = "INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`pet_id`, `subcategory_id`,`origin_id`) VALUES(?,?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            stm.setString(2, name);
            stm.setString(3, code);
            stm.setDouble(4, price);
            stm.setInt(5, quantity);
            stm.setString(6, description);
            stm.setInt(7, petId);
            stm.setInt(8, subId);
            stm.setInt(9, originId);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateProductIsPet(int id, String name, String code, double price, int quantity, String description, int subId, int originId) {
        try {
            connection = db.getConnection();
            String query = "UPDATE  `shop_pet`.`product` set  `name`=?, `code`=?, `price`=?, `quantity`=?, `description`=?,`subcategory_id`=?,`origin_id`=? WHERE id = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, code);
            stm.setDouble(3, price);
            stm.setInt(4, quantity);
            stm.setString(5, description);
            stm.setInt(6, subId);
            stm.setInt(7, originId);
            stm.setInt(8, id);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void insertProduct(int id, String name, String code, double price, int quantity, String description, int subId, int originId) {
        try {
            connection = db.getConnection();
            String query = "INSERT INTO `shop_pet`.`product` (`id`, `name`, `code`, `price`, `quantity`, `description`,`subcategory_id`,`origin_id`) VALUES(?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            stm.setString(2, name);
            stm.setString(3, code);
            stm.setDouble(4, price);
            stm.setInt(5, quantity);
            stm.setString(6, description);
            stm.setInt(7, subId);
            stm.setInt(8, originId);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateProduct(int id, String name, String code, double price, int quantity, String description, int subId, int originId) {
        try {
            connection = db.getConnection();
            String query = "UPDATE `shop_pet`.`product` set `name`=?, `code`=?, `price`=?, `quantity`=?, `description`=?,`subcategory_id`=?,`origin_id`=? WHERE id = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, code);
            stm.setDouble(3, price);
            stm.setInt(4, quantity);
            stm.setString(5, description);
            stm.setInt(6, subId);
            stm.setInt(7, originId);
            stm.setInt(8, id);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateProductQuantity(int id, int quantity) {
        try {
            connection = db.getConnection();
            String query = "UPDATE `shop_pet`.`product` set `quantity`=? WHERE id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, quantity);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    public int countPetId() {
        int count = 0;
        try {
            connection = db.getConnection();
            String sql = "SELECT count(pet_id)  FROM shop_pet.product spp2 inner join  shop_pet.Pet spp on spp.id=spp2.pet_id\n"
                    + "                                 inner join shop_pet.origin spo on spp2.origin_id=spo.id\n"
                    + "                                 inner join shop_pet.subcategory sps on sps.id=spp2.subcategory_id\n"
                    + "                                  inner join shop_pet.category spc on sps.category_id=spc.id ;";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return count;
    }

    public int countOriginId() {
        int count = 0;
        try {
            connection = db.getConnection();
            String sql = " select count(*) from origin;";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return count;
    }

    public void deleteProduct(int id) {
        try {
            connection = db.getConnection();
            String query = "delete from product where id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    public int countProduct() {
        int count=0;
        try {
            connection = db.getConnection();
            String query = " select count(*)  from product";
            stm = connection.prepareStatement(query);
            rs=stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }


    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        System.out.println(p.countProduct());
    }
}
