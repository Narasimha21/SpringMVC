package trng.imcs.spring.mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import trng.imcs.spring.mvc.model.Department;
import trng.imcs.spring.mvc.model.Employee;
import trng.imcs.spring.mvc.service.EmployeeService;

@Controller
@RequestMapping("/departments")
public class DepartmentsController {
	@Autowired
	EmployeeService employeeService;
	final static Logger logger = Logger.getLogger(DepartmentsController.class);

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@RequestMapping(value = "/deptView", method = RequestMethod.GET)
	public String departmentPage() {
		logger.debug("defaultPage method called");
		return "deptView";
	}

	@ModelAttribute
	public Department addDepartment(ModelMap model) {
		logger.debug("@ModelAttribute Department method called");

		return new Department();
	}

	@RequestMapping(value = "/link", method = RequestMethod.GET)
	public ModelAndView getEmployee(@RequestParam int deptNo, @RequestParam String hdept) {

		List<Employee> elist = employeeService.getEmployeeByDeptNo(deptNo);
		ModelAndView model = new ModelAndView("deptView");
		if (elist == null) {
			model.addObject("result", "No employees exists try with another Dept No");
		} else {
			model.addObject("elist", elist);
		}
		return model;
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView getDept(@ModelAttribute Department department, @RequestParam int deptNo,
			@RequestParam String hdept) {
		Department dept = employeeService.getDept(deptNo);
		ModelAndView model = new ModelAndView("deptView");
		if (dept == null) {
			model.addObject("result", "No such Department try with another Dept id");
		} else {
			model.addObject("dept", dept);

		}
		return model;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@RequestParam int empNum, @RequestParam int deptNum) {
		employeeService.deleteEmployee(empNum);

		List<Employee> elist = employeeService.getEmployeeByDeptNo(deptNum);
		Department dept = employeeService.getDept(deptNum);
		ModelAndView model = new ModelAndView("deptView");
		if (elist == null) {
			model.addObject("result", "message");
		} else {
			model.addObject("dept", dept);
			model.addObject("elist", elist);
		}
		return model;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateEmployee(@ModelAttribute Employee empl, @RequestParam int deptOld) {
		employeeService.updateEmployee(empl);
		List<Employee> elist = employeeService.getEmployeeByDeptNo(deptOld);
		Department dept = employeeService.getDept(deptOld);
		ModelAndView model = new ModelAndView("deptView");
		if (elist == null) {
			model.addObject("result", "No employees exists try with another Dept No");
		} else {
			model.addObject("elist", elist);
			model.addObject("dept", dept);
		}
		return model;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView searchEmployee(@RequestParam int empNum, @RequestParam String deptNum) {
		Employee employ = employeeService.getEmployee(empNum);
		ModelAndView model = new ModelAndView("employee");
		model.addObject("updateFlag", "deptPage");
		model.addObject("employ", employ);
		return model;
	}

}
