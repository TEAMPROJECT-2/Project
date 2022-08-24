package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
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
		System.out.println(memberDTO.getUserDate());
		System.out.println("MemberServiceImpl insertMember()");
		// 메서드 호출
		memberDAO.insertMember(memberDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl userCheck()");
		System.out.println(memberDTO.getUserId());
		System.out.println("memberDAO.userCheck(memberDTO) : "+memberDAO.userCheck(memberDTO));
		return memberDAO.userCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String userId) {
		System.out.println("MemberServiceImpl getMember()");
		return memberDAO.getMember(userId);
	}



}
