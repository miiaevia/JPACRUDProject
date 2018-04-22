package com.skilldistillery.nonprofit.controllers.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.skilldistillery.jpanonprofit.entities.Nonprofit;
import com.skilldistillery.nonprofit.data.NonprofitDAO;

public class MockNonprofitDAO implements NonprofitDAO{
	public Map<Integer, Nonprofit> nonprofits = new HashMap<>();
	
	@Override
	public Nonprofit create(Nonprofit np) {
		nonprofits.put(np.getId(), np);
		return np;
	}

	@Override
	public Nonprofit retrieveById(int id) {
		return nonprofits.get(id);
	}

	@Override
	public List<Nonprofit> retrieveAll() {
		return new ArrayList<>(nonprofits.values());
	}

	@Override
	public Nonprofit update(int id, Nonprofit np) {
		return nonprofits.replace(id, np);
	}

	@Override
	public boolean delete(Nonprofit np) {
		boolean deleted = nonprofits.remove(np.getId(), np);
		return deleted;
	}

}
