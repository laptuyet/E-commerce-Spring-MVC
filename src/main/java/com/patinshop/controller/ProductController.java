package com.patinshop.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.patinshop.dao.CategoryDAO;
import com.patinshop.dao.ProductDAO;
import com.patinshop.entity.CategoryEntity;
import com.patinshop.entity.ProductEntity;
import com.patinshop.service.CartService;
import com.patinshop.service.CookieService;

@Controller
@Transactional
public class ProductController {

	@Autowired
	CategoryDAO cateDao;

	@Autowired
	ProductDAO prodDao;

	@Autowired
	CookieService cookie;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CartService cart;
	
	PagedListHolder<ProductEntity> prodPageList;
	
	@RequestMapping("/product/accessories")
	public String accessories(ModelMap model) {
		prodPageList = new PagedListHolder<ProductEntity>();
		prodPageList.setSource(prodDao.findAll(true));
		prodPageList.setPageSize(8);
		session.setAttribute("prodList", prodPageList);
		model.addAttribute("baseOption", "accessories");
		return "product/list";
	}

	@RequestMapping("/product/list-by-category/{cid}")
	public String listByCategory(ModelMap model, @PathVariable("cid") Integer categoryId) {
		CategoryEntity cate = cateDao.findById(categoryId);
		prodPageList = new PagedListHolder<ProductEntity>();
		prodPageList.setSource(cate.getProducts());
		prodPageList.setPageSize(8);
		session.setAttribute("prodList", prodPageList);
		model.addAttribute("baseOption", "list-by-category");
		model.addAttribute("cateId", categoryId);
		return "product/list";
	}

	@RequestMapping("/product/list-by-keywords")
	public String listByKeyword( ModelMap model, @RequestParam("keywords") String keywords) {
		prodPageList = new PagedListHolder<ProductEntity>();
		prodPageList.setSource(prodDao.findByKeywords(keywords));
		prodPageList.setPageSize(8);
		session.setAttribute("prodList", prodPageList);
		model.addAttribute("baseOption", "list-by-keywords");
		return "product/list";
	}

	@RequestMapping("/product/detail/{pid}")
	public String detail(ModelMap model, @PathVariable("pid") String pid) {
		ProductEntity prod = prodDao.findById(pid);
		prod.setViewCount(prod.getViewCount() + 1);
		prodDao.update(prod);
		model.addAttribute("prod", prod);

		// relate prods
		CategoryEntity cate = cateDao.findById(prod.getCategory().getId());
		List<ProductEntity> relateProds = cate.getProducts();
		model.addAttribute("list", relateProds);

		// favor prods
		Cookie favor = cookie.read("favor");
		if (favor != null) {
			String ids = favor.getValue();
			List<ProductEntity> favorProds = prodDao.findByIds(ids);
			model.addAttribute("favors", favorProds);
		}
		
		// viewed prods
		Cookie viewed = cookie.read("viewed");
		String value = pid;
		if(viewed != null) {
			value = viewed.getValue();
			if(!value.contains(pid)) {
				value += ("," + pid);
			}
		}
		cookie.create("viewed", value, 7);
		
		List<ProductEntity> viewedProds = prodDao.findByIds(value);
		model.addAttribute("viewed", viewedProds);
		
		return "product/detail";
	}

	@RequestMapping("/product/all")
	public String all(ModelMap model) {
		prodPageList = new PagedListHolder<ProductEntity>();
		prodPageList.setSource( prodDao.findAll(false));
		prodPageList.setPageSize(8);
		session.setAttribute("prodList", prodPageList);
		model.addAttribute("baseOption", "all");
		return "product/list";
	}
	
	@RequestMapping("/product/{baseOption}/page/{page}")
	public String all(ModelMap model,
			@PathVariable(value = "baseOption", required = false) String option,
			@PathVariable(value = "page", required = false) String page) {
		if (page.equals("prev")) {
			prodPageList.previousPage();
		} else if (page.equals("next")) {
			prodPageList.nextPage();
		} else {
			int pageNum = Integer.parseInt(page);
			prodPageList.setPage(pageNum - 1);
		}
		model.addAttribute("baseOption", option);
		return "product/list";
	}

	@RequestMapping("/product/add-to-favor/{pid}")
	@ResponseBody
	public String addToFavor(ModelMap model, @PathVariable("pid") String pid) {
		Cookie ck = cookie.read("favor");
		String value = pid;
		if (ck != null) {
			value = ck.getValue();
			if (!value.contains(pid)) {
				value += ("," + pid);
			} else {
				return "0";
			}
		}
		cookie.create("favor", value, 30);
		return "1";
	}
	
	@RequestMapping("/product/list-by-special/{sid}")
	public String listBySpecial(ModelMap model, @PathVariable("sid") Integer sid) {
		List<ProductEntity> products = prodDao.findBySpecialId(sid);
		
		prodPageList.setSource(products);
		
		session.setAttribute("prodList", prodPageList);
		model.addAttribute("baseOption", "list-by-special");
		return "product/list";
	}
	
	@RequestMapping("product/buy-now/{pid}")
	public String buyNow(@PathVariable("pid") String pid) {
		
		ProductEntity prod = prodDao.findById(pid);
		int size = prod.getProductSize().get(0).getSize().getSizeNum();
		cart.add(pid, size);
		
		return "cart/view";
	}
	
	@RequestMapping("product/filter-price")
	public String filter(ModelMap model,
						@RequestParam("minPrice") Double minPrice,
						@RequestParam("maxPrice") Double maxPrice,
						@RequestParam(value="cateId", required = false) Integer cateId) {
		prodPageList = new PagedListHolder<ProductEntity>();
		prodPageList.setSource( prodDao.filterPrice(minPrice, maxPrice, cateId));
		prodPageList.setPageSize(8);
		session.setAttribute("prodList", prodPageList);
		model.addAttribute("baseOption", "filter-price");
		model.addAttribute("minPrice", minPrice);
		model.addAttribute("maxPrice", maxPrice);
		model.addAttribute("cateId", cateId);
		return "product/list";
	}
}
