package app.Spring.controllers;






import javax.validation.Validator;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;




import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import app.Spring.dao.ProductDao;
import app.Spring.domain.Product;
import app.Spring.domain.ProductType;







@Controller
@SessionAttributes(value={"productType"})
public class ProductFormController {
	
	@Autowired
	LocalValidatorFactoryBean validator;

	protected final Log log = LogFactory.getLog(getClass());//Dodatkowy komponent do logowania
	
	@Autowired
	ProductDao dao ;// =new StaticProductDao();
	
	@RequestMapping(value="/productForm.html", method=RequestMethod.GET)
	public String showForm(Model model, @RequestParam(value="id", defaultValue="-1") Long id, HttpSession session){
		
		app.Spring.domain.Product v = (id>0)?dao.getProduct(id):new Product();
		
		model.addAttribute("product", v);
		return "productForm";
	}
	//@Valid
	@RequestMapping(value="/productForm.html", method=RequestMethod.POST)
	public String processForm(Model model,   @ModelAttribute("product")    Product v, BindingResult result){
		
	//validator.validate(v, result);
		
		validator.validate(v, result);
		
		
		if(result.hasErrors()){
			return "productForm";
			}
		else  if (v.getPrice()==111.00) {
				result.rejectValue("price", "Range.product.price");
			      return "home";
			    }
		
		//model.addAttribute("operationType", (v.getId()>0?"edit":"add"));
	
		
		
		
		List<FieldError> errors =result.getFieldErrors();
		for (FieldError objectError : errors) {
			System.out.println(objectError.getRejectedValue());
		}
		
		
		dao.saveOrUpdateProduct(v);

		return "Show";
	}	
	
	
	@ModelAttribute("productType")
	public List<ProductType> loadTypes(){
		List<ProductType> types = dao.getProductTypes();
		System.out.println("£adowanie listy "+types.size()+" typów - typy bêd¹ za³adowane tylko raz na sesjê, gdy¿ zosta³a u¿yta adnotacja @SessionAttributes(value={\"productType\"})");
		return types;
	}
	

	
	
    @InitBinder
    public void initBinder(WebDataBinder binder) {//Rejestrujemy edytory w³aœciwoœci
    	
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }	
	
	

	/*
	
    <beans:bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
	<beans:property name="webBindingInitializer" ref="webBindingInitializer">
    </beans:property>
    </beans:bean>
	*/
	
}








