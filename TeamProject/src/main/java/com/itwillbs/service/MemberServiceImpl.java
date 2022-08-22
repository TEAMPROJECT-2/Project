package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

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
