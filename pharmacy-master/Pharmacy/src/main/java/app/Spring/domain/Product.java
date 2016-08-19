package app.Spring.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "product")
public class Product implements Serializable {

	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="PRODUCT_ID")
	private long id;

	@NotBlank
	@Size(min = 5, max = 20)
	private String name;

	@NotNull
	private byte[] image;
    
	@NotBlank
	private String fileName;

	@NotBlank
	private String factory;

	@Column(name = "PRICE", nullable = false)
	@Range(min = 1, max = 4000)
	private float price;

	@Column(name = "QUANTITY", nullable = false)
	@Range(min = 1, max = 4000)
	private int quantity;

	@Column(name = "PRODUCTION_DATE")
	@Past
	private Date productionDate;

	/**
	 * kategoria produktu
	 */
	@ManyToOne
	private Category category;
	
	/**
	 * typ leku (recepta,bez recepty)
	 */
	@ManyToOne
	private ProductType type;

	@ManyToMany(fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<OrderItem> orderitems;

	 
	
	@OneToMany(cascade = CascadeType.ALL, 
	        mappedBy = "product")
    private List<Review> reviews;

	
	public Product() {
		orderitems = new ArrayList<OrderItem>();
		category = new Category();
		type = new ProductType();
		reviews = new ArrayList<Review>();
	}

	
	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String firstName) {
		this.name = firstName;
	}

	public String getFactory() {
		return factory;
	}

	public void setFactory(String lastName) {
		this.factory = lastName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float salary) {
		this.price = salary;
	}

	public Date getProductionDate() {
		return productionDate;
	}

	public void setProductionDate(Date bornDate) {
		this.productionDate = bornDate;
	}


	
	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	public ProductType getType() {
		return type;
	}


	public void setType(ProductType type) {
		this.type = type;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public List<OrderItem> getOrders() {
		return orderitems;
	}

	public List<OrderItem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(List<OrderItem> orderitems) {
		this.orderitems = orderitems;
	}


	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name  + ", fileName=" + fileName
				+ ", factory=" + factory + ", price=" + price + ", quantity="
				+ quantity + ", productionDate=" + productionDate
				+ ", category=" + category + ", type=" + type ;
	}



	 


}
