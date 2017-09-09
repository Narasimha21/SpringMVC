package trng.imcs.spring.mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import trng.imcs.spring.mvc.model.Employee;
import trng.imcs.spring.mvc.service.EmployeeService;

@Controller
@RequestMapping("/employees")
public class EmployeesController {
	@Autowired
	EmployeeService employeeService;

	final static Logger logger = Logger.getLogger(EmployeesController.class);

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String defaultPage() {
		logger.debug("defaultPage method called");
		return "welcome";
	}

	@RequestMapping(value = "/employee", method = RequestMethod.GET)
	public String departmentPage() {
		logger.debug("defaultPage method called");
		return "employee";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView getEmployee(@RequestParam int empNo) {
		Employee emp = employeeService.getEmployee(empNo);

		ModelAndView model = new ModelAndView("employee");
		if (emp == null) {
			model.addObject("result", "No such employee..try with another id");
		} else {
			model.addObject("emp", emp);

		}
		return model;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addEmployee(@ModelAttribute Employee empl, @RequestParam String hParam) {
		Employee emp = employeeService.addEmployee(empl);
		ModelAndView model = new ModelAndView("employee");
		if (emp == null) {
			model.addObject("result", "employee cannot be added ..try again");
		} else {
			model.addObject("display", emp);

		}
		return model;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateEmployee(@ModelAttribute Employee empl, @RequestParam String hParam) {
		Employee emp = employeeService.updateEmployee(empl);
		ModelAndView model = new ModelAndView("employee");
		if (emp == null) {
			model.addObject("result", "Employee cannot be updated..try again");
		} else {
			model.addObject("display", emp);

		}
		return model;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deleteEmployee(@ModelAttribute Employee empl, @RequestParam String hParam) {
		employeeService.deleteEmployee(empl.getEmpNo());
		ModelAndView model = new ModelAndView("employee");
		model.addObject("result", "Employee sucessfully");
		return model;
	}
}
