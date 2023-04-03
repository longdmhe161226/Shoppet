/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.CategoryDAO;
import dal.ImageProductDAO;
import dal.OriginDAO;
import dal.ProductDAO;
import dal.PetDAO;
import dal.SubCategoryDAO;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import models.Category;
import models.ImageProduct;
import models.Origin;
import models.Pet;
import models.Product;
import models.SubCategory;

/**
 *
 * @author 12050
 */
public class ProductService {

    private ProductDAO productDAO = null;
    private PetDAO petDAO = null;
    private ImageProductDAO ImageProductDAO = null;
    private OriginDAO OriginDAO = null;
    private CategoryService categoryService = null;

    public ProductService() {
        productDAO = new ProductDAO();
        petDAO = new PetDAO();
        ImageProductDAO = new ImageProductDAO();
        OriginDAO = new OriginDAO();
        categoryService = new CategoryService();

    }

    public Product getAllInforProductPet(int x) {
        Product p = productDAO.getProductById(x);
        List<ImageProduct> img = ImageProductDAO.getImagebyProductID(p.getId());
        List<Pet> petz = petDAO.getListPetByID(p.getPetId());
        List<Origin> o = OriginDAO.getListOrigins(p.getOriginId());
        List<SubCategory> sub = categoryService.getSubAndCategoryByID(p.getSubcategoryId());
        p.setImageProduct(img);
        p.setPet(petz);
        p.setOrigin(o);
        p.setSubCategorys(sub);
        return p;
    }

    public Product getAllInforProductAccessory(int x) {
        Product p = productDAO.getProductById(x);
        List<ImageProduct> img = ImageProductDAO.getImagebyProductID(p.getId());
        List<Origin> o = OriginDAO.getListOrigins(p.getOriginId());
        List<SubCategory> sub = categoryService.getSubAndCategoryByID(p.getSubcategoryId());
        p.setImageProduct(img);
        p.setOrigin(o);
        p.setSubCategorys(sub);
        return p;
    }

