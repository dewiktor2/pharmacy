package app.Spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import app.Spring.domain.Category;
import app.Spring.domain.Product;
import app.Spring.domain.ProductType;
import app.Spring.domain.User;

public class ProductDaoImpl implements ProductDao {

	
	protected final Logger log = LoggerFactory.getLogger(getClass());

	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Product> findProduct(String name) {

		String hqlQuery = "FROM " + Product.class.getName()
				+ " v WHERE v.name=:name ";

		Query query = sessionFactory.getCurrentSession().createQuery(hqlQuery)
				.setParameter("name", name);

		return (List<Product>) query.list();
	}

	public List<Category> getCategories() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"FROM " + Category.class.getName());
		return (List<Category>) query.list();
	}

	public List<ProductType> getTypes() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"FROM " + ProductType.class.getName());
		return (List<ProductType>) query.list();
	}

	@Override
	public Product getProduct(Long id) {
		return (Product) sessionFactory.getCurrentSession().get(
				Product.class.getName(), id);
	}



	public void saveOrUpdateProduct(Product v) {

		sessionFactory.getCurrentSession().saveOrUpdate(v);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public List<User> checkUser(String login, String password) {

		// Ta funkcja oczywi�cie powinna korzysta� z bazy

		Query query = sessionFactory.getCurrentSession().createQuery(
				"FROM " + User.class.getName());
		return (List<User>) query.list();
	}

	@Override
	public void deleteProduct(Product v) {
		sessionFactory.getCurrentSession().delete(v);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public List<Product> getAll() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery(
				"FROM " + Product.class.getName());
		return (List<Product>) query.list();
	}


	@SuppressWarnings("unchecked")
	public List<Product> AllPagesRecipe(int page, int limit,int value) {

		int firstResult;
		if (page == 1)
			firstResult = 0;
		else
			firstResult = (limit * page) - limit;
		
	
		
		
		Query query = sessionFactory.getCurrentSession()
				.createQuery("select co from Product co where co.type= '" + 1 + "'")
				.setFirstResult(firstResult).setMaxResults(limit);

		return (List<Product>) query.list();
	}

	public List<Product> PaginationRecipe(int page,int value) {
		return AllPagesRecipe(page, maxOnPage,value);
	}
	


	public int getCount(Product product) {
		int count = ((Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Product co where co.id= '" + product.getId() + "'").uniqueResult())
				.intValue();

		return count;
	}
	
	public int getTotal2() {
		int count = ((Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Product co where co.type= '" + 1 + "'").uniqueResult())
				.intValue();

		return count;
	}

	private int maxOnPage = 3;
	
	public int getNumOfPages() {
		int total = getTotal();
		int pages = (int) 0;
		if (total > maxOnPage)
			pages = total / maxOnPage + total % maxOnPage;
		else
			pages = total / maxOnPage;
		return pages;
	}
	public int getTotal() {
		int count = ((Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Product co where co.type= '" + 2 + "'").uniqueResult())
				.intValue();
		return count;
	}
	
	public List<Product> Pagination(int page) {
		return AllPages(page, maxOnPage);
	}
	@SuppressWarnings("unchecked")
	public List<Product> AllPages(int page, int limit) {

		int firstResult;
		if (page == 1)
			firstResult = 0;
		else
			firstResult = (limit * page) - limit;

		Query query = sessionFactory.getCurrentSession()
				.createQuery("select co from Product co where co.type= '" + 2 + "'")
				.setFirstResult(firstResult).setMaxResults(limit);

		return (List<Product>) query.list();
	}
	
	
	
	
	
	
	
	
	
	public int getNumOfPagesRecipe() {
		int total = getTotal2();
		int pages = (int) 0;
		if (total > maxOnPage)
			pages = total / maxOnPage + total % maxOnPage;
		else
			pages = total / maxOnPage;
		return pages;
	}

	@Override
	public List<Product> getProductsByCategory(Category category) {
		// TODO Auto-generated method stub

		Query query = sessionFactory.getCurrentSession().createQuery(
				"select co from Product co where co.category= '" + category.getId() + "'");
		return (List<Product>) query.list();

	}

	@Override
	public Long findProductIdByName(String name) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery(
				"select c.id from Product c where c.name=:name");
		query.setParameter("name", name);
		Long id = (Long) query.uniqueResult();

		return id;

	}

	
}
