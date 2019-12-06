package kangjaesu.hotel.promotion.controller;

import java.util.Map;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.promotion.service.PromotionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/promotion")
public class PromotionController {
	@Autowired private PromotionService promotionService;
	
	@Transactional
	@RequestMapping("/addPromotion")
	@ResponseBody
	public boolean addPromotion(Promotion promotion, PromotionDetail prod){		
		return promotionService.addPromotion(promotion, prod);
	}
	
	@Transactional
	@RequestMapping("/addPro")
	public String addPro(){
		return "promotion/addPro";
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/boardPro")
	public Map<Promotion, PromotionDetail> boardPro(){
		return promotionService.listPros();
	}
	
	@Transactional
	@RequestMapping("/boardProAdmin")
	public String boardProAdmin(Model model){
		model.addAttribute("prolists", promotionService.listBoardPros());
		return "promotion/boardProAdmin";
	}
	
}