    public List<Product> getPagingImgProduct(int limit, int offset) {
        List<Product> p = productDAO.pagingProducts(limit, offset);
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }

        }

        return p;
    }

    public List<Product> getPagingAllInfor(int limit, int offset) {
        List<Product> p = productDAO.pagingProducts(limit, offset);
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public List<Product> getSearchImgProductByName(int x, String txtsearch) {
        List<Product> p = productDAO.Search(x, x, txtsearch);
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
        }
        return p;
    }

    public List<Product> getSearchImgProductPetByName(int x, String txtsearch) {
        List<Product> p = getSearchImgProductByName(x, txtsearch);
        for (Product product : p) {
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }

        }
        return p;
    }

    public List<Product> getSearchImgProductPetOriginByName(int x, String txtsearch) {
        List<Product> p = getSearchImgProductPetByName(x, txtsearch);
        for (Product product : p) {
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }

        }
        return p;
    }

    public List<Product> SearchFilter(String color, float start_price, float end_price, String region, int count, int index) {
        List<Product> p = productDAO.SearchByPrice(color, start_price, end_price, region, count, index);
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public List<Product> SearchAllInforProductByName(int x, String txtsearch) {
        List<Product> p = getSearchImgProductPetOriginByName(x, txtsearch);
        for (Product product : p) {
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }
        }
        return p;
    }

    public List<Product> getPagingAllInforRandom(String code) {
        List<Product> p = productDAO.pagingProductsByRandom(code);
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public List<Product> getProductsById(ArrayList<Integer> productIds) {
        List<Product> products = productDAO.getProductsById(productIds);
        return products;
    }

    public List<Product> getRelativeProduct(int idSubCategory, int idPet, boolean check) {
        List<Product> p = null;
        if (check == true) {
            p = productDAO.getProductRelativePet(idSubCategory, idPet);
        } else {
            p = productDAO.getProductRelativeAccessory(idSubCategory, idPet);
        }
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public List<Product> getSearchAllProductbyCategoryID(int count, int index, int categoryId, boolean check) {
        List<Product> p = null;
        if (check) {
            p = productDAO.SearchProductByCategoryPet(categoryId, count, index);
        } else {
            p = productDAO.SearchProductByCategoryAsscessory(categoryId, count, index);
        }
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public List<Product> sortPriceAce(int count, int index, int categoryId, boolean check) {
        List<Product> p = null;
        if (check) {
            p = productDAO.sortPetPriceAsc(categoryId, count, index);
        } else {
            p = productDAO.sortAccessoryPriceAsc(categoryId, count, index);
        }
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }
        return p;
    }

    public List<Product> filterColor(int categoryId, String color) {
        List<Product> p = null;
        p = productDAO.filterColorPet(categoryId, color);
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public List<Product> searchProduct(int categoryId, String search, boolean check) {
        List<Product> p = null;
        if (check) {
            p = productDAO.searchProductPet(categoryId, search);
        } else {
            p = productDAO.searchProductAccessory(categoryId, search);
        }
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public Product getProductById(int productId) {
       Product p = productDAO.getProductById(productId);
      
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(p.getId());
            List<Pet> petz = petDAO.getListPetByID(p.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(p.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(p.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (p.getId() == imageProduct.getProductId()) {
                    p.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (p.getPetId() == pet.getId()) {
                    p.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (p.getOriginId() == origin.getId()) {
                    p.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (p.getSubcategoryId() == subCategory.getId()) {
                    p.setSubCategorys(sub);
                }
            }

        return p;
    }
    
    public List<Product> searchProductAdmin(String search) {
        List<Product> p = productDAO.searchProductAdmin(search);
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public List<Product> sortPriceDesc(int count, int index, int categoryId, boolean check) {
        List<Product> p = null;
        if (check) {
            p = productDAO.sortPetPriceDesc(categoryId, count, index);
        } else {
            p = productDAO.sortAccessoryPriceDesc(categoryId, count, index);
        }
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }

        return p;
    }

    public List<Product> filterSubCategory(int subCategoryId, boolean check) {
        List<Product> p = null;
        if (check) {
            p = productDAO.filterSubCategoryPet(subCategoryId);
        } else {
            p = productDAO.filterSubCategoryAccessory(subCategoryId);
        }
        for (Product product : p) {
            List<ImageProduct> img = ImageProductDAO.getImagebyProductID(product.getId());
            List<Pet> petz = petDAO.getListPetByID(product.getPetId());
            List<Origin> o = OriginDAO.getListOrigins(product.getOriginId());
            List<SubCategory> sub = categoryService.getSubAndCategoryByID(product.getSubcategoryId());
            for (ImageProduct imageProduct : img) {
                if (product.getId() == imageProduct.getProductId()) {
                    product.setImageProduct(img);
                }
            }
            for (Pet pet : petz) {
                if (product.getPetId() == pet.getId()) {
                    product.setPet(petz);
                }

            }
            for (Origin origin : o) {
                if (product.getOriginId() == origin.getId()) {
                    product.setOrigin(o);
                }

            }
            for (SubCategory subCategory : sub) {
                if (product.getSubcategoryId() == subCategory.getId()) {
                    product.setSubCategorys(sub);
                }
            }

        }
        return p;
    }

    public void InsertProduct(String name, String code, double price, int quantity, String description, int subId, int originId, List<ImageProduct> listImg) {
        int count1 = productDAO.getMaxIdProduct();
        int countproduct = count1 + 1;
        int count2 = ImageProductDAO.getMaxIDImg();
        int countimg = count2 + 1;
        productDAO.insertProduct(countproduct, name, code, price, quantity, description, subId, originId);
        ImageProductDAO.insertImgProduct(countimg, listImg.get(0).getImg(), countproduct);

    }

    public void InsertProductIsPet(Product p, Pet p1, List<ImageProduct> listImg) {
        int count1 = productDAO.getMaxIdProduct();
        int countproduct = count1 + 1;
        int count2 = ImageProductDAO.getMaxIDImg();
        int countimg = count2 + 1;
        int count3 = petDAO.getMaxIdPet();
        int countpet = count3 + 1;
        petDAO.insertPet(countproduct, p1.getDob(), p1.getHealthStatus(), p1.isGender(), p1.getWeight(),
                p1.getColor(), p1.isVaccinated(), p1.getIdentification());
        productDAO.insertProductIsPet(countproduct, p.getName(), p.getCode(), p.getPrice(),
                p.getQuantity(), p.getDescription(), countproduct, p.getSubcategoryId(), p.getOriginId());
        ImageProductDAO.insertImgProduct(countimg, listImg.get(0).getImg(), countproduct);
    }

    public void updateProductAccessory(int id, String name, String code, double price, int quantity, String description, int subId, int originId, String img) {
        productDAO.updateProduct(id, name, code, price, quantity, description, subId, originId);
        ImageProductDAO.updateImgProduct(id, img);
    }

    public void updateProductPet(int id, String name, String code, double price, int quantity, String description, int subId, int petId, int originId, Date dateOfBirth, String healthStatus, boolean gender, double weight, String color, boolean vaccinated, String identification, String img) {
        productDAO.updateProductIsPet(id, name, code, price, quantity, description, subId, originId);
        petDAO.updatePet(petId, dateOfBirth, healthStatus, gender, weight, color, vaccinated, identification);
        ImageProductDAO.updateImgProduct(id, img);

    }

    public void deleteProductService(int id) {
        Product p = productDAO.getProductById(id);
        if (p.getPetId() > 0) {
            ImageProductDAO.deleteImgProduct(p.getId());
            productDAO.deleteProduct(id);
            petDAO.deletePet(p.getPetId());

        } else {
            ImageProductDAO.deleteImgProduct(p.getId());
            productDAO.deleteProduct(id);

        }

    }

    public static void main(String[] args) {
        ProductService d = new ProductService();
        System.out.println(d.searchProductAdmin("dog"));
//        System.out.println(d.searchProduct(1, "Bull", true));
//        System.out.println(d.getSearchImgProductPetOriginByName(1, "bull"));
//        System.out.println(d.getRelativeProduct());
        //System.out.println(d.SearchFilter("black", 3000000, 5000000, "f", 3, 1));
        //System.out.println(d.getAllInforProduct(1, "a"));
    }
}
