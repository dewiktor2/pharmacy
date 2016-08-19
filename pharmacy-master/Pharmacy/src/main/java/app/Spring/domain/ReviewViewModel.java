package app.Spring.domain;

public class ReviewViewModel {

	private Product product;
	
	private Review review;

	
	
	public ReviewViewModel() {
		super();
	}

	public ReviewViewModel(Product product, Review review) {
		super();
		this.product = product;
		this.review = review;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	
}
