package app.Spring.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import app.Spring.controllers.commands.LogonCommand;
import app.Spring.dao.CustomerOrderService;
import app.Spring.dao.OpinionService;
import app.Spring.dao.OrderItemService;
import app.Spring.dao.ProductDaoImpl;
import app.Spring.dao.UserService;
import app.Spring.domain.CustomerOrder;
import app.Spring.domain.OrderItem;
import app.Spring.domain.Product;
import app.Spring.domain.Review;
import app.Spring.domain.StastisticHelper;
import app.Spring.domain.User;
import app.Spring.domain.UserDetails;

@Controller
@RequestMapping("/admin/users")
@SessionAttributes("customerOrder")
public class AdminController {

	private int maxOnPage = 2;
	
	@Autowired
	LocalValidatorFactoryBean validator;

	@Autowired
	UserService reg;

	@Autowired
	CustomerOrderService co;
	@Autowired
	OrderItemService cos;
	@Autowired
	OpinionService ops;

	@Autowired
	OrderItemService ois;

	@Autowired
	ProductDaoImpl dao;

	@RequestMapping
	public String showUsers(Model model, HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			return "403";
		}
		model.addAttribute("usersList", reg.getAllUsers());
		return "usersList";
	}

	@RequestMapping("/removeuser/{id}")
	public String removeUserById(@PathVariable Long id) {
		reg.deleteUser(reg.getUser(id));
		System.out.println("usun uzytkownika o id" + id);
		return "usersList";
	}

	@RequestMapping("/removecustomer/{id}")
	public String removeCustomerOrderById(Model model, @PathVariable Long id,
			HttpSession session) throws Exception {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			return "403";
		}

		List<OrderItem> items = (List<OrderItem>) session
				.getAttribute("customerOrder");
		items = cos.getOrderItems(co.getCustomerOrder(id));
		int index = 0;
		OrderItem orderitem = new OrderItem();
		for (OrderItem order : items) {

			orderitem = items.get(index);
			index++;
			cos.deleteOrderItem2(orderitem);
		}

		System.out.println("usuwanie  zamowienia o id" + id);

		co.deleteCustomerOrder(co.getCustomerOrder(id));

		session.setAttribute("customerOrder", co.getAllCustomerOrder());

		model.addAttribute("customerOrder", co.getAllCustomerOrder());
		return "customersOrders";
	}

	@RequestMapping(value = "/orderRealize/{id}", method = RequestMethod.GET)
	public String realizeCustomerOrder(Model model, @PathVariable Long id,
			HttpSession session) throws Exception {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			return "403";
		}

		System.out.println("edycja zamowienia uzytkownika o id" + id);
		CustomerOrder customer = new CustomerOrder();
		customer = co.getCustomerOrder(id);
		System.out.println("edycja zamowienia uzytkownika o id"
				+ customer.getStatus());

		if (customer.getStatus().contains("Zapłacono")) {
			model.addAttribute("adding", customer);
			customer.setStatus("Zrealizowano");
		} else if (customer.getStatus().contains("order created")) {
			customer.setStatus("Oczekiwanie");

		} else if (customer.getStatus().contains("Zrealizowano")) {
			model.addAttribute("error", customer);

		}
		co.updateCustomerOrder(customer);
		model.addAttribute("adding", customer);
		return "redirect:/admin/users/controlOrders.html";

	}

	@RequestMapping(value = "/orderRealize/{id}", method = RequestMethod.POST)
	public String processForm(Model model,
			@ModelAttribute("customerOrder") CustomerOrder v,
			BindingResult result, HttpSession session) {

		validator.validate(v, result);

		if (result.hasErrors()) {

			return "edit-order";
		}

		List<FieldError> errors = result.getFieldErrors();
		for (FieldError objectError : errors) {
			System.out.println(objectError.getRejectedValue());
		}

		v.setStatus("wyslano");
		co.updateCustomerOrder(v);

		return "redirect:/admin/users";

	}

	@RequestMapping(value = "/glowna.html", method = RequestMethod.GET)
	protected String handleRequestInternal2(ModelMap model) throws Exception {

		return "redirect:/";
	}

	@RequestMapping(value = "/siteControl.html", method = RequestMethod.GET)
	protected String handleRequestInternal(ModelMap model, HttpSession session)
			throws Exception {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			return "403";
		}
		return "usersList";
	}

	@RequestMapping(value = "/controlOrders.html", method = RequestMethod.GET)
	protected String handleRequestInternal3(Model model, HttpSession session)
			throws Exception {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			return "403";
		}

		LogonCommand logon2 = (LogonCommand) session
				.getAttribute("logInSession");

		model.addAttribute("customerOrder", co.getAllCustomerOrder());

		return "customersOrders";

	}

	@RequestMapping(value = "/controlOpinions.html", method = RequestMethod.GET)
	protected String handleRequestInternal4(Model model, HttpSession session)
			throws Exception {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			return "403";
		}

		LogonCommand logon2 = (LogonCommand) session
				.getAttribute("logInSession");

		model.addAttribute("opinions", ops.reviewList());

		return "controlOpinions";

	}

	@RequestMapping(value = "/actualAddress", method = RequestMethod.GET)
	public String showForm2(Model model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");

		if (logon == null) {
			return "403";
		}
		long id_user = 0;
		List<User> register2 = reg.getAllUsers();
		for (User users : register2) {

			if (users.getUsername().equals(logon.getLogin())) {
				id_user = users.getUser_id();

			}

		}

		UserDetails user_details = reg.getAdress(id);

		model.addAttribute("detail", user_details);

		return "actualAddress";
	}

	@RequestMapping(value = "/infoAboutOrder/{id}", method = RequestMethod.GET)
	public String info(@PathVariable Long id, Model model) throws Exception {

		CustomerOrder customer = co.getCustomerOrder(id);

		model.addAttribute("info", ois.getOrderItems(customer));

		return "infoAboutOrder";

	}

	@RequestMapping("/removeOpinion/{id}")
	public String removeOpinion(Model model, @PathVariable Long id) {
		Review review = ops.getReview(id);
		ops.remove(review);
		System.out.println("usuwanie zamowienia o id" + id);
		model.addAttribute("opinions", ops.reviewList());
		return "controlOpinions";
	}

	@RequestMapping("/statistics/{page}")
	public String ogloszeniaStrony(Model model,HttpSession session,
			@PathVariable(value = "page") final int page) {
			
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");

		if (logon == null) {
			return "403";
		}
		

			List<Product> products = dao.getAll();

			// Produkt z najwieksza iloscia dostepna
			int max = 0;
			int min = max;
			Product min2 = new Product();
			Product max2 = new Product();
			List<Product> products2 = new ArrayList<Product>();
			for (Product p : products) {

				if(p.getQuantity()==1)
				{
					products2.add(p);
				}
				if (p.getQuantity() > max) {
					max = p.getQuantity();
					max2 = p;
					min = max;
				}
				if (p.getQuantity() < min) {
					min = p.getQuantity();
					min2 = p;
				}
			}
			
			if(products2.size()==0)
			{
				
				model.addAttribute("productList", products2);
				model.addAttribute("pages", products2.size());
				model.addAttribute("currentPage", 1);
				session.setAttribute("min", min2);
				session.setAttribute("max", max2);
				model.addAttribute("min", min2);
				model.addAttribute("max", max2);
				return "statistics";
			}
			else
			{
			int pages =products2.size();
			products2=Pagination(page,products2);
			int currentPage =1;
			
			session.setAttribute("min", min2);
			session.setAttribute("max", max2);
			model.addAttribute("min", min2);
			model.addAttribute("max", max2);

			model.addAttribute("productList", products2);
			model.addAttribute("pages", getNumOfPages(pages));
			model.addAttribute("currentPage", page);
	
			return "statistics";
			}
			
			
}
	@RequestMapping("/statistics")
	public String statistic(Model model, HttpSession session) {

		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");

		if (logon == null) {
			return "403";
		}
		

			List<Product> products = dao.getAll();
			int max = 0;
			int min = max;
			Product min2 = new Product();
			Product max2 = new Product();
			List<Product> products2 = new ArrayList<Product>();
			for (Product p : products) {

				
				if(p.getQuantity()==1)
				{
					products2.add(p);
				}
				if (p.getQuantity() > max) {
					max = p.getQuantity();
					max2 = p;
					min = max;
				}
				if (p.getQuantity() < min) {
					min = p.getQuantity();
					min2 = p;
				}
			}
			
			if(products2.size()==0)
			{
				
				model.addAttribute("productList", products2);
				model.addAttribute("pages", products2.size());
				model.addAttribute("currentPage", 1);
				session.setAttribute("min", min2);
				session.setAttribute("max", max2);
				model.addAttribute("min", min2);
				model.addAttribute("max", max2);
				return "statistics";
			}
			else
			{
			int pages =products2.size();
			products2=Pagination(1,products2);
			int currentPage =1;
			
			session.setAttribute("min", min2);
			session.setAttribute("max", max2);
			model.addAttribute("min", min2);
			model.addAttribute("max", max2);

			model.addAttribute("productList", products2);
			model.addAttribute("pages", getNumOfPages(pages));
			model.addAttribute("currentPage", 1);
	
			return "statistics";
			}
	}
	@RequestMapping("/statistics/product")
	public String moreProductStatistic(Model model, HttpSession session,
			final RedirectAttributes redirectAttributes) {

		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		List<User> user;
		if (logon == null) {
			return "403";
		}
		int max = 0;
		List<OrderItem>items =cos.getOrderItems();
		Product mostPopular =new Product();
		for (OrderItem p : items) {

			int count =cos.getMostPopularProduct(p.getProduct().getId());
			if (count > max) {
				max=count;
				mostPopular=p.getProduct();
			}
		
		}
		session.setAttribute("mostPupular", mostPopular);
		session.setAttribute("mostPupularMax", max);
		return "redirect:/admin/users/statistics";

	}

	// Liczba uzytkownikow
	@RequestMapping("/statistics/user")
	public String statistic2(Model model, HttpSession session,
			final RedirectAttributes redirectAttributes) {

		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		List<User> user;
		if (logon == null) {
			return "403";
		}

		if (session.getAttribute("helper") == null) {
			int max = 0;

			StastisticHelper helper2 = null;
			user = reg.getAllUsers();
			for (User user2 : user) {
				StastisticHelper helper = co.getPopularOrder(user2);

				if (helper.getCount() > max) {
					max = helper.getCount();
					helper2 = helper;

				}

			}
			redirectAttributes.addFlashAttribute("helper", helper2);
			session.setAttribute("userList", user);
			session.setAttribute("helper2", helper2);

		
		}
		if (session.getAttribute("count") == null) {
			int count = reg.count();
			session.setAttribute("count", count);
			redirectAttributes.addFlashAttribute("count", count);
		} else {
			int count = (int) session.getAttribute("count");
			redirectAttributes.addFlashAttribute("count", count);
		}
		return "redirect:/admin/users/statistics";

	}
	public List<Product> Pagination(int page,List<Product>products) {
		List<Product> reviews2 = paginate(page, maxOnPage,products);
		return reviews2;
	}
	
	 public static <T> List<T> paginate(int page,int limit, List<T> list) {

         if(list.size()==1)
         {
        	 return	 list.subList(limit*(page-1), limit*page-1);
         }
         else if(list.size()==(page*2)-1)
         {
        	 
        	 return	 list.subList(limit*(page-1), limit*page-1);
         }
         else
         {
		 return	 list.subList(limit*(page-1), limit*page);
         }
	  }
	 

	
	public int getNumOfPages(int size) {
		int total = size;
		int pages = (int) 0;
		if (total > maxOnPage)
			pages = total / maxOnPage + total % maxOnPage;
		else
			pages = total / maxOnPage;
		 
		
		
		return pages;
	}

}
