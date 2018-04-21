package com.skilldistillery.nonprofit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpanonprofit.entities.Nonprofit;
import com.skilldistillery.nonprofit.data.NonprofitDAO;

@Controller
public class NonprofitController {
	@Autowired
	private NonprofitDAO dao; 
	
	@RequestMapping(path="index.do", method=RequestMethod.GET)
	public ModelAndView index() {
//		System.out.println("***********************");
		ModelAndView mv = new ModelAndView(); 
		List<Nonprofit> nonprofits = dao.retrieveAll();
		mv.addObject("nonprofits", nonprofits);
		mv.setViewName("WEB-INF/views/index.jsp");
//		Nonprofit np = dao.retrieveById(1);
		return mv;
	}
	
	@RequestMapping(path = "getNonprofit.do", method=RequestMethod.GET)
	public ModelAndView getNonprofit(@RequestParam(name="npid") Integer npId) {
		ModelAndView mv = new ModelAndView();
		Nonprofit np = dao.retrieveById(npId);
		mv.addObject("nonprofit", np);
		mv.setViewName("WEB-INF/views/nonprofit.jsp");
		return mv;
	}
	
	@RequestMapping(path = "updateNonprofit.do", method=RequestMethod.POST)
	public ModelAndView updateNonprofit(@RequestParam(name="npid") Integer npId) {
		ModelAndView mv = new ModelAndView();
		Nonprofit np = dao.retrieveById(npId);
		// call updateNonprofit method here and add MANAGED np, not np
		mv.addObject("nonprofit", np);
		mv.setViewName("WEB-INF/views/updateNonprofitForm.jsp");
		return mv;
	}
	@RequestMapping(path = "addNonprofit.do", method=RequestMethod.GET)
	public ModelAndView addNonprofitGet() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/addNonprofit.jsp");
		return mv;
	}
	@RequestMapping(path = "addNonprofit.do", method=RequestMethod.POST)
	public ModelAndView addNonprofitPost(Nonprofit newNP) {
		ModelAndView mv = new ModelAndView();
		Nonprofit np = dao.create(newNP);
		if (np != null) {
			mv.addObject(np);
			mv.addObject("nonprofit", np);
			mv.setViewName("WEB-INF/views/nonprofit.jsp");
		}
		else {
			String message = "Unable to add Non-Profit";
			mv.addObject(message);
			mv.setViewName("WEB-INF/views/index.jsp");
		}
		return mv;
	}
	
	@RequestMapping(path = "deleteNonprofit.do", method=RequestMethod.POST)
	public ModelAndView deleteNonprofit(@RequestParam(name="id") int id) {
//		System.out.println("me");
		Nonprofit np = dao.retrieveById(id);
		ModelAndView mv = new ModelAndView(); 
		if (dao.delete(np)) {
			List<Nonprofit> nonprofits = dao.retrieveAll();
			mv.addObject("nonprofits", nonprofits);
			mv.setViewName("WEB-INF/views/index.jsp");
			
		}
		else {
			mv.setViewName("WEB-INF/views/nonprofit.jsp");
		}
		return mv;
	}
}
