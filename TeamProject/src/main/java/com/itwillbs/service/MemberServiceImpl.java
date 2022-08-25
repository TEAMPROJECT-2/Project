package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	//멤버변수 (부모인터페이스변수) 객체생성 자동화 됨 => @Repository MemberDAOImpl 찾아감
	@Inject
	private MemberDAO memberDAO;
    @Autowired
    JavaMailSender mailSender;

	@Override
	public void insertMember(MemberDTO memberDTO) {
		// 날짜설정
		memberDTO.setUserDate(new Timestamp(System.currentTimeMillis()));
        //랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
//        String mailKey = new TempKey().getKey(30,false); //랜덤키 길이 설정
//        memberDTO.setuser(mailKey);
		// 회원가입
		memberDAO.insertMember(memberDTO);
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
	public int updateMailKey(MemberDTO memberDTO) throws Exception {
		return memberDAO.updateMailKey(memberDTO);
	}

	@Override
	public int updateMailAuth(MemberDTO memberDTO) throws Exception {
		return memberDAO.updateMailAuth(memberDTO);
	}

	@Override
	public int emailAuthFail(String userId) throws Exception {
		return memberDAO.emailAuthFail(userId);
	}





}
