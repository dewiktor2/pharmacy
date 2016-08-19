package app.Spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import app.Spring.domain.Category;
import app.Spring.domain.Product;

public class CategoryDaoImpl  implements CategoryDao{

	
	private int  maxOnPage=3;
	protected final Logger log = LoggerFactory.getLogger(getClass());

	protected SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	
	
	@Override
	public void add(Category category) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(category);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public void saveOrUpdateCategory(Category v) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(v);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("FROM "+Category.class.getName());
		return (List<Category>)query.list();		
	}

	@Override
	public Category getCategory(Long id) {
		// TODO Auto-generated method stub
		return (Category)sessionFactory.getCurrentSession().get(Category.class.getName(), id);
	}

	@Override
	public void deleteCategory(Category Category) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(Category);
		sessionFactory.getCurrentSession().flush();
	}


}
