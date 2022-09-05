package com.itwillbs.service;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;

public interface MemberService {
	// 유저 회원가입
	public void insertMember(MemberDTO memberDTO) throws Exception;

	// 유저 로그인
	public MemberDTO userCheck(MemberDTO memberDTO);
	public MemberDTO getMember(String userId);
	public MemberDTO loginCheck(MemberDTO memberDTO);
	int updateEmailKey(MemberDTO memberDTO) throws Exception;
	int updateEmailAuth(MemberDTO memberDTO) throws Exception;
	int emailAuthFail(String userId) throws Exception;

	// 이메일 중복 검사
	public MemberDTO checkUserEmail(String userEmail);

	// 업체 회원가입
	public void insertComp(CompDTO compDTO);

	// 업체 로그인
	public CompDTO compCheck(CompDTO compDTO);

	// 아이디 찾기
	public String idSearch(MemberDTO memberDTO);

	// 비밀번호 찾기
	public void updatePass(MemberDTO memberDTO) throws Exception;

	// 회원 정보 수정
	public void modUser(MemberDTO memberDTO);

	// 회원 탈퇴
	public void delUser(MemberDTO memberDTO);


}
