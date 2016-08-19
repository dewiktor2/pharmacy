package app.Spring.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CustomerOrder")
public class CustomerOrder {

	@Id
	@Column(name = "orderID")
	private long orderID;

	@ManyToOne(cascade = { CascadeType.MERGE })
	private User user;

	@Column(name = "status")
	private String status;

	@Column(name = "totalCost")
	private float totalCost;

	@Column(name = "orderDate")
	private String orderDate;

	@ManyToOne
	private Deliver	deliver;
	
	public CustomerOrder()
	{
		
	}
	public CustomerOrder(long orderID, User user, String status,
			float totalCost, String orderDate) {
		this.orderID = orderID;
		this.user = user;
		this.status = status;
		this.totalCost = totalCost;
		this.orderDate = orderDate;
	}

	public long getOrderID() {
		return orderID;
	}

	public void setOrderID(long orderID) {
		this.orderID = orderID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Deliver getDeliver() {
		return deliver;
	}

	public void setDeliver(Deliver deliver) {
		this.deliver = deliver;
	}
	
}