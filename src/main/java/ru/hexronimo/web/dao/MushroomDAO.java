package ru.hexronimo.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;

import ru.hexronimo.web.model.Mushroom;

public interface MushroomDAO {

	public List<Mushroom> listMushrooms();
	public void saveMushroom(Mushroom mushroom);
	public Mushroom getMushroom(int id);
	public void updateMushroom(Mushroom mushroom);
	public void deleteMushroom(int id);	
	public ArrayList<Mushroom> findMushroom(ArrayList<Criterion> crit, Disjunction d1, Disjunction d2, Disjunction d3, Disjunction d4, Disjunction d5);
	
}
