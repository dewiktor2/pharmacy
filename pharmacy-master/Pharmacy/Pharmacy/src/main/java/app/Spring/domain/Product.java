package app.Spring.domain;

import java.io.Serializable;
import java.util.Date;














import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;



import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;




@Entity
@Table(name = "product")
public class Product implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	

	@NotBlank
	@Size(min=5, max=30, message="Size must be between 5 and 30 marks")
	private String name;
	
	
	@NotBlank
	private String factory;
	
	@Column(name = "price", nullable = false)
	@Range(min = 1, max = 150)
	private double price;
	
	@Column(name = "productionDate")
	@Past 
	private Date productionDate;

	@ManyToOne
	private ProductType type;
	
	public Product() {
		super();
	}
	
	
	public Product(long id, String name, String factory, double price,
			Date productionDate) {
		super();
		this.id = id;
		this.name = name;
		this.factory = factory;
		this.price = price;
		this.productionDate = productionDate;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double salary) {
		this.price = salary;
	}
	public Date getProductionDate() {
		return productionDate;
	}
	public void setProductionDate(Date bornDate) {
		this.productionDate = bornDate;
	}
	
	public void setType(ProductType occupation) {
		this.type = occupation;
	}
	
	public ProductType getType() {
		return type;
	}

}
