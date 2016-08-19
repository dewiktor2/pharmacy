package app.Spring.dao;

import java.util.Collection;
import java.util.List;

import app.Spring.domain.CustomerOrder;
import app.Spring.domain.OrderItem;
import app.Spring.domain.Product;
import app.Spring.domain.StastisticHelper;
import app.Spring.domain.User;

public interface OrderItemService {

	// public List<OrderItem> createOrderItems(List<OrderItem> orderItem) ;

	public Collection<OrderItem> createOrderItems(
			Collection<OrderItem> orderItems);

	// public OrderItem getOrderItem(long itemID);

	public List<OrderItem> getOrderItems(Product product);
	
	public int getMostPopularProduct(Long product_id) ;

	public List<OrderItem> getOrderItems(CustomerOrder customerOrder);

	public List<OrderItem> getOrderItems();

	public OrderItem updateOrderItem(OrderItem orderItem);

	public OrderItem getOrderItem(Long id);

	public OrderItem createOrderItem(OrderItem orderItem);

	public List<OrderItem> updateOrderItem(List<OrderItem> orderItems);

	public void deleteOrderItem(OrderItem orderItem);

	public void deleteOrderItem2(OrderItem orderItem) throws Exception;

	// public OrderItem updateOrderItem(OrderItem orderItem) throws Exception;

	public void deleteOrderItem(List<OrderItem> orderItem);
}