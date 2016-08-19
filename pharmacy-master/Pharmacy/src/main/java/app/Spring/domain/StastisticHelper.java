package app.Spring.domain;

public class StastisticHelper {

	
	private User user;
	
	private int count;

	public StastisticHelper(User user, int count2) {
		super();
		this.user = user;
		this.count = count2;
	}

	public StastisticHelper() {
		super();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
