<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<%@include file="header.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<form id="form1" action="/employees/search" method="get">
		<table>
			<tr>
				<td>Employee No:</td>
				<td><input type="text" name="empNo" id="empNo"></td>
				<td colspan="2"><button type="submit">Search</button></td>

			</tr>
		</table>
	</form>
	<div>
		<button id="addB">ADD</button>
	</div>

	<div id="resultId">
		<c:if test="${not empty requestScope.result}">${requestScope.result}</c:if>
	</div>
	<c:if test="${not empty requestScope.error}">${requestScope.error}</c:if>

	<form id="formadd" method="post" action="/employees"
		style="display: none">
		<input type="hidden" name="hParam" value="addEmp">
		<table>
			<tr>
				<td>DeptNo:</td>
				<td><input class="form-group" type="text" id="deptNo"
					name="deptNo" value=""></td>
			</tr>
			<tr>
				<td>Salary:</td>
				<td><input class="form-group " type="text" id="salary"
					name="salary" value=""></td>
			</tr>
			<tr>
				<td>Date of Joining :</td>
				<td><input class="form-group " type="date" id="doJ" name=doJ
					value=""></td>
			</tr>
			<tr>
				<td>Date of Birth:</td>
				<td><input class="form-group " type="date" id="doB" name="doB"
					value=""></td>
			</tr>
			<tr>
				<td>Salary grade:</td>
				<td><input class="form-group " type="text" id="salaryGrade"
					name="salaryGrade" value=""></td>
			</tr>

			<tr>
				<td colspan="2"><button id="saB" type="submit">SAVE</button></td>
			</tr>

		</table>
	</form>
	<c:if test="${not empty emp}">
		<form:form modelAttribute="empl" id="form2" action="/employees/update"
			method="post">

			<div id="updateId">

				<input type="hidden" id="hParam" name="hParam" value="uEmp">
				<input type="hidden" id="hdept" name="hdept" value="deleteE">
				<fieldset id="fieldId" name="field" disabled="disabled">
					<table>
						<tr>
							<td>Employee Id:</td>
							<td><input type="text" name="empNo" id="emp"
								value="${requestScope.emp.empNo}"></td>
						</tr>
						<tr>
							<td>department Id:</td>
							<td><input type="text" name="deptNo" id="dept"
								value="${requestScope.emp.deptNo}"></td>
						</tr>
						<tr>
							<td>Salary:</td>
							<td><input type="text" name="salary" id="salary"
								value="${requestScope.emp.salary}"></td>
						</tr>
						<tr>
							<td>DOJ:</td>
							<td><input name="doJ" id="doJ"
								value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${requestScope.emp.doJ}'/>" /></td>
						</tr>
						<tr>
							<td>DOB:</td>
							<td><input name="doB" id="dob"
								value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${requestScope.emp.doB}'/>" /></td>
						</tr>
						<tr>
							<td>Grade:</td>
							<td><input type="text" name="salaryGrade" id="grade"
								value="${requestScope.emp.salaryGrade}"></td>
						</tr>
					</table>
				</fieldset>
			</div>
		</form:form>
		<div>
			<button id="updateB">UPDATE</button>
			<button id="deleteB" onclick="delB(${requestScope.emp.empNo})">DELETE</button>
			<button id="saveB" style='display: none'>SAVE</button>
		</div>
	</c:if>

	<c:if test="${not empty display}">
		<form id=dform>
			<table>
				<tr>
					<td>Employee Id:</td>
					<td>${requestScope.display.empNo}</td>
				</tr>
				<tr>
					<td>department Id:</td>
					<td>${requestScope.display.deptNo}</td>
				</tr>
				<tr>
					<td>Salary:</td>
					<td>${requestScope.display.salary}</td>
				</tr>
				<tr>
					<td>DOJ:</td>
					<td>"${requestScope.display.doJ}</td>
				</tr>
				<tr>
					<td>DOB:</td>
					<td>${requestScope.display.doB}</td>
				</tr>
				<tr>
					<td>Grade:</td>
					<td>${requestScope.display.salaryGrade}</td>
				</tr>
			</table>
		</form>
	</c:if>

	<c:if test="${not empty updateFlag}">
		<form:form modelAttribute="empl"  id = "form3" action="/departments/update" method="post">
			<div id="updateId">
						 <input type="hidden"
					name="deptOld" value="${requestScope.employ.deptNo}">
				<table>
					<tr>
						<td>Employee Id:</td>
						<td><input type="text" name="empNo" id="emp"
							value="${requestScope.employ.empNo}"></td>
					</tr>
					<tr>
						<td>department Id:</td>
						<td><input type="text" name="deptNo" id="dept"
							value="${requestScope.employ.deptNo}"></td>
					</tr>
					<tr>
						<td>Salary:</td>
						<td><input type="text" name="salary" id="salary"
							value="${requestScope.employ.salary}"></td>
					</tr>
					<tr>
						<td>DOJ:</td>
						<td><input name="doJ" id="doJ"
							value= "<fmt:formatDate pattern = 'yyyy-MM-dd' value='${requestScope.employ.doJ}'/>" /></td>
					</tr>
					<tr>
						<td>DOB:</td>
						<td><input name="doB" id="doB"
							value= "<fmt:formatDate pattern = 'yyyy-MM-dd' value='${requestScope.employ.doB}'/>" /></td>
					</tr>
					<tr>
						<td>Grade:</td>
						<td><input type="text" name="grade" id="grade"
							value="${requestScope.employ.salaryGrade}"></td>
					</tr>
				</table>
				<button type=submit>UPDATE</button>
			</div>
		</form:form>
	</c:if>

	<form id="empS" action="/EmpDeptApp/employee" method="post"
		style="display: none">

		<table>
			<tr>
				<td>Employee Id:</td>
				<td><input type="text" name="emp" id="emp"></td>
				<td><input type="hidden" name="hParam" id="hParam"
					value="deptU"></td>
			</tr>

			<tr>
				<td colspan="2"><button type="submit">Submit</button></td>
			</tr>
		</table>
	</form>

	<form id="empF" action="/EmpDeptApp/employee" method="post"
		style="display: none">

		<table>
			<tr>
				<td>Employee Id:</td>
				<td><input type="text" name="emp" id="emp"></td>
			</tr>

			<tr>
				<td colspan="2"><button type="submit">Submit</button></td>
			</tr>
		</table>
	</form>

	<%@include file="footer.jsp"%>
	<script>function deleteId(empNo,deptt){
		  
		document.getElementById("emp").value=empNo;
		document.getElementById("deptt").value=deptt;
		document.getElementById("empForm").action ="/departments";
		document.getElementById("empForm").submit();
	}

	function updateId(empNo){
		document.getElementById("emp").value=empNo;
		document.getElementById("update").value="update";
		document.getElementById("empForm").action ="/employees";
		document.getElementById("empForm").submit();
	}

	function delB(empNo){
		 
		document.getElementById("fieldId").disabled=false;
		document.getElementById("emp").value=empNo;
		document.getElementById("form2").action ="/employees/delete";
		document.getElementById("form2").submit();
	}</script>
	<script>
	
	$(document).ready(function() {
		$("#addB").click(function() {

			$("#formadd").show();
			$("#dform").hide();
			$("#resultId").hide();
			$("#Uemp").hide();
			$("#empF").hide();

		});

		$("#updateB").click(function() {
			$("#fieldId").removeAttr("disabled");
			$("#saveB").show();
			
		});

		
		$("#saveB").click(function() {
			
			$("#form2").submit();
			
		});
		
		/*$("#deleteB").click(function() {
			
			$("#fieldId").removeAttr("disabled");
			document.getElementById("fieldId").disabled=false;
			$("#Demp").show();
			$("#empF").hide();
			$("#formadd").hide();
			$("#addB").hide();
			$("#searchId").hide();
			$("#searchB").hide();
			$("#updateB").hide();
			$("#resultId").hide();
			$("#deleteB").hide();
			
		});*/
		$("#searchB").click(function() {
			$("#formadd").hide();
			$("#addB").hide();
			$("#deleteB").show();
			$("#updateB").show();
			$("#empS").show();
			$("#searchId").hide();
			$("#searchB").hide();
			$("#resultId").hide();
			$("#empF").hide();
			
		});

	});
	
	</script>
</body>
</html>