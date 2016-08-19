package app.Spring.dao;

import java.util.List;

import app.Spring.domain.Category;
import app.Spring.domain.Product;
import app.Spring.domain.User;

public interface CategoryDao {

	
	public void add(Category category);

	public void saveOrUpdateCategory(Category v);

	public List<Category> getAllCategories();

	Category getCategory(Long id);

	public void deleteCategory(Category Category);
	
	
/*	public List<Category> Pagination(int page);

	public List<Category> AllPages(int page, int limit);

	public int getNumOfPages();*/
}
