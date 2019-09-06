/**
 * 
 */
package com.mum.controller;

import java.sql.Timestamp;
import java.util.Date;

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

import com.mum.domain.Attendence;
import com.mum.domain.User;
import com.mum.services.AttendenceService;
import com.mum.services.UserService;

/**
 * @author ashok
 *
 */
@Controller
public class AttendenceController {
	@Autowired
	AttendenceService attendenceService;
	@Autowired
	UserService userService;

	@RequestMapping(value = "/attendence", method = RequestMethod.GET)
	public String getAttendance(Model model) {
		return "attendence";
	}

	@RequestMapping(value = "/attendence", method = RequestMethod.POST)
	public String saveHoliday(@Valid @ModelAttribute("attendance") Attendence attendance, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "attendence";
		}
		return "attendence";
	}

	@RequestMapping(value = "/checkin", method = RequestMethod.GET)
	public @ResponseBody Attendence saveCheckin(@RequestParam("id") Long userId) {

//		if (attendenceService.getByUserIdandDate(userId, new Date()).getCheckinTime() == null) {
			Attendence attendance = new Attendence();
			Date date = new Date();
			attendance.setCheckinTime(new Timestamp(date.getTime()));
			attendance.setDate(date);
			System.out.println("this is users id " + userId);
			User user = userService.getOneByPRimaryId(userId);
			attendance.setUserId(user);
			attendenceService.save(attendance);
//		}

		return null;
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public @ResponseBody Attendence saveCheckout(@RequestParam("id") Long employeeId) {
//		Attendence attendance = new Attendence();
//		Date date = new Date();
//		attendance.setCheckinTime(new Timestamp(date.getTime()));
//		attendance.setDate(date);
//		System.out.println("this is users id " + employeeId);
//		User user = userService.getOneByPRimaryId(employeeId);
//		attendance.setUserId(user);
//		attendenceService.save(attendance);
		return null;
	}
}
