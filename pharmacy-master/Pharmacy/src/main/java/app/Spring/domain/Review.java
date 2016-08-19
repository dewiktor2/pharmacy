package app.Spring.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Review implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private Date createDate;

	@NotBlank
	@Size(min = 6, max = 100)
	private String review;

	@ManyToOne(cascade = { CascadeType.MERGE })
	private User user;

	
	@ManyToOne
	@NotNull
	private Product product;
  
	
	
	
    public Review ()
	{
	
	}

	

	public Review(long id, Date createDate, String review, User user,
			Product product) {
		super();
		this.id = id;
		this.createDate = createDate;
		this.review = review;
		this.user = user;
		this.product = product;
	}

	public Review( User user,
			Product product) {
		super();
		
		
		this.user = user;
		this.product = product;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	@Override
	public String toString() {
		return "Review [id=" + id + ", createDate=" + createDate + ", review="
				+ review + ", product="
						+ product.getName()+ ", user=" + user +  "]";
	}


	
	
   
	
}
