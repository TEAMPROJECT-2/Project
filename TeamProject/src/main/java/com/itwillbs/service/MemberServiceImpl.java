package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	//멤버변수 (부모인터페이스변수) 객체생성 자동화 됨 => @Repository MemberDAOImpl 찾아감
	@Inject
	private MemberDAO memberDAO;

	@Override
	public void insertMember(MemberDTO memberDTO) {
		// 날짜설정
		memberDTO.setUserDate(new Timestamp(System.currentTimeMillis()));
		// 메서드 호출
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
