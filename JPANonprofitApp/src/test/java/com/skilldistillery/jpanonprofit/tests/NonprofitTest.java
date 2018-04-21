package com.skilldistillery.jpanonprofit.tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpanonprofit.entities.Nonprofit;

class NonprofitTest {
	@PersistenceContext
//	private EntityManager em;
	
	private EntityManagerFactory emf;
	private EntityManager em;
	private Nonprofit createdNp;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("NonprofitApp");
		em = emf.createEntityManager();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	void read_test() {
		Nonprofit np = em.find(Nonprofit.class, 1);
		assertEquals("CASA", np.getAbbr());
		assertEquals("Court Appointed Special Advocates", np.getName());
		assertEquals(
				"CASA volunteers are appointed by judges to advocate for the best interests of abused and neglected children in court and other settings. The primary responsibilities of a CASA volunteer are to: Gather information: Review documents and records, interview the children, family members and professionals in their lives.",
				np.getDescription());
		assertEquals("Humanitarian - Local", np.getCause());
		int yearF = np.getYearFounded();
		assertEquals(1977, yearF);
	}

}
