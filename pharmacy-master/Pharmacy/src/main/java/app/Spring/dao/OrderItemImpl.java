package app.Spring.dao;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceException;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import app.Spring.domain.CustomerOrder;
import app.Spring.domain.OrderItem;
import app.Spring.domain.Product;
import app.Spring.domain.StastisticHelper;


public class OrderItemImpl implements OrderItemService {

	protected final Logger log = LoggerFactory.getLogger(getClass());

	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public OrderItem getOrderItem(Long id) {
		return (OrderItem) sessionFactory.getCurrentSession().get(
				OrderItem.class.getName(), id);
	}

	public void deleteOrderItem2(OrderItem orderItem) throws Exception {
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			orderItem = (OrderItem) session.merge(orderItem);
			session.delete(orderItem);
			session.flush();
			tx.commit();
		} catch (PersistenceException pe) {
			tx.rollback();
			throw pe;
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public List<OrderItem> getOrderItems(Product product) {

		Query query = sessionFactory.getCurrentSession().createQuery(
				"select item from OrderItem item where item.product = '"
						+ product.getId() + "'");

		return (List<OrderItem>) query.list();
	}
	


	@SuppressWarnings("unchecked")
	public List<OrderItem> getOrderItems(CustomerOrder customerOrder) {

		Query query = sessionFactory.getCurrentSession().createQuery(
				"select item from OrderItem item where item.customerOrder = '"
						+ customerOrder.getOrderID() + "'");

		return (List<OrderItem>) query.list();
	}

	@SuppressWarnings("unchecked")
	public List<OrderItem> getOrderItems() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"select item from OrderItem item");

		return (List<OrderItem>) query.list();
	}

	/*
	 * @Override public List<OrderItem> createOrderItem(List<OrderItem>
	 * orderItem) { // TODO Auto-generated method stub
	 * sessionFactory.getCurrentSession().saveOrUpdate(orderItem);
	 * sessionFactory.getCurrentSession().flush(); return orderItem; }
	 */

	public List<OrderItem> createOrderItems(List<OrderItem> orderItems) {
		Session session = null;
		Transaction tx = null;

		try {
			session = sessionFactory.getCurrentSession().getSessionFactory()
					.getCurrentSession();
			tx = session.beginTransaction();
			tx.setTimeout(5);

			for (OrderItem item : orderItems) {
				session.persist(item);
			}
			session.flush();
			tx.commit();
		} catch (PersistenceException pe) {
			tx.rollback();
			throw pe;
		} finally {
			session.close();
		}

		return orderItems;
	}

	@Override
	public OrderItem updateOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(orderItem);
		sessionFactory.getCurrentSession().flush();
		return orderItem;
	}

	public List<OrderItem> updateOrderItem(List<OrderItem> orderItems) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(orderItems);
		sessionFactory.getCurrentSession().flush();
		return orderItems;

	}

	public Collection<OrderItem> createOrderItems() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderItem createOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<OrderItem> createOrderItems(
			Collection<OrderItem> orderItems) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteOrderItem(OrderItem v) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(v);
		sessionFactory.getCurrentSession().flush();

	}

	public void deleteOrderItem(List<OrderItem> v) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(v);
		sessionFactory.getCurrentSession().flush();

	}

	
	public int  getMostPopularProduct(Long product_id) {
		// TODO Auto-generated method stub
		int count  = ((Long) sessionFactory.getCurrentSession().createQuery(
			    "select count(*) from OrderItem p where p.product= '"
			    +  product_id + "'").uniqueResult()).intValue();
		
		
			
             
			return count;
	}

}
