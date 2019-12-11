package kangjaesu.hotel.common.service;

import kangjaesu.hotel.common.domain.Page;

public interface PageService {
	Page paging(int nowPage, int dataSize);
}
