package ru.hexronimo.web.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;

import ru.hexronimo.web.model.Mushroom;

public interface MushroomService {

	// from DAO
	public List<Mushroom> listMushrooms();
	public void saveMushroom(Mushroom mashroom);
	public Mushroom getMushroom(int id);
	public void updateMushroom(Mushroom mashroom);
	public void deleteMushroom(int id);	
	public ArrayList<Mushroom> findMushroom(ArrayList<Criterion> crit, Disjunction d1, Disjunction d2, Disjunction d3, Disjunction d4, Disjunction d5);
}
