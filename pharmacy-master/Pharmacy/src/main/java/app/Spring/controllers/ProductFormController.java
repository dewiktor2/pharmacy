package app.Spring.controllers;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import app.Spring.controllers.commands.LogonCommand;
import app.Spring.dao.ProductDao;
import app.Spring.domain.Category;
import app.Spring.domain.Product;
import app.Spring.domain.ProductType;

@Controller
@SessionAttributes(value = { "categoryType,productType" })
public class ProductFormController {

	@Autowired
	LocalValidatorFactoryBean validator;

	protected final Log log = LogFactory.getLog(getClass());// Dodatkowy
															// komponent do
															// logowania

	@Autowired
	ProductDao dao;// =new StaticProductDao();

	private ServletContext servletContext;

	@RequestMapping(value = "/productForm.html", method = RequestMethod.GET)
	public String showForm(ModelMap model,
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			HttpSession session) {
		LogonCommand logon = (LogonCommand) session
				.getAttribute("logInSessionAdmin");
		if (logon == null) {
			log.info("nie masz wystarczajacych uprawnien");
			return "redirect:productList.html";
		} else {

			app.Spring.domain.Product v = (id > 0) ? dao.getProduct(id)
					: new Product();
			
			
       
			model.addAttribute("product", v);
			session.setAttribute("produkt_id", v);
			return "productForm";
		}
	}
	
	
	@RequestMapping(value = "/productForm.html", method = RequestMethod.POST)
	public String processForm(Model model,
			@ModelAttribute("product") Product v, BindingResult result,
			HttpSession session,
			@RequestParam(value = "image", required = false) MultipartFile image) {
		
		
			
			if(v.getImage()!=null && image.isEmpty())
			{
				
				validator.validate(v, result);
				
				List<FieldError> errors = result.getFieldErrors();
				for (FieldError objectError : errors) {
					System.out.println(objectError.getRejectedValue());
				}
				if (result.hasErrors()) {

					return "productForm";
				}
				Product image2 = (Product)session.getAttribute("produkt_id");
				
				byte[] bytes = image2.getImage();
				v.setImage(bytes);
				session.removeAttribute("produkt_id");
				dao.saveOrUpdateProduct(v);
				
				model.addAttribute("edit", v);
				return "Show";
			}
		
		
	 if (!image.isEmpty()) {
			try {
				byte[] bytes = image.getBytes();

				
				ImageInputStream iis = ImageIO.createImageInputStream(new ByteArrayInputStream(bytes));

			
				
				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + v.getName());
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				String cos = v.getName();
				Iterator<ImageReader> readers = ImageIO.getImageReaders(iis);
				while (readers.hasNext()) {
				    ImageReader read = readers.next();
				    System.out.println("format name = " + read.getFormatName());
				    if(read.getFormatName()=="png")
				    {
				    	v.setFileName(cos + ".png");
				    }
				    else if(read.getFormatName()=="JPEG")
				    {
				    	v.setFileName(cos + ".jpg");
				    }
				}
				
				

				if (v.getName() != null && v.getName().equals("admin"))
					result.rejectValue("name", "wrongName.product.name");

				System.out.println("zdjecie"+v.getImage());
				validateImage(image);
			
				validator.validate(v, result);
				
				List<FieldError> errors = result.getFieldErrors();
				for (FieldError objectError : errors) {
					System.out.println(objectError.getRejectedValue());
				}

				
				if (result.hasErrors()) {

					return "productForm";
				}

			    System.out.println("dane produktu"+v.getFactory()+v.getName()+v.getPrice());
				dao.saveOrUpdateProduct(v);

				System.out.println("Server File Location="
						+ serverFile.getAbsolutePath());

				System.out.println("You successfully uploaded file="
						+ v.getName());
			} catch (Exception e) {
				System.out.println("You failed to upload " + v.getName()
						+ " => " + e.getMessage());
			}
             model.addAttribute("add", v);
			return "Show";
		}

		else {
			model.addAttribute("zdjecie", v);
			return "productForm";
		}

	}

	
	
	
	
	private void saveImage(String string, MultipartFile image) {
		// TODO Auto-generated method stub

	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {// Rejestrujemy edytory
													// w�a�ciwo�ci

		
		binder.registerCustomEditor(byte[].class,
				new ByteArrayMultipartFileEditor());

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));

	}

	/*
	 * 
	 * <beans:bean class=
	 * "org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter"
	 * > <beans:property name="webBindingInitializer"
	 * ref="webBindingInitializer"> </beans:property> </beans:bean>
	 */

	private void validateImage(MultipartFile image) {
		if (image.getContentType().equals("image/jpeg") )
		{
			
		}
		else if(	image.getContentType().equals("image/png") ) {
			
		}
		else
		{
			throw new RuntimeException("Only JPG or PNG images are accepted");
			
		}
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;

	}
	public byte[] getImage(Product v)
	{
		long id = v.getId();
		Product product = dao.getProduct(id);
		
		
		return product.getImage();
		
	}

	@ModelAttribute("categoryType")
	public List<Category> loadTypes() {
		List<Category> types = dao.getCategories();
		System.out
				.println("Ładowanie listy "
						+ types.size()
						+ " typów - typy będą załadowane tylko raz na sesję, gdyż została użyta adnotacja @SessionAttributes(value={\"categoryType\"})");
		return types;
	}
	@ModelAttribute("productType")
	public List<ProductType> loadProductType() {
		List<ProductType> types = dao.getTypes();
		System.out
				.println("Ładowanie listy "
						+ types.size()
						+ " typów - typy będą załadowane tylko raz na sesję, gdyż została użyta adnotacja @SessionAttributes(value={\"productType\"})");
		return types;
	}

}
