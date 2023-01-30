package com.patinshop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.patinshop.dao.CusEmailsDAO;
import com.patinshop.dao.ProductDAO;
import com.patinshop.dao.ProductSizeDAO;
import com.patinshop.dao.SizeDAO;
import com.patinshop.entity.CusEmailsEntity;
import com.patinshop.entity.ProductEntity;
import com.patinshop.entity.ProductSizeEntity;
import com.patinshop.entity.SizeEntity;
import com.patinshop.model.MailInfo;
import com.patinshop.service.MailService;

@Controller
public class ProductManager {

	@Autowired
	ProductDAO prodDao;

	@Autowired
	ServletContext context;

	@Autowired
	HttpSession session;
	
	@Autowired
	CusEmailsDAO cusEmailDao;
	
	@Autowired
	MailService mailer;
	
	@Autowired
	SizeDAO sizeDao;
	
	@Autowired
	ProductSizeDAO psDao;

	PagedListHolder<ProductEntity> prodPageList;
	
	@RequestMapping("admin/accessory/index")
	public String AccessIndex(ModelMap model) {
		prodPageList = new PagedListHolder<ProductEntity>();
		prodPageList.setSource(prodDao.findAll(true));
		prodPageList.setPageSize(4);
		session.setAttribute("prodList", prodPageList);
		session.setAttribute("type", "accessories"); // 1 phần của image src
		session.setAttribute("sizes", sizeDao.findAll());
		return "admin/product/index";
	}

	@RequestMapping("admin/product/index")
	public String prodIndex(ModelMap model) {
		prodPageList = new PagedListHolder<ProductEntity>();
		prodPageList.setSource(prodDao.findAll(false));
		prodPageList.setPageSize(4);
		session.setAttribute("prodList", prodPageList);
		session.setAttribute("type", "products"); // 1 phần của image src
		session.setAttribute("sizes", sizeDao.findAll());
		return "admin/product/index";
	}

	@RequestMapping("admin/product/addnew")
	public String add(ModelMap model) {
		model.addAttribute("option", "addnew");
		ProductEntity prod = new ProductEntity();
		prod.setCreateAt(new Date());
		prod.setViewCount(0);
		if(session.getAttribute("type").toString().equals("products")) {
			prod.setIs_accessory(false);
		} else prod.setIs_accessory(true);
		model.addAttribute("prod", prod);
		return "admin/product/form";
	}

	@RequestMapping("admin/product/create")
	public String create(ModelMap model, HttpServletRequest req, @RequestParam(value="sizes", required = false) Integer[] sizes, 
				@RequestParam(value="notifyCheck", required = false) String notifyCheck,
				@Validated @ModelAttribute("prod") ProductEntity prod, BindingResult error) throws MessagingException {
		
		String type = session.getAttribute("type").toString().equals("products") ? "product" : "accessory";
		boolean withAccessory = type.equals("accessory");
		
		ProductEntity item = prodDao.findById(prod.getId());

		if (item != null) {
			error.rejectValue("id", "prod", "Mã sản phẩm đã tồn tại!");
		}

		if (prod.getDiscount() != null && prod.getDiscount() > prod.getPrice()) {
			error.rejectValue("price", "prod", "Giá khuyến mãi phải bé hơn giá gốc!");
		}
		
		if( sizes == null || sizes.length == 0) {
			error.rejectValue("description", "prod", "Chọn các size có thể có!");
		}

		if (error.hasErrors()) {
			model.addAttribute("msgErr", "Có lỗi xảy ra!");
			model.addAttribute("option", "addnew");
			return "admin/product/form";

		}
		
		if(notifyCheck != null) {
			List<CusEmailsEntity> emailList = cusEmailDao.findAll();
			List<String> temp = new ArrayList<String>();
			for(CusEmailsEntity e : emailList) {
				temp.add(e.getEmail());
			}
			String[] emails = temp.toArray(new String[0]);
			
			MailInfo myMail = new MailInfo();
			myMail.setFrom("tranhoangphi0987@gmail.com");
			myMail.setPpl(emails);
			myMail.setSubject("SẢM PHẨM MỚI, HÀNG NÓNG, CLICK ĐỂ XEM!");
			
			String link = req.getRequestURL().
					toString().replace("/admin/product/create", "/product/detail/" + prod.getId());
			myMail.setContent("<a href='" + link + "'>Xem ngay</a>");
			
			mailer.send(myMail);
		}
		prod.setImage("product.png"); // set ảnh mặc định
		prod = prodDao.create(prod);
		
		// Thêm available sizes cho mặt hàng này
		for(int i = 0; i < sizes.length; i++) {
			ProductSizeEntity ps = new ProductSizeEntity();
			SizeEntity s = new SizeEntity();
			ps.setProduct(prod);
			s.setSizeNum(sizes[i]);
			ps.setSize(s);
			psDao.create(ps);
		}
		
		model.addAttribute("option", "addnew");
		model.addAttribute("msgSucc", "Thêm sản phẩm thành công!");
		model.addAttribute("highlighted", prod.getId());
		prodPageList.setSource(prodDao.findAll(withAccessory));
		prodPageList.setPage(prodPageList.getPageCount() - 1); // chạy về page cuối
		return "admin/product/index";
	}

