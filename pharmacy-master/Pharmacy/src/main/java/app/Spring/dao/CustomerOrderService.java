package app.Spring.dao;



import java.util.List;

import app.Spring.domain.CustomerOrder;
import app.Spring.domain.StastisticHelper;
import app.Spring.domain.User;




public interface CustomerOrderService {

        public CustomerOrder createCustomerOrder(CustomerOrder customerOrder);
             //           throws Exception;

      public List<CustomerOrder> getCustomerOrders(User user);
     
      public void deleteCustomerOrder(CustomerOrder cus);
    //    public CustomerOrder getCustomerOrder(long orderID);

 //       public Collection<CustomerOrder> getCustomerOrders();

        public CustomerOrder updateCustomerOrder(CustomerOrder customerOrder) ;
                 //       throws Exception;

    //    public void deleteCustomerOrder(CustomerOrder customerOrder)
          //              throws Exception;
       
    	public CustomerOrder getCustomerOrder(Long id);
    	
    
    	public List<CustomerOrder> getAllCustomerOrder() ;
    	
    	public StastisticHelper getPopularOrder(User user) ;
}