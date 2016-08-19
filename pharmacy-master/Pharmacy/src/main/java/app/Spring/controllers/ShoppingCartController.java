package app.Spring.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import app.Spring.controllers.commands.LogonCommand;
import app.Spring.dao.CustomerOrderService;
import app.Spring.dao.OrderItemService;
import app.Spring.dao.ProductDao;
import app.Spring.dao.UserService;
import app.Spring.domain.Cart;
import app.Spring.domain.CartOrder;
import app.Spring.domain.Category;
import app.Spring.domain.CustomerOrder;
import app.Spring.domain.Deliver;
import app.Spring.domain.MailMail;
import app.Spring.domain.OrderItem;
import app.Spring.domain.Product;
import app.Spring.domain.ReviewViewModel;
import app.Spring.domain.User;

@Controller
@SessionAttributes({"cart","deliver,user"})
public class ShoppingCartController {

	private MailSender mailSender;

	@Autowired
	UserService dao;

	@Autowired
	OrderItemService orderItemService;

	@Autowired
	CustomerOrderService cos;

	@Autowired
	ProductDao dao2;

	@RequestMapping(value = "/order.html", method = RequestMethod.GET)
	public String showForm(ModelMap model, @RequestParam(value = "id") Long id,
			HttpSession session) {

		if (session.getAttribute("cart") == null) {
			List<Cart> cart = new ArrayList<Cart>();
			cart.add(new Cart(this.dao2.getProduct(id), 1));
			session.setAttribute("cart", cart);
			
		} else {

			List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			int index = isExisting(id, session);
			if (index == -1)
				cart.add(new Cart(this.dao2.getProduct(id), 1));
			else {

				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}

			session.setAttribute("cart", cart);
			
		}
		return "cart";
	}

	@RequestMapping(value = "/cart.html", method = RequestMethod.GET)
	public String showForm2(ModelMap model, HttpSession session) {

		return "cart";
	}

	@RequestMapping(value = "/remove.html", method = RequestMethod.GET)
	public String remove(@RequestParam(value = "id") long id,
			HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		int index = isExisting(id, session);
		cart.remove(index);

		session.setAttribute("cart", cart);
		return "cart";

	}

	private int isExisting(long id, HttpSession session) {
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");
		for (int i = 0; i < cart.size(); i++)
			if (cart.get(i).getProduct().getId() == id)
				return i;

		return -1;

	}
	
	
	@RequestMapping(value = "/checkout.html", method = RequestMethod.GET)
	public String CheckOut(HttpSession session, Model model) {

		if (session.getAttribute("cartOrder") == null) {
			List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			LogonCommand logon = (LogonCommand) session
					.getAttribute("logInSession");
			List<CartOrder> cartOrder = new ArrayList<CartOrder>();
			cartOrder.add(new CartOrder(logon.getLogin(), cart));
			session.setAttribute("cartOrder", cartOrder);
			model.addAttribute("cartOrder", cartOrder);

		} else {

			List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			List<CartOrder> cartOrder = new ArrayList<CartOrder>();
			LogonCommand logon = (LogonCommand) session
					.getAttribute("logInSession");
			cartOrder.add(new CartOrder(logon.getLogin(), cart));
			session.setAttribute("cartOrder", cartOrder);
			model.addAttribute("cartOrder", cartOrder);
			return "cartOrder";
		}

		return "cartOrder";
	}
	
	
	@RequestMapping(value = "/deliver.html", method = RequestMethod.GET)
	public String deliverSelect(Model model, HttpSession session,@ModelAttribute("customerOrder") CustomerOrder customerOrder,BindingResult result) {
		
		
		 
		model.addAttribute("customerOrder", customerOrder);
		
		return "deliver";
	}
	@RequestMapping(value = "/deliver.html", method = RequestMethod.POST, params = {
			"save", "!cancel" })
	public String deliverProcess(HttpSession session,final RedirectAttributes redirectAttributes,@ModelAttribute("customerOrder") CustomerOrder customerOrder,BindingResult result) {
		
	
		
		cos.updateCustomerOrder(customerOrder);
		
		List<Cart>cartItems = (List<Cart>)session.getAttribute("cartItems");
		MailMail mm = new MailMail();

		
		User cs =(User) session.getAttribute("customerUser");
		
	
		
		
		
		String email = cs.getEmail();

		StringBuilder text = new StringBuilder();
		text.append("<html>");
		text.append("<head>");
		text.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"")
				.append("/resources/myTh/css/bootstrap.min.css")
				.append("\" />");
		text.append("</head>");
		text.append("<body>");
		text.append("<img  style = \" float:left; width: 30px; height: 30px;\" src='"
				+ "http://i.imgur.com/Muyo98P.png"
				+ "'/><h2>   </h2> " );
		text.append("<H2> Witaj " +"</H2>"+ "<small>" + cs.getUsername() +""+" id zamówienia to " +"" +customerOrder.getOrderID() + " </small>");
	    text.append("<table>");
		text.append("<th> Nazwa </th>");
		text.append("<th> Firma </th>");
		text.append("<th> Ilosc </th>");
		text.append("<th> Cena</th>");
		for (Cart carta : cartItems) {
			Product product = carta.getProduct();
			text.append("<tr>");
			text.append("<td> " + product.getName() + " </td>");
			text.append("<td> " + product.getFactory() + " </td>");
			text.append("<td> " + carta.getQuantity() + " </td>");
			text.append("<td> " + product.getPrice() + " </td>");
			text.append("</tr>");
		}
		text.append("</table>");
		text.append("</div>");
		
		
		if(customerOrder.getDeliver().getId()==1)
		{
		float jeden =	customerOrder.getTotalCost()+10;
			
			text.append("<H2> Calkowity koszt zamówienia to" +"</H2>"+ "<small>" + jeden +"" +" zlote" + " </small>");
		}
		else if(customerOrder.getDeliver().getId()==2)
		{
			float dwa =	customerOrder.getTotalCost()+15;
			text.append("<H2> Calkowity koszt zamówienia to" +"</H2>"+ "<small>" + dwa +"" +"  zlote" + " </small>");
		}
		else 
		{
			float trzy =	customerOrder.getTotalCost()+0;
			text.append("<H2> Calkowity koszt zamówienia to" +"</H2>"+ "<small>" + trzy +"" +" zlote" + " </small>");
		}
		text.append("</div>");
		text.append("<small> Platnosc na "
				+ " konto: 244821332000232, w tytule prosze o podanie identyfikatora id, imienia i nazwiska"
				+ " </small>");
		
		
		text.append("</div>");
		text.append("</div>");
		text.append("</div>");

