package com.skilldistillery.nonprofit.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpanonprofit.entities.Nonprofit;

@Transactional
@Component
public class NonprofitDAOImpl implements NonprofitDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Nonprofit create(Nonprofit np) {
		em.persist(np);
		em.flush();
		return np;
	}

	@Override
	public Nonprofit retrieveById(int id) {
		Nonprofit np = em.find(Nonprofit.class, id);
		return np;
	}

	@Override
	public List<Nonprofit> retrieveAll() {
		String query = "SELECT np FROM Nonprofit np";
		List<Nonprofit> nonprofits = em.createQuery(query, Nonprofit.class).getResultList();
		return nonprofits;
	}

	@Override
	public Nonprofit update(int id, Nonprofit np) {
		Nonprofit managedNP = em.find(Nonprofit.class, id);
		managedNP.setAbbr(np.getAbbr());
		managedNP.setName(np.getName());
		managedNP.setDescription(np.getDescription());
		managedNP.setCause(np.getCause());
		managedNP.setYearFounded(np.getYearFounded());
		em.persist(managedNP);
		em.flush();
		return managedNP;
	}

	@Override
	public boolean delete(Nonprofit np) {
		int id = np.getId();
		System.out.println(id);
		Nonprofit dbNP = em.find(Nonprofit.class, id);
		boolean deletedNonprofit = false;

		try {
			em.remove(dbNP);
			em.flush();
			deletedNonprofit = true;
		} catch (IllegalArgumentException iae) {
			deletedNonprofit = false;
		}

		return deletedNonprofit;
	}
}
