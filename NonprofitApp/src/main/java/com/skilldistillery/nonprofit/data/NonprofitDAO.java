package com.skilldistillery.nonprofit.data;

import java.util.List;

import com.skilldistillery.jpanonprofit.entities.Nonprofit;

public interface NonprofitDAO {
 Nonprofit create(Nonprofit np); 
 Nonprofit retrieveById(int id);
 List<Nonprofit> retrieveAll();
 Nonprofit update(int id, Nonprofit np);
 boolean delete(Nonprofit np);
}
