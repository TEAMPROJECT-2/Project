package com.itwillbs.dao;

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


	@Override
	public void insertMember(MemberDTO memberDTO) {
		// 마이바티스 메서드 호출
		sqlSession.insert(namespace + ".insertMember", memberDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		// 하나만 선택할 떄는 selectOne
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}

	@Override
	public MemberDTO getMember(String userId) {
		return sqlSession.selectOne(namespace+".getMember", userId);
	}

	@Override
	public void insertComp(CompDTO compDTO) {
		sqlSession.insert(namespace + ".insertComp", compDTO);

	}

	@Override
	public CompDTO compCheck(CompDTO compDTO) {
		return sqlSession.selectOne(namespace+".compCheck", compDTO);
	}

	@Override
	public MemberDTO loginCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace+".loginCheck", memberDTO);
	}

	@Override
	public int updateEmailKey(MemberDTO memberDTO) throws Exception {
		System.out.println("MemberDAOImpl() updateEmailKey");
		return sqlSession.update(namespace + "updateEmailKey", memberDTO);
	}

	@Override
	public int updateEmailAuth(MemberDTO memberDTO) throws Exception {
		System.out.println("MemberDAOImpl() updateEmailAuth");
		return sqlSession.update(namespace + "updateEmailAuth", memberDTO);
	}

	@Override
	public int emailAuthFail(String userId) throws Exception {
		System.out.println("MemberDAOImpl() emailAuthFail");
		 return sqlSession.selectOne(namespace + "emailAuthFail", userId);
	}



}
