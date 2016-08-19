package app.Spring.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import app.Spring.dao.ProductDaoImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {

	
	@Autowired
	ProductDaoImpl dao;
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}
	
	@RequestMapping(value = "/user/cart.html", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		


		return "cart";
	}
	
	@RequestMapping(value = "/redirect.html",method = RequestMethod.GET)
	protected String showForm2( Model model)
			throws Exception {

	return  "redirect";
	}
	@RequestMapping(value = "/info.html", method = RequestMethod.GET)
	protected String handleRequestInternal(ModelMap model) throws Exception {

		return "info";
	}
	


}
