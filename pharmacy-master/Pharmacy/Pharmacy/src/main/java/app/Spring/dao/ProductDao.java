package app.Spring.dao;

import java.util.List;




import app.Spring.domain.Product;
import app.Spring.domain.ProductType;




public interface ProductDao {

	Product getProduct(Long id);
	
	public void saveOrUpdateProduct(Product v);
	
	public void deleteProduct(Product v);
	
	List<Product> getAllProducts();
	
	List<ProductType> getProductTypes();
	
	boolean checkUser(String login, String password);

}