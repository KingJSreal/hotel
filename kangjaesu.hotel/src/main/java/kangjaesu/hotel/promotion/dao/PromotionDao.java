package kangjaesu.hotel.promotion.dao;

import java.util.List;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.promotion.domain.Search;

public interface PromotionDao {

	List<Promotion> getPros(Search search);
	
	Promotion getPro(int proNum);
	
	List<Promotion> getBoardPros(Search search);
	
	int addpro(Promotion promotion);
	int addprod(PromotionDetail prod);
	
	int updatePro(Promotion promotion);
	int updateProd(PromotionDetail prod);
	
	int delPro(int proNum);
}
