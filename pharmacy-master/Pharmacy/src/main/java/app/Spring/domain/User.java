package app.Spring.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "USERS")
public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "user_id")
	private Long user_id;

	@NotBlank
	@Size(min = 5, max = 20)
	private String username;

	@NotBlank
	@Size(min = 8, max = 20)
	private String password;
	
	private String email;

	private String name;

	private String surname;

	@OneToOne(mappedBy = "user")
	private UserDetails userDetail;
	
	@ManyToOne
	private UserNfzDetails userNfzDetails;

	public User() {

	}

	public User(Long user_id, String username, String email, String name,
			String surname, UserDetails userDetail,String password) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.email = email;
		this.name = name;
		this.surname = surname;
		this.userDetail = userDetail;
		this.password = password;
		userNfzDetails = new UserNfzDetails();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public Long getUser_id() {
		return user_id;
	}

	public final void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	

	public void setId(Long user_id) {
		this.user_id = user_id;
	}

	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserDetails getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetails userDetail) {
		this.userDetail = userDetail;
	}

	public UserNfzDetails getUserNfzDetails() {
		return userNfzDetails;
	}

	public void setUserNfzDetails(UserNfzDetails userNfzDetails) {
		this.userNfzDetails = userNfzDetails;
	}
	

}