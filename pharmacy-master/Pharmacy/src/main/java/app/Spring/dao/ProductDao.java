package app.Spring.dao;

import java.util.List;

import app.Spring.domain.Category;
import app.Spring.domain.Product;
import app.Spring.domain.ProductType;
import app.Spring.domain.User;




public interface ProductDao {

	Product getProduct(Long id);

	public void saveOrUpdateProduct(Product v);

	public void deleteProduct(Product v);

	
	
	List<Category> getCategories();
	
	List<ProductType> getTypes();
	
	public Long findProductIdByName(String name);

	List<User> checkUser(String login, String password);

	List<Product> findProduct(String name);

	public List<Product> getAll();

	public List<Product> Pagination(int page);

	public List<Product> AllPages(int page, int limit);

	public List<Product> AllPagesRecipe(int page, int limit,int value);
	public int getNumOfPages();
	
	public int getNumOfPagesRecipe();
	
	
	List<Product> getProductsByCategory(Category category);

	List<Product> PaginationRecipe(int i, int j);
	
}