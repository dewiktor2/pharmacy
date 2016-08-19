package app.Spring.dao;

import java.util.List;





import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import app.Spring.domain.Product;
import app.Spring.domain.ProductType;



public  class HibernateDao implements ProductDao {
	
	protected final Logger log = LoggerFactory.getLogger(getClass());

	protected SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	
	
	
	public List<ProductType> getProductTypes() {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM "+ProductType.class.getName());
		return (List<ProductType>)query.list();		
	}
	
	@Override
	public Product getProduct(Long id) {
		return (Product)sessionFactory.getCurrentSession().get(Product.class.getName(), id);
	}
	

	public List<Product> getAllProducts() {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM "+Product.class.getName());
		return (List<Product>)query.list();				
	}
	
	public void saveOrUpdateProduct(Product v){
		
		sessionFactory.getCurrentSession().saveOrUpdate(v);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public void deleteProduct(Product v) {
		sessionFactory.getCurrentSession().delete(v);
		sessionFactory.getCurrentSession().flush();
	}

	
	@Override
	public boolean checkUser(String login, String password) {
		
		//Ta funkcja oczywiœcie powinna korzystaæ z bazy
		
		if(login.equalsIgnoreCase("Jan-007") && password.equalsIgnoreCase("Kowalski"))
			return true;
		return false;
	}
	
}
