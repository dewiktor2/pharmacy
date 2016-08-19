package app.Spring.controllers;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import app.Spring.controllers.commands.LogonCommand;
import app.Spring.dao.CategoryDaoImpl;
import app.Spring.dao.ProductDao;
import app.Spring.dao.ProductDaoImpl;
import app.Spring.domain.Category;
import app.Spring.domain.Product;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@Controller
public class CategoryController{
	
	@Autowired
	CategoryDaoImpl dao;
	
	@Autowired
	ProductDaoImpl dao2;
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@RequestMapping(value="/categoryList", method = RequestMethod.GET)
	    public String category(Model model){
	       List<Category> categories = dao.getAllCategories();
	        model.addAttribute("categoryList", categories);
/*	        model.addAttribute("pages",dao.getNumOfPages());
	        model.addAttribute("currentPage",1);*/
	        return "categoryList";
	}
	     
/*	@RequestMapping("/categoryList/{page}")
	       public String categoryPage(Model model, @PathVariable(value="page") final int page){
	        List<Category> categories = dao.Pagination(page);
	         
	        model.addAttribute("pages",dao.getNumOfPages());
	        model.addAttribute("categoryList", categories);
	        model.addAttribute("currentPage",page);
	        return "categoryList";
	}
*/


	@RequestMapping(value="/categoryList.html", method = RequestMethod.GET, params={"did"})
	public String deleteProduct(@RequestParam("did") Long id,HttpSession session,final RedirectAttributes redirectAttributes){
		LogonCommand logon = (LogonCommand)session.getAttribute("logInSessionAdmin");
		Category cat =dao.getCategory(id);
		List<Product> products = dao2.getProductsByCategory(cat);
		if(logon==null)
		{
			log.info("nie masz wystarczajacych uprawnien");
			 return "redirect:categoryList.html";
		}
		else if(!products.isEmpty())
		{
			redirectAttributes.addFlashAttribute("errorDelete", id);
			return "redirect:categoryList.html";
		}
		else
		{
		System.out.println("Usuwanie categorii o id="+id);
		dao.deleteCategory(dao.getCategory(id));
		redirectAttributes.addFlashAttribute("delete", id);
		//Przedrostek :redirect umo�liwia realizacj� przekierowa�.
		return "redirect:categoryList.html";
		}
	}
	
	@RequestMapping(value="/categoryList.html", method = RequestMethod.GET, params={"id"})
	public String showCategoryDetails(Model model, @RequestParam("id") long id,HttpSession session){
		Category cat =dao.getCategory(id);
	    List<Product> products = dao2.getProductsByCategory(cat);
		System.out.println("Pokayzwanie szczego��w");
		model.addAttribute("category", dao.getCategory(id));
		model.addAttribute("products",products);
		return "categoryDetails";
		
	}	
	
	
	
	
}