	@RequestMapping("admin/product/edit/{cid}")
	public String edit(ModelMap model, @PathVariable("cid") String cid) {
		ProductEntity prod = prodDao.findById(cid);
		List<ProductSizeEntity> prodSizes = prod.getProductSize();
		List<Integer> sizes = new ArrayList<Integer>();
		for(ProductSizeEntity ps : prodSizes) {
			sizes.add(ps.getSize().getSizeNum());
		}
		model.addAttribute("prod", prod);
		session.setAttribute("prodSizes", sizes);
		model.addAttribute("option", "edit");
		return "admin/product/form";
	}

	@RequestMapping("admin/product/update")
	public String update(ModelMap model, @RequestParam(value="sizes", required = false) Integer[] sizes,
			@Validated @ModelAttribute("prod") ProductEntity prod, BindingResult error, 
			@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		
		String type = session.getAttribute("type").toString().equals("products") ? "product" : "accessory";
		boolean withAccessory = type.equals("accessory");
		
		if (!file.isEmpty()) {
			String dir = context.getRealPath("/resources/assets/images/products/") + file.getOriginalFilename();
			File f = new File(dir);
			if (!f.exists()) {
				f.mkdir();
			}
			file.transferTo(f);
			prod.setImage(f.getName());
		}
		
		if( sizes == null || sizes.length == 0) {
			error.rejectValue("description", "prod", "Chọn các size có thể có!");
		}
		
		if(error.hasErrors()) { // cái này đặt lên trước để lỡ giá gốc có null thì bắt luôn
			model.addAttribute("option", "edit");
			return "admin/product/form";
		}
		
		if( prod.getDiscount() != null && prod.getDiscount() > prod.getPrice()) { // cái này để sau vì chạy dc tới đây rồi thì giá gốc chứng tỏ ko null
			error.rejectValue("discount", "prod", "Giá khuyến mãi phải bé hơn giá gốc");
			model.addAttribute("option", "edit");
			return "admin/product/form";
		}
		
		// Thêm available sizes cho mặt hàng này
		for(int i = 0; i < sizes.length; i++) {
			ProductSizeEntity ps = new ProductSizeEntity();
			SizeEntity s = new SizeEntity();
			ps.setProduct(prod);
			s.setSizeNum(sizes[i]);
			ps.setSize(s);
			if(!psDao.isExisted(prod.getId(), sizes[i])) {
				psDao.create(ps);
			}
		}

		prodDao.update(prod);
		model.addAttribute("msgSucc", "Cập nhật sản phẩm thành công!");
		model.addAttribute("highlighted", prod.getId());
		prodPageList.setSource(prodDao.findAll(withAccessory));
		prodPageList.setPage(prodPageList.getPage()); // ở lại page hiện tại
		return "admin/product/index";
	}

	@RequestMapping(value = { "admin/product/delete", "admin/product/delete/{cid}" })
	public String delete(ModelMap model, @RequestParam(value = "id", required = false) String cid1,
			@PathVariable(value = "cid", required = false) String cid2) {
		String cid = (cid1 != null) ? cid1 : cid2;
		ProductEntity prod = prodDao.findById(cid);
		
		String type = session.getAttribute("type").toString().equals("products") ? "product" : "accessory";
		boolean withAccessory = type.equals("accessory");
		
		if(!prod.getOrderDetails().isEmpty()) {
			model.addAttribute("msgErr", "Sản phẩm này đang được sử dụng, không thể xóa!");
			return "admin/product/index";
		}
		
		// nếu page hiện tại vẫn còn nhiều hơn 1 item thì ở lưu lại stt của page đó
		// trường hợp còn đúng 1 item tức là đang ở trang cuối r đó
		int currPage = prodPageList.getPageCount() - 1;
		if(prodPageList.getPageList().size() > 1) {
			currPage = prodPageList.getPage();
		}
		
		prodDao.delete(cid);
		model.addAttribute("msgSucc", "Xóa sản phẩm thành công!");
		prodPageList.setSource(prodDao.findAll(withAccessory));
		prodPageList.setPage(currPage);
		return "admin/product/index";
	}

	@RequestMapping(value = {"admin/product/page/{page}", "admin/accessory/page/{page}"})
	public String page(@PathVariable(value = "page", required = false) String page) {
		if (page.equals("prev")) {
			prodPageList.previousPage();
		} else if (page.equals("next")) {
			prodPageList.nextPage();
		} else {
			int pageNum = Integer.parseInt(page);
			prodPageList.setPage(pageNum - 1);
		}
		return "admin/product/index";
	}
}
