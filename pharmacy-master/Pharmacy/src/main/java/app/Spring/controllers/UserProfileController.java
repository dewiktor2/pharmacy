package app.Spring.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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

import app.Spring.controllers.commands.LogonCommand;
import app.Spring.dao.CustomerOrderService;
import app.Spring.dao.OpinionService;
import app.Spring.dao.OrderItemService;
import app.Spring.dao.ProductDao;
import app.Spring.dao.UserService;
import app.Spring.domain.Category;
import app.Spring.domain.CustomerOrder;
import app.Spring.domain.ProductType;
import app.Spring.domain.User;
import app.Spring.domain.UserDetails;
import app.Spring.domain.UserNfzDetails;

/**
 * @author Wiktor
 *
 */
@Controller
@RequestMapping("user/profile")
@SessionAttributes(value = { "userDetail","user" })
public class UserProfileController {

	protected final Log log = LogFactory.getLog(getClass());// Dodatkowy
															// komponent do
															// logowania

	@Autowired
	CustomerOrderService co;
	@Autowired
	UserService reg;

	@Autowired
	ProductDao dao;

	@Autowired
	LocalValidatorFactoryBean validator;

	@Autowired
	OrderItemService ois;

	@Autowired
	OpinionService ops;

	@RequestMapping
	public String showProfile(Model model, HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");
   
           if(logon==null)
           {
           	return "403";
           }
     
		long id_user = 0;
		List<User> register2 = reg.getAllUsers();
		for (User users : register2) {

			if (users.getUsername().equals(logon.getLogin())) {
				id_user = users.getUser_id();

			}

		}
		User user = reg.getUser(id_user);

		System.out.println("uzytkownika id  " + id_user);

		

		model.addAttribute("user", user);

		return "profile";
	}

	@RequestMapping("/customerOrderList")
	public String customerOrderList(Model model, HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");

		long id_user = 0;
		List<User> register2 = reg.getAllUsers();
		for (User users : register2) {

			if (users.getUsername().equals(logon.getLogin())) {
				id_user = users.getUser_id();

			}

		}

		User register = reg.getUsername(id_user);
		model.addAttribute("customerList", co.getCustomerOrders(register));

		return "clientOrderList";
	}

	@RequestMapping(value = "/userInfoForm", method = RequestMethod.GET)
	public String showForm(ModelMap model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");
        if(logon==null)
        {
        	return "403";
        }
		List<UserNfzDetails> detail;
		User v = (id > 0) ? reg.getUser(id) : new User();
		
	
		model.addAttribute("user", v);

		return "userInfoForm";

	}
	
	@RequestMapping(value = "/userInfoFormAdmin", method = RequestMethod.GET)
	public String showForm2(ModelMap model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
        if(logon==null)
        {
        	return "403";
        }
		List<UserNfzDetails> detail;
		User v = (id > 0) ? reg.getUser(id) : new User();
		
	
		model.addAttribute("user", v);

		return "userInfoFormAdmin";

	}

	@RequestMapping(value = "/actualAddress", method = RequestMethod.GET)
	public String userAdres(Model model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");
        if(logon==null)
        {
        	return "403";
        }
		UserDetails user_details = reg.getAdress(id);

		model.addAttribute("detail", user_details);

		return "actualAddress";
	}
	
	@RequestMapping(value = "/actualAddressAdmin", method = RequestMethod.GET)
	public String adresAdmin(Model model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
        if(logon==null)
        {
        	return "403";
        }
		UserDetails user_details = reg.getAdress(id);

		model.addAttribute("detail", user_details);

		return "actualAddress";
	}


	@RequestMapping(value = "/userDetails", method = RequestMethod.GET)
	public String showForm(Model model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");
        if(logon==null)
        {
        	return "403";
        }

		long id_user = 0;
		List<User> register2 = reg.getAllUsers();
		for (User users : register2) {

			if (users.getUsername().equals(logon.getLogin())) {
				id_user = users.getUser_id();

			}

		}

		UserDetails va;

		User user = reg.getUser(id);
		if (reg.getAdress(id) == null) {
			va = new UserDetails(id_user, null, null, null, null, user);
			
	 
		} else {
			va = reg.getAdress(id);
          
		}

		model.addAttribute("detal", va);

		return "userDetails";
	}

	@RequestMapping(value = "/userDetails", method = RequestMethod.POST)
	public String submit(Model model, @ModelAttribute("detal") UserDetails va,
			BindingResult result) {
	
		
		validator.validate(va, result);

		
		if (result.hasErrors()) {
			return "userDetails";
		}
           
		reg.saveOrUpdateUserDetails(va);
        model.addAttribute("add", va);
		return "profile";
	}

	@RequestMapping(value = "/userInfoForm", method = RequestMethod.POST)
	public String processForm(Model model, @ModelAttribute("user") User v,
			BindingResult result, HttpSession session) {

		validator.validate(v, result);

		if (v.getName() != null && v.getName().equals("admin"))
			result.rejectValue("name", "wrongName.product.name");

		if (result.hasErrors()) {

			return "userInfoForm";
		}

		List<FieldError> errors = result.getFieldErrors();
		for (FieldError objectError : errors) {
			System.out.println(objectError.getRejectedValue());
		}

		reg.saveOrUpdateUser(v);

		model.addAttribute("user_id", v.getUser_id());
		  model.addAttribute("info", v);
		return "profile";

	}

	@RequestMapping(value="/payment/{id}", method = RequestMethod.GET)
	public String payment(Model model,@PathVariable Long id) throws Exception {

		System.out.println("edycja zamowienia uzytkownika o id" + id);
		CustomerOrder customer = new CustomerOrder();
		customer = co.getCustomerOrder(id);
		if(customer!=null)
		{
		customer.setStatus("Zapłacono");

		co.updateCustomerOrder(customer);
		model.addAttribute("payment", customer);
		}
		else
		{
			model.addAttribute("payment", null);
		}
		return "profile";

	}

	@RequestMapping(value = "/infoAboutOrder/{id}", method = RequestMethod.GET)
	public String info(@PathVariable Long id, Model model) throws Exception {

		System.out.println("edycja zamowienia uzytkownika o id" + id);

		CustomerOrder customer = co.getCustomerOrder(id);

		model.addAttribute("info", ois.getOrderItems(customer));

		return "infoAboutOrder";

	}
	@ModelAttribute("userDetail")
	public List<UserNfzDetails> loadTypes() {
		List<UserNfzDetails> types = reg.getNfzDetails();
		
		System.out
				.println("Ładowanie listy "
						+ types.size()
						+ " typów - typy będą załadowane tylko raz na sesję, gdyż została użyta adnotacja @SessionAttributes(value={\"categoryType\"})");
		return types;
	}
	/*@ModelAttribute("userDetail")
	public List<UserNfzDetails> loadNfzDetails(HttpSession session) {
		List<UserNfzDetails> types ;
		if(session.getAttribute("nfz")==null)
		{
			types=reg.getNfzDetails();
		System.out
				.println("Ładowanie listy "
						+ types.size()
						+ " typów - typy będą załadowane tylko raz na sesję, gdyż została użyta adnotacja @SessionAttributes(value={\"productType\"})");
		session.setAttribute("nfz", types);
		return types;
		}
		else
		{
			types= (List<UserNfzDetails>)session.getAttribute("nfz");
			return types;
		}
	}*/
}
