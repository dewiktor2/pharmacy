package app.Spring.domain;



import java.util.Collection;
import java.util.List;

public class CartOrder {

        private String userName;

        private List<Cart> items;
        private Product product;
        

        public CartOrder() {
        }

        public CartOrder(String userName, List<Cart> items) {
                this.userName = userName;
                this.items = items;
        }

        public String getUserName() {
                return userName;
        }

        public void setUserName(String userName) {
                this.userName = userName;
        }

        public List<Cart> getItems() {
                return items;
        }

        public void setItems(List<Cart> items) {
                this.items = items;
        }
}