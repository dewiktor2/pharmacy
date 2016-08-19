package app.Spring.domain;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.SessionAttributes;


public class Cart implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int quantity;
	private Product product;

	public Cart(Product product, int quantity) {
		super();
		this.quantity = quantity;
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

}
