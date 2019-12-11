package kangjaesu.hotel.inquiry.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import kangjaesu.hotel.inquiry.domain.Inquiry;
import kangjaesu.hotel.inquiry.domain.InquiryComment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public void send(InquiryComment msg, Inquiry to) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			//to.setInqEmail("lim_317@naver.com");
			message.addRecipient(RecipientType.TO, new InternetAddress("lim_317@naver.com"));
			String name = to.getInqWriter();
			//message.addRecipient(RecipientType.TO, new InternetAddress(to.getInqEmail()));
			message.setSubject("[서울호텔]"+ name +"님이 작성하신 문의에 대한 답변입니다.");
			message.setText(msg.getInqCmtContent(), "utf-8", "html");
			System.out.println("\n********************\n" +
					msg.getInqCmtContent() + "\n********************\n");
		} catch (Exception e) {
			mailSender.send(message);
		}
	}
}
