package kangjaesu.hotel.promotion.dao.mapper;

import java.util.List;
import java.util.Map;

import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;

public interface PromotionMapper {
	
	//프로모션 게시판
	Map<Promotion, PromotionDetail> getPros();
	
	//프로모션 상세 보기
	Promotion getPro(Promotion promotion, PromotionDetail prod);
	
	//프로모션 검색
	
	
	//프로모션 등록 - 관리자
	int addPro(Promotion promotion);
	int addProd(PromotionDetail prod);
	
	//프로모션 관리 - 관리자
	List<Promotion> getBoardPros();
	
	//프로모션 수정 - 관리자
	int updatePro(Promotion promotion);
	int updateProd(PromotionDetail prod);
	
	//프로모션 삭제 - 관리자
	int delPro(int pro_num);
}