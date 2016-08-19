package app.Spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import app.Spring.domain.CustomerOrder;
import app.Spring.domain.Product;
import app.Spring.domain.StastisticHelper;
import app.Spring.domain.User;



public class CustomerOrderImpl implements CustomerOrderService{

	
	protected final Logger log = LoggerFactory.getLogger(getClass());

	protected SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	public User getUser(User register) {
		return (User)sessionFactory.getCurrentSession().get(Product.class.getName(), register.getUsername());
	}
	
	  
	 public CustomerOrder updateCustomerOrder(CustomerOrder customerOrder)
	 {
		 sessionFactory.getCurrentSession().saveOrUpdate(customerOrder);
			sessionFactory.getCurrentSession().flush();
			return customerOrder;
		 
	 }
	 public void deleteCustomerOrder(CustomerOrder v) {
			sessionFactory.getCurrentSession().delete(v);
			sessionFactory.getCurrentSession().flush();
		}

	
	  	
		
	 public CustomerOrder createCustomerOrder(CustomerOrder customerOrder){
			
			sessionFactory.getCurrentSession().saveOrUpdate(customerOrder);
			sessionFactory.getCurrentSession().flush();
			return customerOrder;
		}
	
	 
	  public List<CustomerOrder> getCustomerOrders(User user) {
		
		
		
        
        Query query = sessionFactory.getCurrentSession().
                        createQuery("select co from CustomerOrder co where co.user= '"
                                        + user.getUser_id() + "'");
        return (List<CustomerOrder>)query.list();		
}
	
	  @Override
  	public CustomerOrder getCustomerOrder(Long id) {
  		return (CustomerOrder)sessionFactory.getCurrentSession().get(CustomerOrder.class.getName(), id);
  	}
	  
  	public List<CustomerOrder> getAllCustomerOrder() {
  		Query query = sessionFactory.getCurrentSession().createQuery("FROM "+CustomerOrder.class.getName());
  		return (List<CustomerOrder>)query.list();				
  	}
	
  	
	public StastisticHelper getPopularOrder(User user) {
		// TODO Auto-generated method stub
		
		
		
		int count  = ((Long) sessionFactory.getCurrentSession().createQuery(
			    "select count(*) from CustomerOrder p where p.user= '"
			    + user.getUser_id() + "'").uniqueResult()).intValue();
		
		
			StastisticHelper statistic =new StastisticHelper(user,count);
             
			return statistic;
		
	}

  	
}
