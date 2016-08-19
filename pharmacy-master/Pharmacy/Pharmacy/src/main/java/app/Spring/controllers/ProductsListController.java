package app.Spring.controllers;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import app.Spring.dao.ProductDao;

@Controller
public class ProductsListController{
	
	@Autowired
	ProductDao dao ; // =new StaticProductDao();

	@RequestMapping(value="/productList.html", method = RequestMethod.GET)
	protected String handleRequestInternal(ModelMap model) throws Exception {
		
		model.addAttribute("productList", dao.getAllProducts());
		return "productList";
	}
	
	@RequestMapping(value="/productList.html", method = RequestMethod.GET, params={"did"})
	public String deleteProduct(@RequestParam("did") Long id){
		System.out.println("Usuwanie produktu o id="+id);
		dao.deleteProduct(dao.getProduct(id));
		//Przedrostek :redirect umo¿liwia realizacjê przekierowañ.
		return "redirect:productList.html";
	}
	
	@RequestMapping(value="/productList.html", method = RequestMethod.GET, params={"id"})
	public String showProductDetails(Model model, @RequestParam("id") Long id){
		System.out.println("Pokazywanie detali");
		model.addAttribute("product", dao.getAllProducts()); // dao.getAllProducts().get((int)(id-1)));
		return "productDetails";
	}	
}
