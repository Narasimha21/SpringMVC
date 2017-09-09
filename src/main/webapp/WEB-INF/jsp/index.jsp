<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
		function onBtnClick(btn) {
			val = btn.value;
			alert(val);
			if  (val == 'Get-Hello') {
				document.getElementById('HelloForm').method='get';
				document.getElementById('HelloForm').submit();
			}
			
			if  (val == 'Post-Hello') {
				document.getElementById('HelloForm').method='post';
				document.getElementById('HelloForm').submit();
			}
			
			if  (val == 'Get-Greetings') {
				document.getElementById('HelloForm').method='get';
				document.getElementById('HelloForm').action = document.getElementById('HelloForm').action + "/greetings/Anas/phone/9039398334";
				document.getElementById('HelloForm').submit();
			}
			
			if  (val == 'Post-Greetings') {
				document.getElementById('HelloForm').method='post';
				document.getElementById('HelloForm').action = document.getElementById('HelloForm').action + "/greetings/Abhilas/phone/9039398334";
				document.getElementById('HelloForm').submit();
			}
			
			if  (val == 'Get-GreetMe-WithReqParam') {
				document.getElementById('HelloForm').method='get';
				document.getElementById('HelloForm').action = document.getElementById('HelloForm').action + "/greeting?name=Shariq";
				document.getElementById('HelloForm').submit();
			}
			
			if  (val == 'Get-GreetMe-WithPathParam') {
				document.getElementById('HelloForm').method='get';
				document.getElementById('HelloForm').action = document.getElementById('HelloForm').action + "/greeting/Shariq";
				document.getElementById('HelloForm').submit();
			}
		}
	</script>
</head>

<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<jsp:include page="logout.jsp"></jsp:include>
	
	<h2>Welcome</h2>

	<form id="HelloForm" action="<%=request.getContextPath()%>/hello" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table>
		<tr>
			<th> Greet operations </th>
		</tr>
		<tr><td>
		<input type="button"  value="Get-Hello" name="Get-Hello" onclick="onBtnClick(this)">
		<input type="button"  value="Post-Hello" name="Get-Hello" onclick="onBtnClick(this)">
		<input type="button"  value="Get-Greetings" name="Get-Greetings" onclick="onBtnClick(this)">
		<input type="button"  value="Post-Greetings" name="Post-Greetings" onclick="onBtnClick(this)">
		<input type="button"  value="Get-GreetMe-WithReqParam" name="Get-GreetMe-WithReqParam" onclick="onBtnClick(this)">
		<input type="button"  value="Get-GreetMe-WithPathParam" name="Get-GreetMe-WithPathParam" onclick="onBtnClick(this)">
		</td></tr>
		<br>
		<tr>
			<th> <a href="<%=request.getContextPath()%>/user/"> User Operations (Click Here) </a> </th>
		</tr>
		<tr>
			<th> <a href="<%=request.getContextPath()%>/shopping/"> Shopping Operations (Click Here) </a> </th>
		</tr>
	</table>
	</form>
</body>
</html>
