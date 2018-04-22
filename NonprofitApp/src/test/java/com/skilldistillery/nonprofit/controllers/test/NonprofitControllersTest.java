package com.skilldistillery.nonprofit.controllers.test;

import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nonprofit.controllers.NonprofitController;
import com.skilldistillery.nonprofit.data.NonprofitDAO;

//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
//
//import org.springframework.test.web.servlet.MvcResult;
//import org.springframework.ui.ModelMap;


@RunWith(SpringJUnit4ClassRunner.class)
//Default file name is class with '-context.xml'
@ContextConfiguration(locations={"NonprofitControllers-context.xml"})
@WebAppConfiguration
public class NonprofitControllersTest {
	@Autowired
	  WebApplicationContext wac;
	@Autowired
	  private NonprofitDAO dao;
	

	  private MockMvc mockMvc;

	  // This bean is not required for any tests, but is made available with @Autowired
	  @Autowired
	  NonprofitController controller;

	  @Before
	  public void setUp() throws Exception {
	    this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	  }

	@Test
	  public void test_GET_getNonprofit_sets_nonprofit_view_and_adds_nonprofit_to_model() {
		try {
			MvcResult result = mockMvc.perform(get("/getNonprofit.do").param("npid"))
			          .andExpect(status().isOk())
			          .andReturn();
		} catch (Exception e) {
			e.printStackTrace();
		}
//	    // Create a Model implementation object to pass to the method

	    // Controller method call
	    ModelAndView mv = controller.getNonprofit(1);
	    ModelMap modelMap = mv.getModelMap();

	    assertEquals("WEB-INF/views/nonprofit.jsp", mv.getViewName());

//	    // Get the model as a map of key-value pairs
//	    Map<String, Object> map = model.asMap();
//	    assertNotNull(map);
//	    assertEquals("The world will be conquered by robots...", map.get("description"));
//	    assertEquals(2035, map.get("year"));

	  }
	@Test
	public void test_GET_index_sets_index_view() {
		ModelAndView mv = controller.index();
		assertEquals("WEB-INF/views/index.jsp", mv.getViewName());
	}
	@Test
	public void test_GET_updateNpView_returns_updateNonprofitForm_view() {
		try {
			MvcResult result = mockMvc.perform(get("/updateNonprofit.do").param("id"))
			          .andExpect(status().isOk())
			          .andReturn();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    ModelAndView mv = controller.getNonprofit(1);
	    ModelMap modelMap = mv.getModelMap();

	    assertEquals("WEB-INF/views/updateNonprofitForm.jsp", mv.getViewName());

	}
	@Test
	public void test_POST_updateNonprofit_returns_nonprofit_view() {
		try {
			MvcResult result = mockMvc.perform(post("/updateNonprofit.do").param("id"))
			          .andExpect(status().isOk())
			          .andReturn();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    ModelAndView mv = controller.getNonprofit(1);
	    ModelMap modelMap = mv.getModelMap();

	    assertEquals("WEB-INF/views/nonprofit.jsp", mv.getViewName());
	}
	@Test
	public void test_GET_addNonprofitGet_returns_addNonprofit_view() {
		try {
			MvcResult result = mockMvc.perform(get("/addNonprofit.do").param("id"))
			          .andExpect(status().isOk())
			          .andReturn();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    ModelAndView mv = controller.getNonprofit(1);
	    ModelMap modelMap = mv.getModelMap();

	    assertEquals("WEB-INF/views/addNonprofit.jsp", mv.getViewName());
	}
	@Test
	public void test_POST_addNonprofitPost_returns_nonprofit_view() {
		try {
			MvcResult result = mockMvc.perform(post("/addNonprofit.do").param("id"))
			          .andExpect(status().isOk())
			          .andReturn();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    ModelAndView mv = controller.getNonprofit(1);
	    ModelMap modelMap = mv.getModelMap();

	    assertEquals("WEB-INF/views/nonprofit.jsp", mv.getViewName());
	}
	@Test
	public void test_POST_deleteNonprofit_returns_nonprofit_view() {
		try {
			MvcResult result = mockMvc.perform(post("/deleteNonprofit.do").param("id"))
			          .andExpect(status().isOk())
			          .andReturn();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    ModelAndView mv = controller.getNonprofit(1);
	    ModelMap modelMap = mv.getModelMap();

	    assertEquals("WEB-INF/views/index.jsp", mv.getViewName());
	}
}
