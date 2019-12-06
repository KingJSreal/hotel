package kangjaesu.hotel.promotion.service;

import java.util.List;
import java.util.Map;

import kangjaesu.hotel.promotion.dao.PromotionDao;
import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PromotionServiceImpl implements PromotionService{
	@Autowired private PromotionDao promotionDao;
	
	//관리자 프로모션 등록
	@Override
	@Transactional
	public boolean addPromotion(Promotion promotion, PromotionDetail prod) {
		return (promotionDao.addpro(promotion) > 0 && promotionDao.addprod(prod) > 0);
	}

	@Override
	@Transactional
	public Map<Promotion, PromotionDetail> listPros() {
		return promotionDao.getPros();
	}

	@Override
	public List<Promotion> listBoardPros() {
		return promotionDao.getBoardPros();
	}
}
