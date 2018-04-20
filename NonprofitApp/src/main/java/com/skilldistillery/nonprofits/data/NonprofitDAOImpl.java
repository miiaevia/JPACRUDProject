package com.skilldistillery.nonprofits.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component
public class NonprofitDAOImpl implements NonprofitDAO {
	@PersistenceContext
	private EntityManager em;
}
