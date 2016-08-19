package app.Spring.dao;

import java.util.List;

import app.Spring.domain.Deliver;
import app.Spring.domain.Product;
import app.Spring.domain.User;
import app.Spring.domain.UserDetails;
import app.Spring.domain.UserNfzDetails;




public interface UserService {
	
	public void add(User register);

	public void saveOrUpdateUser(User v);
	
	public void saveOrUpdateUserDetails(UserDetails v);

	List<User> booleancheckUser(String login, String password);

	public boolean exists(User user);
	


	public User getUsername(Long id);
	
	
	public UserDetails getAdress(Long id);

	public List<User> findUser(String username);

	public List<User> getAllUsers();

	User getUser(Long id);

	public void deleteUser(User user);

	List<UserNfzDetails> getNfzDetails();

	public User findUserByName(String username);

	public int count();

	public List<Deliver> getDelivers();
}
