package app.Spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;

import app.Spring.domain.Category;
import app.Spring.domain.Deliver;
import app.Spring.domain.Product;
import app.Spring.domain.User;
import app.Spring.domain.UserDetails;
import app.Spring.domain.UserNfzDetails;

@SessionAttributes(value = { "register" })
public class UserServiceImpl implements UserService {

	@Autowired
	UserService dao;

	protected final Logger log = LoggerFactory.getLogger(getClass());

	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public User getUser(User register) {
		return (User) sessionFactory.getCurrentSession().get(
				User.class.getName(), register.getUsername());
	}

	public void add(User user) {

		sessionFactory.getCurrentSession().persist(user);
		sessionFactory.getCurrentSession().flush();

	}
	@Transactional
	public void saveOrUpdateUser(User v){
		
		sessionFactory.getCurrentSession().saveOrUpdate(v);
		sessionFactory.getCurrentSession().flush();
	}
	@Override
	public User getUser(Long id) {
		return (User)sessionFactory.getCurrentSession().get(User.class.getName(), id);
	}
	

	public boolean exists(User user) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"select 1 from User u where u.username =:username");
		query.setString("username", user.getUsername());
		return (query.uniqueResult() != null);
	}



	public List<User> getAllUsers() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"FROM " + User.class.getName());
		return (List<User>) query.list();
	}

	public List<User> findUser(String username) {

		String hqlQuery = "FROM " + User.class.getName()
				+ " v WHERE v.username=:username ";

		Query query = sessionFactory.getCurrentSession().createQuery(hqlQuery)
				.setParameter("username", username);

		return (List<User>) query.list();
	}

	@Override
	public List<User> booleancheckUser(String login, String password) {

		// Ta funkcja oczywi�cie powinna korzysta� z bazy

		String hqlQuery = "FROM " + User.class.getName()
				+ " v WHERE v.username=:login AND v.password=:password";

		Query query = sessionFactory.getCurrentSession().createQuery(hqlQuery)
				.setParameter("login", login)
				.setParameter("password", password);

		return (List<User>) query.list();

	}


	
	

	@Override
	public void deleteUser(User user ) {
		sessionFactory.getCurrentSession().delete(user);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public User getUsername(Long id) {
		// TODO Auto-generated method stub
		return (User)sessionFactory.getCurrentSession().get(User.class.getName(), id);
	}

	@Override
	@Transactional
	public void saveOrUpdateUserDetails(UserDetails v) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(v);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public UserDetails getAdress(Long id) {
		// TODO Auto-generated method stub
		return (UserDetails)sessionFactory.getCurrentSession().get(UserDetails.class.getName(), id);
	}


	@Override
	public List<UserNfzDetails> getNfzDetails() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"FROM " + UserNfzDetails.class.getName());
		return (List<UserNfzDetails>) query.list();
	}

	@Override
	public User findUserByName(String username) {
		// TODO Auto-generated method stub
		String hqlQuery = "FROM " + User.class.getName()
				+ " v WHERE v.username=:username ";

		Query query = sessionFactory.getCurrentSession().createQuery(hqlQuery)
				.setParameter("username", username);

		return (User) query.uniqueResult();
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
			int count = ((Long) sessionFactory.getCurrentSession()
					.createQuery("select count(*) from User ").uniqueResult())
					.intValue();

			return count;
		}

	@Override
	public List<Deliver> getDelivers() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery(
				"FROM " + Deliver.class.getName());
		return (List<Deliver>) query.list();
	}
	}



