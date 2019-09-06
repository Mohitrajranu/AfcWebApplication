package com.mum.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mum.domain.Department;
import com.mum.services.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	@Autowired 
	DepartmentService departmentService;
	
	@RequestMapping({"/", "/list"})
	public String showemployeeList(Model model) {
		System.out.println("inside department controller");
		List<Department> departmentList=departmentService.getAll();
		model.addAttribute("departmentList",departmentList);
		return "departmentList";
	}
	
	@RequestMapping(value="/addnewdepartment" ,method = RequestMethod.GET)
	public String addNewEmployee( @ModelAttribute("newdepartment") Department department, Model model) {
		return "newDepartmentForm";
	}
	
	@RequestMapping(value="/addnewdepartment" ,method = RequestMethod.POST)
	public String saveNewEmployee(@Valid @ModelAttribute("newdepartment") Department department,BindingResult bindingResult,
			RedirectAttributes redirectAttribute,Model model) {
		if(bindingResult.hasErrors()){
			return "newDepartmentForm";
		}
		
		return "redirect:department/departmentList";
	}
}
