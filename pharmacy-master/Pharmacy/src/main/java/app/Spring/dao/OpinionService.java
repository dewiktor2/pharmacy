package app.Spring.dao;

import java.util.List;

import app.Spring.domain.Review;

public interface OpinionService {

	public void add(Review review);

	public List<Review> reviewList();

	public void update(Review review);

	public Review getReview(long toFind);

	public void remove(Review review);

	

}
