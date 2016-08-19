package app.Spring.domain;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="deliver")
public class Deliver {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 	
	private Long id;
	
	
	String name;
	
	int price;
	
	public Deliver(){}
	
	public Deliver(Long id, String name,int price){
		
		this.id = id;
		this.name = name;
		this.price=price;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Category){
		Category a = (Category)obj;
		
		System.out.println("ecuals "+a.getId()+"=="+id+" = "+(a.getId().equals(id)));
		return a.getId().equals(id);
		}
		return false;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
		
	
}

