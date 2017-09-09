package trng.imcs.spring.mvc.service;

import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import trng.imcs.spring.mvc.model.Department;
import trng.imcs.spring.mvc.model.Employee;

@Service("restClient")
public class EmployeeService implements IEmployeeService {

	RestTemplate restTemplate = new RestTemplate();
	String empUri = "http://localhost:8099/springapp/employee";
	String deptUri = "http://localhost:8099/springapp/department";

	@Override
	public Department getDept(int deptNo) {
		// TODO Auto-generated method stub
		String url = deptUri + "/" + deptNo;
		Department department = restTemplate.getForObject(url, Department.class);
		return department;
	}

	@Override
	public List<Employee> getEmployeeByDeptNo(int deptNo) {
		String url = deptUri + "/employees/" + deptNo;
		List<Employee> list = restTemplate.getForObject(url, List.class);
		return list;
	}

	@Override
	public void deleteEmployee(int empNo) {
		String url = empUri + "/" + empNo;
		restTemplate.delete(url);

	}

	@Override
	public Employee updateEmployee(Employee employee) {
		String url = empUri + "/";
		restTemplate.put(url, employee);
		return employee;

	}

	@Override
	public Employee addEmployee(Employee employee) {
		String url = empUri + "/";

		Employee emp = restTemplate.postForObject(url, employee, Employee.class);

		return emp;
	}

	@Override
	public Employee getEmployee(int empNo) {
		String url = empUri + "/" + empNo;
		Employee employee = restTemplate.getForObject(url, Employee.class);
		return employee;
	}
}
