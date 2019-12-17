package kangjaesu.hotel.intro.service;

import kangjaesu.hotel.intro.dao.IntroDao;
import kangjaesu.hotel.intro.domain.Intro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IntroServiceImpl implements IntroService{
	@Autowired private IntroDao introDao = null;

	@Override
	public Intro getIntroImg() {
		return introDao.getIntroImg();
	}

	@Override
	public boolean addIntroImg(Intro intro) {
		return introDao.addIntroImg(intro)>0;
	}
}
