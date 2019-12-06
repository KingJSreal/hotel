package kangjaesu.hotel.promotion.dao;

import java.util.List;
import java.util.Map;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;

public interface PromotionDao {
	Map<Promotion, PromotionDetail> getPros();
	List<Promotion> getBoardPros();
	
	int addpro(Promotion promotion);
	int addprod(PromotionDetail prod);
}
