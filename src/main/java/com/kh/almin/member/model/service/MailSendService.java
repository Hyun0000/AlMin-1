package com.kh.almin.member.model.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service("mss")
public class MailSendService {
	int size = 0;
	@Autowired
    private JavaMailSenderImpl mailSender;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }
    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }
        return buffer.toString();
    }
    //인증메일 보내기
    public String sendAuthMail(String email) { //parameter로 받는사람 메일(email)
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append(authKey)
            .toString());
            sendMail.setFrom("chsh9410@gmail.com", "관리자");//보내는사람 메일
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
          return authKey;
    }
    //이메일 지원메일 보내기
    public void sendApplyMail(String email) { //parameter로 받는사람 메일(email)
    	try {
    		MailUtils sendMail = new MailUtils(mailSender);
    		sendMail.setSubject("[알바의 민족] 이메일 지원 수신알림");
    		sendMail.setText(new StringBuffer().append("<h1>[이메일 지원] 1명의 지원자가 있습니다.</h1>")
    				.toString());
    		sendMail.setText(new StringBuffer().append("<a href='http://localhost:8090/almin/main'>알바의 민족 바로가기</a>")
    				.toString());
    				
    		sendMail.setFrom("chsh9410@gmail.com", "관리자");//보내는사람 메일
    		sendMail.setTo(email);
    		sendMail.send();
    	} catch (MessagingException e) {
    		e.printStackTrace();
    	} catch (UnsupportedEncodingException e) {
    		e.printStackTrace();
    	}
    }
}