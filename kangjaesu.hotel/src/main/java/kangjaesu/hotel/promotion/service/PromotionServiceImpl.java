package kangjaesu.hotel.promotion.service;

import java.util.List;

import kangjaesu.hotel.promotion.dao.PromotionDao;
import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.promotion.domain.Search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PromotionServiceImpl implements PromotionService{
	@Autowired private PromotionDao promotionDao;
	
	@Override
	@Transactional
	public boolean addPromotion(Promotion promotion, List<PromotionDetail> prods) {
		int length = 1 + prods.size();
		int a = promotionDao.addpro(promotion);
		int cnt = 0;
		
		for(PromotionDetail prod:prods){
			cnt += promotionDao.addprod(prod);
		}
		
		return (a+ cnt) > (length - 1);
	}
	
	@Override
	@Transactional
	public List<Promotion> listPros() {
		return promotionDao.getPros();
	}

	@Override
	@Transactional
	public Promotion listPro(int proNum) {
		return promotionDao.getPro(proNum);
	}

	@Override
	@Transactional
	public List<Promotion> listBoardPros(Search search) {
		return promotionDao.getBoardPros(search);
	}

	/*@Override
	@Transactional
	public int boardProsCnt(Search search) {
		return promotionDao.boardProsCnt(search);
	}*/

}
