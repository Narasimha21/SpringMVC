<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>

	<form action="/departments" method="get">

		<div id="deptCont">
			<table>
				<tr>
					<td>Department Id:</td>
					<td><input type="text" name="deptNo" id="deptNo"></td>
					<td><input type="hidden" name="hdept" id="hdept" value="hdept"></td>
				</tr>

				<tr>
					<td><button type="submit">Search</button></td>
				</tr>
			</table>
		</div>

	</form>
	<div>
		<c:if test="${not empty requestScope.result}">${requestScope.result}</c:if>
	</div>

	<c:if test="${not empty dept}">
		<div id="viewId">
			<table>
				<tr>
					<td>Dept No:</td>
					<td>${dept.deptNo}</td>
				</tr>
				<tr>
					<td>Dept Name:</td>
					<td>${dept.deptName}</td>
				</tr>

			</table>
			<a
				href='<%=request.getContextPath()%>/departments/link?deptNo=${dept.deptNo}&hdept=hemp'>ViewEmployees</a>
		</div>
	</c:if>


	<c:if test="${not empty elist}">
		<form   id="empForm" method ="get">
			<input type="hidden" name="empNum" id="empNum">
			 <input	type="hidden" name="deptNum" id="deptNum" value="deptNum">
			<table>
				<tr>
					<th>Employee Id:</th>
					<th>Dept No:</th>
					<th>Salary:</th>
					<th>DOB:</th>
				</tr>

				<c:forEach items="${elist}" var="emp">
					<tr>
						<td>${emp.empNo}</td>
						<td>${emp.deptNo}</td>
						<td>${emp.salary}</td>
						<td>${emp.doB}</td>
						<td><button onclick="updateId(${emp.empNo})">Update
							</button></td>
						<td><button onclick="deleteId(${emp.empNo},${emp.deptNo})">Delete</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</c:if>

	<%@include file="footer.jsp"%>
	<script>function deleteId(empNo,deptNo){
		  
		document.getElementById("empNum").value=empNo;
		document.getElementById("deptNum").value=deptNo;
		document.getElementById("empForm").action ="/departments/delete";
		document.getElementById("empForm").submit();
	}

	function updateId(empNo){
		document.getElementById("empNum").value=empNo;
		document.getElementById("empForm").action ="/departments/search";
		document.getElementById("empForm").submit();
	}

	function delB(empNo){
		 
		document.getElementById("fieldId").disabled=false;
		document.getElementById("emp").value=empNo;
		document.getElementById("form2").action ="/departments";
		document.getElementById("form2").submit();
	}</script>
</body>

</html>