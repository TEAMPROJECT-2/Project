package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.memberMapper";

	// 유저 회원가입 동작
	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception{
		sqlSession.insert(namespace + ".insertMember", memberDTO);
	}

	// 유저 로그인 동작
	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}

	// 유저 아이디 중복체크 동작
	@Override
	public MemberDTO getMember(String userId) {
		return sqlSession.selectOne(namespace+".getMember", userId);
	}

	// 업체 회원가입 동작
	@Override
	public void insertComp(CompDTO compDTO) {
		sqlSession.insert(namespace + ".insertComp", compDTO);

	}

	// 업체 로그인 동작
	@Override
	public CompDTO compCheck(CompDTO compDTO) {
		return sqlSession.selectOne(namespace+".compCheck", compDTO);
	}

	// 이메일 인증키 동작
	@Override
	public MemberDTO loginCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace+".loginCheck", memberDTO);
	}

	// 이메일 인증키 동작
	@Override
	public int updateEmailKey(MemberDTO memberDTO) throws Exception {
		System.out.println("MemberDAOImpl() updateEmailKey");
		return sqlSession.update(namespace + ".updateEmailKey", memberDTO);
	}

	// 이메일 인증 컬럼 업데이트 동작
	@Override
	public int updateEmailAuth(MemberDTO memberDTO) throws Exception {
		System.out.println("MemberDAOImpl() updateEmailAuth");
		return sqlSession.update(namespace + ".updateEmailAuth", memberDTO);
	}

	// 이메일 인증 확인 동작
	@Override
	public int emailAuthFail(String userId) throws Exception {
		System.out.println("MemberDAOImpl() emailAuthFail");
		 return sqlSession.selectOne(namespace + ".emailAuthFail", userId);
	}

	// 아이디 찾기 동작
	@Override
	public String idSearch(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".idSearch", memberDTO);
	}
	@Override
	public MemberDTO checkUserEmail(String userEmail) {
		return sqlSession.selectOne(namespace + ".checkUserEmail", userEmail);
	}
	// 비밀번호 찾기 동작
	@Override
	public void updatePass(MemberDTO memberDTO) {
		sqlSession.update(namespace + ".updatePass", memberDTO);
	}

	// 회원 정보 수정 동작
	@Override
	public void modUser(MemberDTO memberDTO) {
		sqlSession.update(namespace + ".modUser", memberDTO);
	}

	// 회원 탈퇴 동작
	@Override
	public void delUser(MemberDTO memberDTO) {
		sqlSession.delete(namespace + ".delUser", memberDTO);
	}

	// 비밀번호 변경 동작
	@Override
	public void passMod(MemberDTO memberDTO) throws Exception {
		sqlSession.update(namespace + ".passMod", memberDTO);

	}








}
