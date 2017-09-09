package trng.imcs.spring.mvc.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import trng.imcs.spring.mvc.model.Department;
import trng.imcs.spring.mvc.model.Employee;



public interface IEmployeeService {
	
	public Department getDept(int deptNo);
	//public List<User> getUserList();
	public List<Employee>  getEmployeeByDeptNo(int deptNo);
	public void deleteEmployee(int empNo);
	public Employee updateEmployee(Employee employee);
	public Employee getEmployee(int empNo);
	public Employee addEmployee(Employee employee);
}
