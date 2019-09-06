/**
 * 
 */
package com.mum.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mum.domain.Holidays;
import com.mum.services.HolidaysService;

/**
 * @author ashok
 *
 */
@Controller
public class HolidaysController {
	@Autowired
	HolidaysService holidaysService;

	@RequestMapping(value = "/holidays", method = RequestMethod.GET)
	public String addHoliday(@ModelAttribute("holidays") Holidays holidays) {
		return "holidays";
	}

	@RequestMapping(value = "/holidays", method = RequestMethod.POST)
	public String saveHoliday(@Valid @ModelAttribute("holidays") Holidays holidays, BindingResult result,
			RedirectAttributes redirectAttribute) {
		if (result.hasErrors()) {
			return "holidays";
		}
		holidaysService.save(holidays);
//		redirectAttribute.addFlashAttribute("holidays", holidays);
		return "redirect:holidays";
	}

	@RequestMapping(value = "/holidaysList", method = RequestMethod.GET)
	public String getHolidayList(Model model) {
		model.addAttribute("holidaysList",holidaysService.getAll());
		return "holidaysList";
	}

}
