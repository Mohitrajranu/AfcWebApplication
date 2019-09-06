package com.mum.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.mum.domain.Department;
import com.mum.domain.Employee;
import com.mum.domain.Post;
import com.mum.domain.UserRole;
import com.mum.domain.Vacancy;
import com.mum.services.DepartmentService;
import com.mum.services.EmployeeService;
import com.mum.services.PostService;
import com.mum.services.UserRoleService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired 
	EmployeeService employeeService;
	@Autowired 
	PostService postService;
	@Autowired 
	DepartmentService departmentService;
	@Autowired 
	UserRoleService userRoleService;
	@RequestMapping({"", "/list"})
	public String showemployeeList(Model model) {
		System.out.println("inside employee controllers");
		List<Employee> employeeList=employeeService.getAll();
		System.out.println("joined date gates="+employeeList.get(0).getJoinedDate());
		model.addAttribute("employeeList",employeeList);
		return "employeeList";
	}

	@RequestMapping(value="/showProfile/{employeeId}" ,method = RequestMethod.GET)
	public String showEmployeeProfile(@PathVariable long employeeId, Model model) {
		System.out.println("inside employee controllerchange show  employee profile");
		Employee employee= employeeService.getOneByPRimaryId(employeeId);
		model.addAttribute("employee", employee);
		return "employeeProfile";
	}
	
	@RequestMapping(value="/editEmployee/{employeeId}" ,method = RequestMethod.GET)
	public String editEmployeeForm(@PathVariable long employeeId, Model model) {
		System.out.println("inside employee controllerchange show  employee edit  profile");
		Employee employee= employeeService.getOneByPRimaryId(employeeId);
		//System.out.println("Here");
		//Employee superVisedBy= employeeService.getOneByPRimaryId(employee.getSupervisedBy().getEmployeeId());
		//employee.setSupervisedBy(superVisedBy);
		model.addAttribute("newEmployee", employee);
		List<Post> posts=postService.getAll();
		List<Department> departments=departmentService.getAll();
		List<UserRole> userRoles=userRoleService.getAll();
		model.addAttribute("departments", departments);
		model.addAttribute("posts", posts);
		model.addAttribute("userRoles", userRoles);
		return "addNewEmployee";//same form works
	}
	@RequestMapping(value="/deleteEmployee/{employeeId}" ,method = RequestMethod.GET)
	public String deleteEmployeeForm(@PathVariable long employeeId, Model model) {
		System.out.println("inside employee controllerchange show  employee delete  profile");
		Employee employee= employeeService.getOneByPRimaryId(employeeId);
		System.out.println("departmentid="+employee.getDepartment().getDepartmentId());
		System.out.println("addressid="+employee.getAddress().getAddressId());
		employeeService.delete(employee);
		model.addAttribute("newemployee", employee);
		return "redirect:/employee/list";
	}
	
	@RequestMapping(value="/addNewEmployee" ,method = RequestMethod.GET)
	public String addNewEmployee(@ModelAttribute("newEmployee") Employee newEmployee,Model model) {
		System.out.println("inside employee controllerchange add new employee  ");
		List<Post> posts=postService.getAll();
		List<Department> departments=departmentService.getAll();
		List<UserRole> userRoles=userRoleService.getAll();
		model.addAttribute("departments", departments);
		model.addAttribute("posts", posts);
		model.addAttribute("userRoles", userRoles);
		return "addNewEmployee";
	}
	
	
	@RequestMapping(value="/addewEmployee" ,method = RequestMethod.POST)
	public String saveNewEmployee(@Valid @ModelAttribute("newEmployee") Employee employee,BindingResult bindingResult,
			RedirectAttributes redirectAttribute,Model model) {
		System.out.println("inside employee controller save add new employee change");
		if(bindingResult.hasErrors()){
			System.out.println("inside binding result");
			System.out.println("bindingResult.getErrorCount()="+bindingResult.getErrorCount());
			  List<FieldError> errors = bindingResult.getFieldErrors();
			    for (FieldError error : errors ) {
			        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
			    }
			    System.out.println("inside binding result out");
			    List<Post> posts=postService.getAll();
				List<Department> departments=departmentService.getAll();
				List<UserRole> userRoles=userRoleService.getAll();
				model.addAttribute("departments", departments);
				model.addAttribute("posts", posts);
				model.addAttribute("userRoles", userRoles);
			return "addNewEmployee";
		}
		Post post= new Post();
		Long postId=employee.getPost().getPostId();
		post=postService.getOneByPRimaryId(postId);
		employee.setPost(post);
		
		Department depart= new Department();
		Long departId=employee.getDepartment().getDepartmentId();
		depart=departmentService.getOneByPRimaryId(departId);
		employee.setDepartment(depart);
		
		UserRole userRole= new UserRole();
		Long roleId=employee.getUser().getUserRole().getRoleId();
		userRole=userRoleService.getOneByPRimaryId(roleId);
		employee.getUser().setUserRole(userRole);
		
		employee.setCreatedDate(Date.valueOf(LocalDate.now()));
		//employee.setCreatedBy(createdBy);
		
		Employee emp= new Employee();
		Long empId=employee.getSupervisedBy().getEmployeeId();
		emp=employeeService.getOneByPRimaryId(empId);
		employee.setSupervisedBy(emp);
		
		employeeService.save(employee);
		System.out.println("employeeService.save(employee) out");
		return "redirect:list";
	}
	
	@RequestMapping(value = "/toggleActive", method = RequestMethod.GET)
	public @ResponseBody String toggleIsActive(@RequestParam("employeeId") Long employeeId) {
		System.out.println("inside employee controller toggle isActive employee change");
		Employee employee= employeeService.getOneByPRimaryId(employeeId);
		boolean isactive=employee.isInActive();
		String returnmsg;
		if(isactive){
			employee.setInActive(false);
			returnmsg="{\"msg\":\"inActive\"}";
		}
		else{
			employee.setInActive(true);
			returnmsg="{\"msg\":\"Active\"}";
		}
		employeeService.save(employee);
		return returnmsg;
	}
	
	@RequestMapping(value = "/loadSuperVisor", method = RequestMethod.GET)
	public @ResponseBody  List<suerviseBylistClass> loadSuperViseBy(@RequestParam("departmentId") Long departmentId) {
		System.out.println("inside employee controller loadSuperViseByssss id="+departmentId);
		List<Employee> employees= employeeService.getEmployeeByDepartmentId(departmentId);
		System.out.println("name="+employees.get(0).getFirstName());
		List<suerviseBylistClass> list= new ArrayList<suerviseBylistClass>();
		try{
			System.out.println("Staaaaaart json");
			//String json = new Gson().toJson(employees);
			//System.out.println("json="+json);
			for(Employee e:employees){
				suerviseBylistClass newobj= new suerviseBylistClass();
				newobj.Id=e.getEmployeeId();
				newobj.name=e.getFirstName()+" "+e.getLastName();
				list.add(newobj);
			}
			System.out.println("lsit count="+list.size());
			return list;
		}
		catch(Exception e){
			System.out.println("error="+e.getMessage());
			return null;
		}
		
		
	}
	
	
	public class suerviseBylistClass{
		public String name;
		public long Id;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public long getId() {
			return Id;
		}
		public void setId(long id) {
			Id = id;
		}
	}
	
}
