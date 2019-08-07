<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<title>Insert title here</title>
</head>
<body>
  <div id="naverIdLogin"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	/* var naver_id_login = new naver_id_login("nivulnd70ui6sfblXXsK", "http://localhost:8090/naver/callback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8090/naver/login.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login(); */
  	var naverLogin = new naver.LoginWithNaverId({
  		clientId : "nivulnd70ui6sfblXXsK",
  		callbackUrl : "http://localhost:8090/naver/callback.jsp",
  		isPopup : false,
  		loginButton : {color : "green", type : 3, height : 60}
  	})
  	naverLogin.init();
  	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var gender = naverLogin.user.getGender();
			var email = naverLogin.user.getEmail();
			var nickname = naverLogin.user.getNickName();
			var name = naverLogin.user.getName();
			var profileImage = naverLogin.user.getProfileImage();
			var birthday = naverLogin.user.getBirthday();			
			var uniqId = naverLogin.user.getId();
			var age = naverLogin.user.getAge();
			console.log("email : ", email);
			console.log("gender :", gender)
			console.log("name : ", name);
			console.log("nickname : ", nickname);
			console.log("profileImage : ", profileImage);
			console.log("birthday : ", birthday);
			console.log("uniqId : ", uniqId);
			console.log("age : ", age);
			
		} else {
			console.log("AccessToken이 올바르지 않습니다.");
		}
	});
  </script>
</body>
</html>