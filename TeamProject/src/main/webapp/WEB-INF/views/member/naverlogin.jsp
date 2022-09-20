<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>네아로API</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<script type="text/javascript">
    var naver_id_login = new naver_id_login("J1pjWpChS9vxGVOirvL0", "http://localhost:8080/web/auth/naver");
	 // 접근 토큰 값 출력
	 // 네이버 사용자 프로필 조회
	 naver_id_login.get_naver_userprofile("naverSignInCallback()");

	 // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
 function naverSignInCallback() {
 	var userId = naver_id_login.getProfileData('email');
 	var userNm = naver_id_login.getProfileData('name');
 	location.href='naverlogin?userId='+userId+'&userNm='+userNm+'&user_type=1'
}
</script>
<body>
</body>
</html>
