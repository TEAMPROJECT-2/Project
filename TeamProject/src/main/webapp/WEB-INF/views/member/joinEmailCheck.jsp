<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<script type="text/javascript">


		alert('${memberDTO.getUserId()}님 회원가입 해주셔서 감사합니다. ${memberDTO.getUserEmail()} 으로 메일을 보냈습니다. 메일 확인 후 인증버튼을 눌러주세요!');

		location.href = "login";
	</script>

</body>
</html>