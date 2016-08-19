package app.Spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import app.Spring.domain.Category;
import app.Spring.domain.Product;
import app.Spring.domain.Review;

public class OpinionServiceImpl implements OpinionService {

	protected final Logger log = LoggerFactory.getLogger(getClass());

	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(Review review) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(review);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public List<Review> reviewList() {

		Query query = sessionFactory.getCurrentSession().createQuery(
				"FROM " + Review.class.getName());
		return (List<Review>) query.list();
	}

	@Override
	public void update(Review review) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(review);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public void remove(Review review) {
		
		sessionFactory.getCurrentSession().delete(review);
		sessionFactory.getCurrentSession().flush();

	}

	@Override
	public Review getReview(long toFind) {

		return (Review) sessionFactory.getCurrentSession().get(
				Review.class.getName(), toFind);
	}

}