		text.append("</body>");
		text.append("</html>");

		mm.sendMail("adammalysz92@gmail.com", "email",
				"Zakupy w naszej aptece", text.toString(), cs,
				customerOrder);

		session.setAttribute("send", email);
		cos.updateCustomerOrder(customerOrder);
		session.removeAttribute("cart");
		session.removeAttribute("cartOrder");
		return "Client-OrderInfo";
		
	}
	
	
	@RequestMapping(value = "/realize.html", method = RequestMethod.GET)
	public String realize(Model model, HttpSession session,final RedirectAttributes redirectAttributes) {

		Product pr = new Product();
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");
		List<Cart> cart = (List<Cart>) session.getAttribute("cart");

		String name = logon.getLogin();

		CartOrder order = new CartOrder(name, cart);

		String userName = logon.getLogin();
		String password = logon.getPassword();
		List<Cart> cartItems = order.getItems();

		long orderID = new Long(new Date().getTime());

		long id_user = 0;
		List<User> register2 = dao.getAllUsers();
		for (User users : register2) {

			if (users.getUsername().equals(logon.getLogin())) {
				id_user = users.getUser_id();

			}

		}
		
		System.out.println("uzytkownika id  " + id_user);

		System.out.println(" uzytkownik : " + logon.getLogin());
		User register = dao.getUsername(id_user);
        
		
		
		if(register.getEmail()==null ||register.getName()==null || register.getSurname()==null )
        {
        	
        	redirectAttributes.addFlashAttribute("msg", "Uzupelnij dane profilu, a by wykonać zamówienia");
        	return "redirect:/cart.html";
        }
		
		String status = "order created";
		SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy hh::mm");
		String date = sdf.format(new Date());

		float totalCost = 0;
		Deliver deliver= null;
		CustomerOrder customerOrder = new CustomerOrder(orderID, register,
				status, totalCost, date);
		cos.createCustomerOrder(customerOrder);

		for (Cart carta : cartItems) {
			long itemID = new Long(new Date().getTime());

			Product product = carta.getProduct();
			int quantity = carta.getQuantity();
			OrderItem orderItem = new OrderItem(itemID++, product,
					customerOrder, quantity);

			orderItemService.updateOrderItem(orderItem);

			product.setQuantity(product.getQuantity() - quantity);
			dao2.saveOrUpdateProduct(product);
			totalCost += product.getPrice() * carta.getQuantity();
			cos.updateCustomerOrder(customerOrder);

		}
		 customerOrder.setTotalCost(totalCost);
		  cos.updateCustomerOrder(customerOrder);
	    session.setAttribute("customerOrder", customerOrder);
	    session.setAttribute("cartItems", cartItems);
	    customerOrder.setTotalCost(totalCost);

	   
	    redirectAttributes.addFlashAttribute("customerOrder", customerOrder);
	    model.addAttribute("customerOrder", customerOrder);
	    session.setAttribute("customerUser", register);
	    return "redirect:/deliver.html";
	    
		
	}

	
	@ModelAttribute("deliverOption")
	public List<Deliver> loadTypes() {
		List<Deliver> types = dao.getDelivers();
		System.out
				.println("Ładowanie listy "
						+ types.size()
						+ " typów - typy będą załadowane tylko raz na sesję, gdyż została użyta adnotacja @SessionAttributes(value={\"categoryType\"})");
		return types;
	}
}
