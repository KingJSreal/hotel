package kangjaesu.hotel.promotion.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.promotion.dao.mapper.PromotionMapper;
import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;
import kangjaesu.hotel.promotion.domain.Search;

@Repository
public class PromotionDaoImpl implements PromotionDao{
	@Autowired private PromotionMapper mapper = null;
	
	
	/*@Override
	public int boardProsCnt(Search search) {
		return mapper.boardProsCnt(search);
	}*/

	@Override
	public List<Promotion> getPros() {
		return mapper.getPros();
	}
	
	@Override
	public int addpro(Promotion promotion) {
		return mapper.addPro(promotion);
	}

	@Override
	public int addprod(PromotionDetail prod) {
		return mapper.addProd(prod);
	}

	@Override
	public Promotion getPro(int proNum) {
		return mapper.getPro(proNum);
	}

	@Override
	public List<Promotion> getBoardPros(Search search) {
		return mapper.getBoardPros(search);
	}

}
