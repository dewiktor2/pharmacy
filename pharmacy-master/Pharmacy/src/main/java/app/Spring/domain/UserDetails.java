package app.Spring.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "user_address")
public class UserDetails {
	
	
	  public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	  @Id
	  private Long id;
	  
	  
	  private String adres1;
	  
	  private String adres2;
	 
	  private String city;
	  
	  private String postcode;

	
	    @OneToOne
	    @JoinColumn(name = "user_id")
	    private User user;
	  


	public UserDetails(Long id, String adres1, String adres2, String city,
			String postcode, User user) {
		super();
		this.id = id;
		this.adres1 = adres1;
		this.adres2 = adres2;
		this.city = city;
		this.postcode = postcode;
		this.user = user;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getAdres1() {
		return adres1;
	}

	public void setAdres1(String adres1) {
		this.adres1 = adres1;
	}

	public String getAdres2() {
		return adres2;
	}

	public void setAdres2(String adres2) {
		this.adres2 = adres2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	  
	  
}
