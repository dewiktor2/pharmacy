package app.Spring.controllers;

import java.io.ByteArrayInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import app.Spring.controllers.commands.LogonCommand;
import app.Spring.dao.ProductDao;
import app.Spring.domain.Product;
import app.Spring.domain.Review;

@Controller
public class ProductsListController {
	protected final Log log = LogFactory.getLog(getClass());// Dodatkowy
	// komponent do
	// logowania

	@Autowired
	ProductDao dao; // =new StaticProductDao();
	private int maxOnPage = 2;
	private int endingIndex;
	int per=0;
	int limit =0;
    int currentPagee =1;
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String ogloszenia(Model model,HttpSession session) {
		
		List<Product> products = dao.Pagination(1);
		model.addAttribute("productList", products);
		int page =dao.getNumOfPages();
		
		model.addAttribute("pages", dao.getNumOfPages());
		model.addAttribute("currentPage", 1);
		session.removeAttribute("recipe");
		return "productList";
	}
	
	@RequestMapping(value = "/productList/recipe", method = RequestMethod.GET)
	public String ogloszenia2(Model model,HttpSession session) {
		
		
		List<Product> products = dao.PaginationRecipe(1,2);
		model.addAttribute("productList", products);
		model.addAttribute("pages", dao.getNumOfPagesRecipe());
		model.addAttribute("currentPage", 1);
		model.addAttribute("recepta", 1);
		session.setAttribute("recipe", 1);
		return "productList";
	}

	@RequestMapping(value = "/productList/{id}/image", method = RequestMethod.GET)
	public String showImage(@PathVariable("id") Long id,
			HttpServletResponse response, Model model) {
		Product item = dao.getProduct(id);
		if (item != null) {
			byte[] image = item.getImage();
			
			if (image != null) {
				System.out.println("JEST phota");
				try {
					OutputStream out = response.getOutputStream();
					IOUtils.copy(new ByteArrayInputStream(image), out);
					out.flush();
					out.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return "productList";
	}
	@RequestMapping(value = "/{id}/image", method = RequestMethod.GET)
	public String showImage2(@PathVariable("id") Long id,
			HttpServletResponse response, Model model) {
		Product item = dao.getProduct(id);
		if (item != null) {
			byte[] image = item.getImage();
			
			if (image != null) {
				System.out.println("JEST phota");
				try {
					OutputStream out = response.getOutputStream();
					IOUtils.copy(new ByteArrayInputStream(image), out);
					out.flush();
					out.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return "productList";
	}

	@RequestMapping("/productList/{page}")
	public String ogloszeniaStrony(Model model,
			@PathVariable(value = "page") final int page) {
		List<Product> products = dao.Pagination(page);

		model.addAttribute("pages", dao.getNumOfPages());
		model.addAttribute("productList", products);
		model.addAttribute("currentPage", page);
		return "productList";
	}
	@RequestMapping("/productListRecipe/{page}")
	public String ogloszeniaStrony2(Model model,
			@PathVariable(value = "page") final int page) {
		List<Product> products =  dao.PaginationRecipe(1,2);
		model.addAttribute("pages", dao.getNumOfPagesRecipe());
		model.addAttribute("productList", products);
		model.addAttribute("currentPage", page);
		return "productList";
	}

	@RequestMapping(value = "/productList", method = RequestMethod.GET, params = { "did" })
	public String deleteProduct(@RequestParam("did") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			log.info("nie masz wystarczajacych uprawnien");
			return "redirect:productList.html";
		} else {
			System.out.println("Usuwanie produktu o id=" + id);
			dao.deleteProduct(dao.getProduct(id));
			// Przedrostek :redirect umo�liwia realizacj� przekierowa�.
			return "redirect:productList.html";
		}
	}

	@RequestMapping(value = "/productList", method = RequestMethod.GET, params = { "id" })
	public String showProductDetails(Model model, @RequestParam("id") long id,
			HttpSession session) {

		System.out.println("Pokayzwanie szczego��w");
		Product product =dao.getProduct(id);
		System.out.println("lista to"+product.getReviews().size());
		List<Review> reviews = product.getReviews();
		if(reviews.size()==0)
		{
			
			model.addAttribute("reviews", reviews);
			model.addAttribute("product", dao.getProduct(id));
			model.addAttribute("pages", product.getReviews().size());
			model.addAttribute("currentPage", 1);
			return "productDetails";
		}
		reviews=Pagination(1,reviews);
		int pages =product.getReviews().size();
		int currentPage =1;
		
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("product", dao.getProduct(id));
		model.addAttribute("pages", getNumOfPages(product.getReviews().size()));
		model.addAttribute("currentPage", 1);
		return "productDetails";

	}
	
	@RequestMapping(value = "/productList/{page}", method = RequestMethod.GET, params = { "id" })
	public String showProductDetails2(Model model, @RequestParam("id") long id,
			HttpSession session,@PathVariable(value = "page") final int page) {
		
		Product product =dao.getProduct(id);
		List<Review> reviews = product.getReviews();
		if(reviews.size()==0)
		{
			
			model.addAttribute("reviews", reviews);
			model.addAttribute("product", dao.getProduct(id));
			model.addAttribute("pages", product.getReviews().size());
			model.addAttribute("currentPage", page);
			return "productDetails";
		}
		reviews=Pagination(page,reviews);
		int pages =product.getReviews().size();
		int currentPage =1;
		
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("product", dao.getProduct(id));
		model.addAttribute("pages", getNumOfPages(product.getReviews().size()));
		model.addAttribute("currentPage", page);
		return "productDetails";

	}

	
	public List<Review> Pagination(int page,List<Review>reviews) {
		List<Review> reviews2 = paginate(page, maxOnPage,reviews);
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
		 
		
		System.out.println("pages to"+pages);
		return pages;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String Search(Model model,HttpSession session,
			@RequestParam("searchString") String searchString,
			final RedirectAttributes redirectAttributes) {

		if (searchString != null) {
			try {

				long id = dao.findProductIdByName(searchString);
				Product product = dao.getProduct(id);
				
				if (product != null) {
			     
					List<Product> products = new ArrayList<Product>();
					products.add(product);
					System.out.println("produkt " + product.getName());
					redirectAttributes.addFlashAttribute("info", product);
					redirectAttributes.addFlashAttribute("productList",
							products);
					model.addAttribute("productList", products);
					model.addAttribute("info", products);
					if(product.getType().getId()==1)
					{
						
						 products = dao.PaginationRecipe(1,2);
						model.addAttribute("productList", products);
						model.addAttribute("pages", dao.getNumOfPagesRecipe());
						model.addAttribute("currentPage", 1);
						model.addAttribute("recepta", 1);
						return "productList";
					}
					else
					{
						return "productList";
					}
					
				}
			} catch (NullPointerException ex) {
			
					List<Product> products = dao.Pagination(1);
					model.addAttribute("pages", dao.getNumOfPages());
			
					redirectAttributes.addFlashAttribute("productList", products);
					model.addAttribute("error", products);
					redirectAttributes.addFlashAttribute("error", products);
					return "redirect:productList";
					
				

				
			}

		}

		return "productList";
	}

}
