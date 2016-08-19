package app.Spring.controllers;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import app.Spring.dao.UserService;
import app.Spring.domain.User;

@Controller
@SessionAttributes(value = { "user" })
public class RegisterFormController {

	boolean omg = true;
	@Autowired
	LocalValidatorFactoryBean validator;

	@Autowired
	UserService dao;

	@RequestMapping(value = "/registerForm.html", method = RequestMethod.GET)
	protected String handleRequestInternal(ModelMap model) throws Exception {

		User user = new User();

		model.addAttribute("user", user);
		return "registerForm";
	}

	@RequestMapping(value = "/registerForm.html", method = RequestMethod.POST)
	public String processForm(Model model,
			@ModelAttribute("user") User user, BindingResult result,
			HttpSession session) {

		validator.validate(user, result);

		List<FieldError> errors = result.getFieldErrors();
		for (FieldError objectError : errors) {
			System.out.println(objectError.getRejectedValue());
		}

		if (result.hasErrors()) {

			model.addAttribute("fail", user);
			return "registerForm";
		}

		if (dao.exists(user) == true) {
            
			model.addAttribute("wrong", user);
			return "registerForm";
		} else {
			model.addAttribute("success", user);
			dao.add(user);
			return "registerInfo";
		}

	}

	@RequestMapping(value = "/glowna.html", method = RequestMethod.GET)
	public String redirect() {
		return "redirect:/";
	}

}
