package app.Spring.controllers;

import javax.validation.Validator;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.multipart.support.StringMultipartFileEditor;

import app.Spring.controllers.commands.LogonCommand;
import app.Spring.dao.CategoryDaoImpl;
import app.Spring.dao.ProductDao;
import app.Spring.dao.ProductDaoImpl;
import app.Spring.domain.Category;
import app.Spring.domain.Product;


@Controller
public class CategoryFormController {

	@Autowired
	LocalValidatorFactoryBean validator;

	protected final Log log = LogFactory.getLog(getClass());// Dodatkowy
															// komponent do
															// logowania

	@Autowired
	CategoryDaoImpl dao;// =new StaticProductDao();

	@Autowired
	ProductDaoImpl dao2;
	
	
	private ServletContext servletContext;

	@RequestMapping(value = "/categoryForm.html", method = RequestMethod.GET)
	public String showForm(ModelMap model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			log.info("nie masz wystarczajacych uprawnien");
			return "redirect:categoryForm.html";
		} else {
			app.Spring.domain.Category v = (id > 0) ? dao.getCategory(id)
					: new Category();

			model.addAttribute("category", v);
			return "categoryForm";
		}
	}

	@RequestMapping(value = "/categoryForm.html", method = RequestMethod.POST)
	public String processForm(Model model,
			@ModelAttribute("category") Category v, BindingResult result,
			HttpSession session) {
		
	           
			
						validator.validate(v, result);

						if (v.getName() != null && v.getName().equals("admin"))
							result.rejectValue("name", "wrongName.product.name");

						if (result.hasErrors()) {

							return "categoryForm";
						}

						List<FieldError> errors = result.getFieldErrors();
						for (FieldError objectError : errors) {
							System.out.println(objectError.getRejectedValue());
						}

						dao.saveOrUpdateCategory(v);
                   
		              model.addAttribute("edit", v);
		              model.addAttribute("products",dao2.getProductsByCategory(v));
		        	return "categoryDetails";
		        	
			        }
						
						
		           
	



	@InitBinder
	public void initBinder(WebDataBinder binder) {// Rejestrujemy edytory
													// w�a�ciwo�ci
	
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	
	}



		 

}