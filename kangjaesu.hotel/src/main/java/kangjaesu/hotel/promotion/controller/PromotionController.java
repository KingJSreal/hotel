package kangjaesu.hotel.promotion.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.promotion.domain.Search;
import kangjaesu.hotel.promotion.service.PromotionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/promotion")
public class PromotionController {
	@Autowired private PromotionService promotionService;
	
	@Transactional
	@RequestMapping("/addPromotion")
	@ResponseBody
	public boolean addPromotion(Promotion promotion, HttpServletRequest request){
	    String[] prodTitle = request.getParameterValues("prodTitle");
	    String[] location = request.getParameterValues("location");
	    //String[] prodPic = request.getParameterValues("prodPic");
	    String[] serviceHour = request.getParameterValues("serviceHour");
	    String[] notice = request.getParameterValues("notice");
	    String[] prodContent = request.getParameterValues("prodContent");
	    
	    List<PromotionDetail> prods = new ArrayList<PromotionDetail>();
	    
	    for(int i = 0; i < prodTitle.length; i++){
	    	PromotionDetail prod = new PromotionDetail();
	    	prod.setProdTitle(prodTitle[i]);
	    	prod.setLocation(location[i]);
	    	prod.setServiceHour(serviceHour[i]);
	    	prod.setNotice(notice[i]);
	    	prod.setProdContent(prodContent[i]);
	    	
	    	prods.add(prod);
	    }
	    
		return promotionService.addPromotion(promotion, prods);
	}
	
	@Transactional
	@RequestMapping("/addPro")
	public String addPro(){
		return "promotion/addPro";
	}
	
	@Transactional
	@RequestMapping(value="/boardProAdmin", method=RequestMethod.GET)
	public String boardProAdmin(Model model, 
			@RequestParam(required=false) String keyword,
			@RequestParam(required=false) Date schStartDate,
			@RequestParam(required=false) Date schEndDate) {
		Search search = new Search();
		search.setKeyword(keyword);
		search.setSchStartDate(schStartDate);
		search.setSchEndDate(schEndDate);
		//int listCnt = promotionService.boardProsCnt(search);
		
		model.addAttribute("pagination", search);
		model.addAttribute("listProsAdmin", promotionService.listBoardPros(search));
		System.out.println("=======================================");
		System.out.println(keyword);
		System.out.println(schStartDate);
		System.out.println(schEndDate);
		System.out.println("=======================================");
		
		return "promotion/boardProAdmin";
	}
	
	@Transactional
	@RequestMapping("/boardPro")
	public String boardPro(Model model){
		model.addAttribute("listPros", promotionService.listPros());

		return "promotion/boardPro";
	}
	
	@Transactional
	@RequestMapping(value="/detailPro", method=RequestMethod.GET)
	public String detailPro(Model model, @RequestParam("proNum") int proNum){
		model.addAttribute("listPro", promotionService.listPro(proNum));
		
		return "promotion/detailPro";
	}

}