function deleteId(empNo,deptt){
	  
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
	document.getElementById("form2").action ="/departments";
	document.getElementById("form2").submit();
}