package app.Spring.controllers;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.yaml.snakeyaml.JavaBeanDumper;

import app.Spring.controllers.commands.LogonCommand;
import app.Spring.dao.CustomerOrderImpl;
import app.Spring.dao.OpinionService;
import app.Spring.dao.OrderItemImpl;
import app.Spring.dao.ProductDao;
import app.Spring.dao.UserService;
import app.Spring.domain.CustomerOrder;
import app.Spring.domain.OrderItem;
import app.Spring.domain.Product;
import app.Spring.domain.Review;
import app.Spring.domain.ReviewViewModel;
import app.Spring.domain.User;

@Controller
@RequestMapping("/user/review")
public class OpinionController {

	@Autowired
	ProductDao dao;

	@Autowired
	UserService userService;

	@Autowired
	OpinionService opinionService;

	@Autowired
	CustomerOrderImpl customerService;

	@Autowired
	OrderItemImpl orderService;

	@Autowired
	LocalValidatorFactoryBean validator;

	@RequestMapping(value = "/reviewForm", method = RequestMethod.GET)
	public String show(Model model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");

		if (logon == null) {
			return "403";
		}
		session.setAttribute("review", id);
		CustomerOrder customerOrder = customerService.getCustomerOrder(id);

		List<Product> products = new ArrayList<Product>();

		List<OrderItem> order2 = new ArrayList<OrderItem>();

		order2 = orderService.getOrderItems(customerOrder);
		for (OrderItem s : order2) {
			products.add(s.getProduct());

		}

		Product product = new Product();
		product.setOrderitems(order2);

		Review review = new Review();
		review.setProduct(product);
		ReviewViewModel reviewViewModel = new ReviewViewModel(product, review);
		model.addAttribute("reviewViewModel", reviewViewModel);
		return "reviewForm";
	}

	@RequestMapping(value = "/reviewForm", method = RequestMethod.POST)
	public String review(Model model,
			@ModelAttribute("reviewViewModel") ReviewViewModel reviewViewModel,
			final RedirectAttributes redirectAttributes, BindingResult result,
			HttpSession session) {

		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");

		if (logon == null) {
			return "403";
		}

		Long intVal = null;
		try {
			intVal = Long.parseLong(reviewViewModel.getProduct().getName());
		} catch (java.lang.NumberFormatException ex) {
			Long id = (Long) session.getAttribute("review");
			redirectAttributes.addFlashAttribute("errorLista", id);
			session.removeAttribute("review");
			return "redirect:/user/review/reviewForm?id=" + id;
		}

		OrderItem item = orderService.getOrderItem(intVal);
		reviewViewModel.getReview().setProduct(
				dao.getProduct(item.getProduct().getId()));

		reviewViewModel.getReview().setCreateDate(new Date());

		redirectAttributes
				.addFlashAttribute("reviewViewModel", reviewViewModel);

		return "redirect:/user/review/reviewFormDetails";
	}

	@RequestMapping(value = "/reviewFormDetails", method = RequestMethod.GET)
	public String reviewDetail2(Model model,
			@ModelAttribute("reviewViewModel") ReviewViewModel reviewViewModel,
			BindingResult result, HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");

		if (logon == null) {
			return "403";
		}

		model.addAttribute("reviewViewModel", reviewViewModel);
		return "reviewFormDetails";
	}

	@RequestMapping(value = "/reviewFormDetails", method = RequestMethod.POST, params = {
			"save", "!cancel" })
	public String save(Model model,
			final RedirectAttributes redirectAttributes,
			@ModelAttribute("reviewViewModel") ReviewViewModel reviewViewModel,
			BindingResult result, HttpSession session) {

		validator.validate(reviewViewModel.getReview(), result);

		List<FieldError> errors = result.getFieldErrors();
		for (FieldError objectError : errors) {
			System.out.println(objectError.getRejectedValue());
		}

		if (result.hasErrors()) {

			Long id = (Long) session.getAttribute("review");
			redirectAttributes.addFlashAttribute("error", id);
			session.removeAttribute("review");
			return "redirect:/user/review/reviewForm?id=" + id;
		}

		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");
		User user = userService.findUserByName(logon.getLogin());
		reviewViewModel.getReview().setUser(user);

		Product p = dao.getProduct(reviewViewModel.getReview().getProduct()
				.getId());

		reviewViewModel.setProduct(p);

		Review review = new Review(user, reviewViewModel.getReview()
				.getProduct());
		review.setCreateDate(new Date());
		review.setReview(reviewViewModel.getReview().getReview());
		p.getReviews().add(review);
		opinionService.add(review);

		return "redirect:/";
	}

	@RequestMapping(value = "/reviewFormDetails", method = RequestMethod.POST, params = {
			"cancel", "!save" })
	public String cancel(Model model,
			@ModelAttribute("reviewViewModel") ReviewViewModel reviewViewModel,
			final RedirectAttributes redirectAttributes, BindingResult result,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSession");

		if (logon == null) {
			return "403";
		}

		return "redirect:/user/profile";
	}

}
