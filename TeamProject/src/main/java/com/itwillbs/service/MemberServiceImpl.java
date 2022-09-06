package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

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
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private JavaMailSender mailSender;

	@Transactional
	@Override
	// 유저 회원가입
	public void insertMember(MemberDTO memberDTO) throws Exception {
		// 날짜설정
		memberDTO.setUserDate(new Timestamp(System.currentTimeMillis()));

        // 랜덤 문자열을 생성해서 userEmailKey 컬럼에 넣어주기
        String userEmailKey = new TempKey().getKey(49,false); // 랜덤키 길이 설정
        memberDTO.setUserEmailKey(userEmailKey);

        // 회원가입
        memberDAO.insertMember(memberDTO);
        memberDAO.updateEmailKey(memberDTO);

        // 회원가입 완료하면 인증을 위한 이메일 발송
        MailUtils sendMail = new MailUtils(mailSender);
        sendMail.setSubject("핏티드 인증코드 발송");
        sendMail.setText(
                "<h1>핏티드 메일 인증</h1>" +
                "<br/>"+memberDTO.getUserId()+"님 핏티드에 오신 것을 환영합니다!" +
                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
                "<br><a href='http://localhost:8080/web/member/joinSuccess?userEmail=" + memberDTO.getUserEmail() +
                "&userEmailKey=" + userEmailKey +
                "' target='_blank'>이메일 인증 확인</a>");
        sendMail.setFrom("web.main.adm.gmail.com", "핏티드");
        sendMail.setTo(memberDTO.getUserEmail());
        sendMail.send();
	}

	@Override
	public MemberDTO getMember(String userId) {
		return memberDAO.getMember(userId);
	}
	@Override
	public int updateEmailKey(MemberDTO memberDTO) throws Exception {
		return memberDAO.updateEmailKey(memberDTO);
	}
	@Override
	public int updateEmailAuth(MemberDTO memberDTO) throws Exception {
		return memberDAO.updateEmailAuth(memberDTO);
	}

	// 이메일 인증 확인
	@Override
	public int emailAuthFail(String userId) throws Exception {
		return memberDAO.emailAuthFail(userId);
	}

	@Override
	public MemberDTO checkUserEmail(String userEmail) {
		return memberDAO.checkUserEmail(userEmail);
	}

	// 유저 로그인
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

	// 업체 회원가입
	@Override
	public void insertComp(CompDTO compDTO) {
		// 날짜설정
		compDTO.setCompDate(new Timestamp(System.currentTimeMillis()));
		// 메서드 호출
		memberDAO.insertComp(compDTO);
	}

	// 업체 로그인
	@Override
	public CompDTO compCheck(CompDTO compDTO) {
		return memberDAO.compCheck(compDTO);
	}

	// 아이디 찾기
	@Override
	public String idSearch(MemberDTO memberDTO) {
		return memberDAO.idSearch(memberDTO);
	}

	// 비밀번호 찾기
	@Override
	public void updatePass(MemberDTO memberDTO) throws Exception {
        String userPassKey = new TempKey().getKey(6,false); // 랜덤키 길이 설정
        memberDTO.setUserPass(userPassKey);
        memberDAO.updatePass(memberDTO);

        // 임시비밀번호 발송
        MailUtils sendMail = new MailUtils(mailSender);
        sendMail.setSubject("핏티드 임시 비밀번호 발송");
        sendMail.setText(
                "<h1>핏티드 임시 비밀번호 인증</h1>" +
                "<br/>"+memberDTO.getUserId()+"님의 임시 비밀번호가 발급되었습니다!" +
                "<br>아래의 임시 비밀번호로 로그인 후 비밀번호를 변경해주세요." +
                "<br><h3>"+userPassKey+"</h3>");
        sendMail.setFrom("web.main.adm.gmail.com", "핏티드");
        sendMail.setTo(memberDTO.getUserEmail());
        sendMail.send();

		memberDAO.updatePass(memberDTO);

	}

	// 회원 정보 수정
	@Override
	public void modUser(MemberDTO memberDTO) {
		memberDAO.modUser(memberDTO);
	}

	// 회원 탈퇴
	@Override
	public void delUser(MemberDTO memberDTO) {
		memberDAO.delUser(memberDTO);
	}

	// 비밀번호 변경
	@Override
	public String passCheck(String userId) throws Exception {
		return memberDAO.passCheck(userId);
	}
	@Override
	public void passMod(String userId, String hashedPw) throws Exception {
		memberDAO.passMod(userId, hashedPw);

	}



}
