<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet"
	href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/signup.css">
<link rel="stylesheet" href="/resources/css/less.css">
<script src="/resources/js/signup.js" type="text/javascript"
	charset="utf-8"></script>
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>
	<div>
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>
	<div class="form_table">
		<span>회원가입</span>
		<form action=${url } name="signupform" method="POST"
			enctype="multipart/form-data" onsubmit="return execute();">
			<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
			<table>
				<tr>
					<td style="padding-top:20px; width: 100%;" colspan="4"> 						<img id="blah" src="/resources/imgs/blank_img/company_blank.jpg" alr="your image"/>
						<input type="file" name="logoimage" onchange="readURL(this);" value="로고 업로드"/  accept="image/gif, image/jpeg, image/png" id="logoimg"><br>
						<span id="img_sp">사진은 500x500px,10mb미만으로 올려주시길 바랍니다.</span>
					</td>					
				</tr>
				<tr>
					<td style="height: 40px; width:25%;">아이디</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td><input type="text" name="id" id="id" required class="inp_txt" placeholder="필수항목" style="width: 100%;"></td>					
					<td><button type="button" onclick="checkid();" id="check_btn">중복검사</button></td>
				</tr>
				<tr>
					<td style="height: 40px;">비밀번호</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="password" name="password" id="password" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>										
					
				</tr>
				<tr>
					<td style="height: 40px;">비밀번호 확인</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="password" name="repassword" id="repassword" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">회사명</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="company_name" id="company_name" required placeholder="필수항목" class="inp_txt" onkeyup="checkpwd();" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">회사유형</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<select id="companyselect" onChange=changeCompany(this.value) style="width: 100%; height: 30px;">
							<option value="" selected>유형선택 (필수항목)</option>
							<option value="대행사">대행사</option>
							<option value="유통사">유통사</option>
							<option value="제조사">제조사</option>
						</select> 
						<input type="hidden" name="typeofcompany" id="typeofcompany">
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">주소</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td><input type="text" name="addr1" id="sample4_postcode" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>
					<td><button type="button" onclick="sample4_execDaumPostcode();" id="s_btn" value="우편번호 찾기">우편번호검색</button></td>					
				</tr>
				<tr>
					<td colspan="2"></td>
					<td colspan="2">
						<input type="text" name="addr1" id="addr2" required placeholder="도로명주소" class="inp_txt" style="width: 100%;">
					</td>
				</tr>
				<tr>
					<td style="height: 40px;">사업자등록증</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="file" name="registration_scan" id="registration_scan" class="inp_txt" style="width:100%;">
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">사업자 번호</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="text" name="registration_number" id="registration_number" required class="slice_txt" > -
						<input type="text" name="registration_number" id="registration_number" required class="slice_txt" > -
						<input type="text" name="registration_number" id="registration_number" required class="slice_txt" >
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">E-MAIL</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td>
						<input type="text" name="email1" id="email1" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>
					<td>						
						<select name="email2" onChange=changeEmail(this.value) required id="em_sel">
							<option value="" selected>이메일선택</option>
							<option value="naver.com">@ naver.com</option>
							<option value="hanmail.com">@ hanmail.com</option>
							<option value="daum.net">@ daum.net</option>
							<option value="nate.com">@ nate.com</option>
							<option value="gmail.com">@ gmail.com</option>
							<option value="hotmail.com">@ hotmail.com</option>
							<option value="dreamwiz.com">@ dreamwiz.com</option>
							<option value="korea.com">@ korea.com</option>
							<option value="1">직접입력</option>
						</select> 	
					</td>										
				</tr>
				<tr>
					<td style="height: 40px;">담당자이름</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="manager_name" id="manager_name" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">핸드폰</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="text" name="" id="" required class="slice_txt" placeholder="필수항목" > -
						<input type="text" name="" id="" required class="slice_txt" placeholder="필수항목"> -
						<input type="text" name="" id="" required class="slice_txt" placeholder="필수항목">
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">취급 상품 분야</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="checkbox" name="interestproduct" value="패션">패션
						<input type="checkbox" name="interestproduct" value="패션">소품
			 			<input	type="checkbox" name="interestproduct" value="뷰티">뷰티 
			 			<input	type="checkbox" name="interestproduct" value="생활">생활 
			 			<input	type="checkbox" name="interestproduct" value="APP">APP 
			 			<input	type="checkbox" name="interestproduct" value="IDEA">IDEA
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">통장 사본</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="file" name="registration_scan" id="registration_scan" class="inp_txt" style="width:100%;">
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">은행</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="" id="" class="inp_txt"  style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">계좌번호</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="" id="" class="inp_txt" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">회사소개</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="" id="" class="inp_txt" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td colspan="4"><button id = "ok_btn">가입신청</button></td>
				</tr>
				
			</table>
		</form>	
	</div>
	<div style="float: left; width: 100%; margin-top: 50px;">
		<c:import url="../headerAndFooter/footer.jsp"></c:import>
	</div>
</body>
</html>