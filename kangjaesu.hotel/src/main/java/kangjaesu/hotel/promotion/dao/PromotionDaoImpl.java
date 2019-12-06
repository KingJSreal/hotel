package kangjaesu.hotel.promotion.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kangjaesu.hotel.promotion.dao.mapper.PromotionMapper;
import kangjaesu.hotel.promotion.domain.Promotion;
import kangjaesu.hotel.promotion.domain.PromotionDetail;

@Repository
public class PromotionDaoImpl implements PromotionDao{
	@Autowired private PromotionMapper mapper = null;
	
	@Override
	public int addpro(Promotion promotion) {
		return mapper.addPro(promotion);
	}

	@Override
	public int addprod(PromotionDetail prod) {
		return mapper.addProd(prod);
	}

	@Override
	public Map<Promotion, PromotionDetail> getPros() {
		return mapper.getPros();
	}

	@Override
	public List<Promotion> getBoardPros() {
		return mapper.getBoardPros();
	}

}
