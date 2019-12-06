package kangjaesu.hotel.promotion.service;

import java.util.List;
import java.util.Map;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;

public interface PromotionService {
	Map<Promotion, PromotionDetail> listPros();
	List<Promotion> listBoardPros();
	
	boolean addPromotion(Promotion promotion, PromotionDetail prod);
}
