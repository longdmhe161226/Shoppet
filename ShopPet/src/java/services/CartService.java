/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.CartDAO;
import dal.CartItemDAO;
import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;
import models.Cart;
import models.CartItem;
import models.Product;

/**
 *
 * @author ADMIN
 */
public class CartService {

    private CartDAO cartDAO;
    private CartItemDAO cartItemDAO;
    private ProductDAO productDAO;

    public static void main(String[] args) {
        CartService service = new CartService();
        service.addCart(1, 1, 5);
    }

    public CartService() {
        cartDAO = new CartDAO();
        cartItemDAO = new CartItemDAO();
        productDAO = new ProductDAO();
    }

    public Cart createCart(int accountId) {
        Cart c = new Cart();
        c.setAccountId(accountId);
        return cartDAO.createCart(c);
    }

    public Cart getCart(int accountId) {
        Cart c = cartDAO.getCartByAccountId(accountId);
        if (c == null) {
            c = createCart(accountId);
        }

        ArrayList<CartItem> items = cartItemDAO.getCartItemByCartId(c.getId());
        ArrayList<Integer> pids = new ArrayList<>();

        // get list product
        for (CartItem item : items) {
            pids.add(item.getProductId());
        }

        List<Product> products = productDAO.getProductsById(pids);

        // get set product to item
        for (CartItem item : items) {
            for (Product product : products) {
                if (item.getProductId() == product.getId()) {
                    // Check Quanity cart with product
                    if (item.getQuantity() > product.getQuantity() || product.getQuantity()==0) {
                        // remoce cart
                        this.clearProductCart(accountId, item.getProductId());
                        items.remove(item);
                    } else {
                        item.setProduct(product);
                    }
                }

            }
        }

        c.setItems(items);

        return c;
    }

    public void addCart(int accountId, int productId, int quantity) {
        Cart c = cartDAO.getCartByAccountId(accountId);

        CartItem i = cartItemDAO.getCartItem(c.getId(), productId);
        Product p = productDAO.getProductById(productId);
        if (p != null) {
            // check cartItem exist
            if (i == null && p.getQuantity()>0 && quantity >0) {
                // not exist -> create cartItem
                if (p.getQuantity() < quantity) {
                    cartItemDAO.createCartItem(c.getId(), productId, p.getQuantity());
                } else {
                    cartItemDAO.createCartItem(c.getId(), productId, quantity);

                }

            } else {
                // exist -> update cartItem
                if (-quantity >= i.getQuantity()) {
                    cartItemDAO.deleteCartItem(i.getId());
                } else {

                    if ((i.getQuantity() + quantity) <= p.getQuantity()) {
                        cartItemDAO.updateCartItem(i.getId(), i.getQuantity() + quantity);
                    } else {
                        // is quantity to big get highest quantity
                        cartItemDAO.updateCartItem(i.getId(), p.getQuantity());
                    }
//                System.out.println("update" + i.getQuantity());
                }
            }
        }
    }

    public void clearCart(int accountId) {
        Cart c = cartDAO.getCartByAccountId(accountId);
        cartItemDAO.clearCartItem(c.getId());
    }

    public void clearProductCart(int accountId, int productId) {
        Cart c = cartDAO.getCartByAccountId(accountId);
        cartItemDAO.clearCartItemByProduct(c.getId(), productId);
    }
}
