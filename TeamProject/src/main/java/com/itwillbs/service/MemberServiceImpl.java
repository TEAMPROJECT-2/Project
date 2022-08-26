package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.mail.MailUtils;
import com.itwillbs.mail.TempKey;

@Service
public class MemberServiceImpl implements MemberService{

	//멤버변수 (부모인터페이스변수) 객체생성 자동화 됨 => @Repository MemberDAOImpl 찾아감
	@Inject
	private MemberDAO memberDAO;
	@Autowired
	private JavaMailSender mailSender;

	@Transactional
	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception {
		// 날짜설정
		memberDTO.setUserDate(new Timestamp(System.currentTimeMillis()));

        // 랜덤 문자열을 생성해서 userEmailKey 컬럼에 넣어주기
        String mailKey = new TempKey().getKey(50,false); // 랜덤키 길이 설정
        memberDTO.setUserEmailKey(mailKey);

        // 회원가입
        memberDAO.insertMember(memberDTO);
        memberDAO.updateEmailKey(memberDTO);

        // 회원가입 완료하면 인증을 위한 이메일 발송
        MailUtils sendMail = new MailUtils(mailSender);
        sendMail.setSubject("운동운동 인증메일 입니다.");
        sendMail.setText(
                "<h1>운동운동 메일인증</h1>" +
                "<br>운동운동에 오신것을 환영합니다!" +
                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
                "<br><a href='http://localhost:8080/join/registerEmail?email=" + memberDTO.getUserEmail() +
                "&mailKey=" + mailKey +
                "' target='_blank'>이메일 인증 확인</a>");
        sendMail.setFrom("silhumlab.gmail.com", "운동운동");
        sendMail.setTo(memberDTO.getUserEmail());
        sendMail.send();
        System.out.println(memberDTO.getUserEmail());
        System.out.println(memberDTO.getUserId());


	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return memberDAO.userCheck(memberDTO);
	}

	@Override
	public MemberDTO loginCheck(MemberDTO memberDTO) {
		// 마지막 날짜 업데이트
		memberDTO.setUserLastDate(new Timestamp(System.currentTimeMillis()));
		return memberDAO.loginCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String userId) {
		return memberDAO.getMember(userId);
	}

	@Override
	public void insertComp(CompDTO compDTO) {
		// 날짜설정
		compDTO.setCompDate(new Timestamp(System.currentTimeMillis()));
		System.out.println(compDTO.getCompDate());
		System.out.println("MemberServiceImpl insertMember()");
		// 메서드 호출
		memberDAO.insertComp(compDTO);

	}

	@Override
	public CompDTO compCheck(CompDTO compDTO) {
		return memberDAO.compCheck(compDTO);
	}

	@Override
	public int updateEmailKey(MemberDTO memberDTO) throws Exception {
		System.out.println("MemberServiceImpl updateEmailKey()");
		return memberDAO.updateEmailKey(memberDTO);
	}

	@Override
	public int updateEmailAuth(MemberDTO memberDTO) throws Exception {
		System.out.println("MemberServiceImpl updateEmailAuth()");
		return memberDAO.updateEmailAuth(memberDTO);
	}

	@Override
	public int emailAuthFail(String userId) throws Exception {
		System.out.println("MemberServiceImpl emailAuthFail()");
		return memberDAO.emailAuthFail(userId);
	}



}
