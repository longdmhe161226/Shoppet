/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AppConfig;

/**
 *
 * @author 12050
 */
public class AppConfig {
    public static  enum Session {
        CUSTOMER_LOGIN("Shop_Pet_Customer"), ADMIN_LOGIN("2"),;

        private String value;

        private Session(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }

    }

    public static enum Cooky {
        CartCookies("Phop_pet_Cart_item") , CUSTOMER_N("2"), FALL("3"), WINTER("4");

        private String value;

        private Cooky(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }

    }
}
