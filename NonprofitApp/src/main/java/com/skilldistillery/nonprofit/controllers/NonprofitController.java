package com.skilldistillery.nonprofit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nonprofits.data.NonprofitDAO;

@Controller
public class NonprofitController {
	@Autowired
	private NonprofitDAO dao; 
	
	@RequestMapping(path="index.do", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("WEB-INF/views/index.jsp");
//		Nonprofit np = dao.retrieveById(1);
		return mv;
	}
}
