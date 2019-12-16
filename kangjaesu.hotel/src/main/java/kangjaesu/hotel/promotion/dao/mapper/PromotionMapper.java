package kangjaesu.hotel.promotion.dao.mapper;

import java.util.List;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.promotion.domain.Search;

public interface PromotionMapper {
	
	//프로모션 게시판 - 일반
	List<Promotion> getPros();
	
	//프로모션 상세 보기 - 일반
	Promotion getPro(int proNum);
	
	//프로모션 등록 - 관리자
	int addPro(Promotion promotion);
	int addProd(PromotionDetail prod);
	
	//프로모션 게시판 - 관리자
	List<Promotion> getBoardPros(Search search);
	//int boardProsCnt(Search search);
	
	//프로모션 수정 - 관리자
	int updatePro(Promotion promotion);
	int updateProd(PromotionDetail prod);
	
	//프로모션 삭제 - 관리자
	int delPro(int pro_num);
	
}
