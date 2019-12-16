package kangjaesu.hotel.promotion.service;

import java.util.List;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.promotion.domain.Search;

public interface PromotionService {
	//프로모션 게시판 - 관리자
	List<Promotion> listBoardPros(Search search);
	//프로모션 카운트
	//int boardProsCnt(Search search);
	//프로모션 게시판 - 일반
	List<Promotion> listPros();
	//프로모션 상세보기 - 일반
	Promotion listPro(int proNum);
	//프로모션 등록 - 관리자
	boolean addPromotion(Promotion promotion, List<PromotionDetail> prods);

}
