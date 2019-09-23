package ru.hexronimo.web.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.hexronimo.web.dao.MushroomDAO;
import ru.hexronimo.web.model.Mushroom;

@Service
public class MushroomServiceImpl implements MushroomService {
	
	@Autowired
	private MushroomDAO mushroomDAO;

	@Override
	@Transactional
	public List<Mushroom> listMushrooms() {
		return mushroomDAO.listMushrooms();
	}

	@Override
	@Transactional
	public void saveMushroom(Mushroom mashroom) {
		mushroomDAO.saveMushroom(mashroom);
	}

	@Override
	@Transactional
	public Mushroom getMushroom(int id) {
		return mushroomDAO.getMushroom(id);
	}

	@Override
	@Transactional
	public void updateMushroom(Mushroom mashroom) {
		mushroomDAO.updateMushroom(mashroom);
	}

	@Override
	@Transactional
	public void deleteMushroom(int id) {
		mushroomDAO.deleteMushroom(id);	
	}

	@Override
	@Transactional
	public ArrayList<Mushroom> findMushroom(ArrayList<Criterion> crit, Disjunction d1, Disjunction d2, Disjunction d3, Disjunction d4, Disjunction d5) {
		return mushroomDAO.findMushroom(crit, d1, d2, d3, d4, d5);
	}
	
	

}
