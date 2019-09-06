/**
 * 
 */
package com.mum.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mum.domain.Leave;
import com.mum.services.HolidaysService;
import com.mum.services.LeaveService;
import com.mum.services.UserService;

/**
 * @author ashok
 *
 */
@Controller
public class LeaveController {
	@Autowired
	LeaveService leaveService;
	@Autowired
	HolidaysService holidaysService;
	@Autowired
	UserService userService;

	@RequestMapping(value = "/leave", method = RequestMethod.GET)
	public String applyLeave(@ModelAttribute("leave") Leave leave, Model model) {
		model.addAttribute("holidaysList", holidaysService.getAll());
		return "leaveForm";
	}

	@RequestMapping(value = "/leave", method = RequestMethod.POST)
	public String saveLeave(@ModelAttribute("leave") Leave leave, RedirectAttributes redirectAtribute) {
		// if (result.hasErrors()) {
		// System.out.println("this is error");
		// return "leaveForm";
		// }
		leaveService.save(leave);
		redirectAtribute.addFlashAttribute(leave);
		return "redirect:leaveList";
	}

	@RequestMapping(value = "/leaveList", method = RequestMethod.GET)
	public String leaveList(Model model) {
		List<Leave> lll = leaveService.getAll();
		System.out.println("this is leave id "+lll.get(0).getLeaveid());
		model.addAttribute("leaveList", leaveService.getAll());
		return "leaveList";
	}

	@RequestMapping(value = "/updateLeave", method = RequestMethod.GET)
	public @ResponseBody String updateLeave(@RequestParam("id") Long id) {
		System.out.println("this is id cotroller" + id);
		Leave leave = leaveService.getOneByPRimaryId(id);
		leave.setApproved(true);
		leaveService.save(leave);
		System.out.println("this is id cotrollerdsfgd" + id);
		return "{\"msg\":\"success\"}";

	}

}
