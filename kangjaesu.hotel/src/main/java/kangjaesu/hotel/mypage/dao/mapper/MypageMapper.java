package kangjaesu.hotel.mypage.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;



public interface MypageMapper {
	List<Inquiry> getInquirys(int userNum);
	Inquiry getInquiry(@Param("inqNum")int inqNum, @Param("userNum")int userNum);
	InquiryComment getComment(int inqNum);
	boolean modInquiry(Inquiry inquiry);
	Inquiry getCount(int userNum);
}
