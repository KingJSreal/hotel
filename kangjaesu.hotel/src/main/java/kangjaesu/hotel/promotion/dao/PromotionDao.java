package kangjaesu.hotel.promotion.dao;

import java.util.List;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.promotion.domain.Search;

public interface PromotionDao {
	List<Promotion> getBoardPros(Search search);
	//int boardProsCnt(Search search);
	
	List<Promotion> getPros();
	Promotion getPro(int proNum);
	
	int addpro(Promotion promotion);
	int addprod(PromotionDetail prod);
}
