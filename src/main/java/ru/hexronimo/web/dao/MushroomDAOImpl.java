package ru.hexronimo.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.transform.DistinctRootEntityResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.hexronimo.web.model.Mushroom;

@Repository
public class MushroomDAOImpl implements MushroomDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Mushroom> listMushrooms() {
		@SuppressWarnings("unchecked")
		List<Mushroom> listMashrooms = (List<Mushroom>)sessionFactory.getCurrentSession().createQuery("FROM Mushroom ORDER BY name").getResultList();
		return listMashrooms;
	}

	@Override
	public void saveMushroom(Mushroom mushroom) {
		sessionFactory.getCurrentSession().save(mushroom);
	}

	@Override
	public Mushroom getMushroom(int id) {
		Mushroom mashroom = sessionFactory.getCurrentSession().get(Mushroom.class, id);
		return mashroom;
	}

	@Override
	public void updateMushroom(Mushroom mushroom) {
		sessionFactory.getCurrentSession().update(mushroom);
	}

	@Override
	public void deleteMushroom(int id) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Mushroom WHERE id = " + id).executeUpdate();
	}

	@Override
	public ArrayList<Mushroom> findMushroom(ArrayList<Criterion> crit, Disjunction d1, Disjunction d2, Disjunction d3, Disjunction d4, Disjunction d5) {
		
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Mushroom.class);
		for(Criterion c : crit) {
			criteria.add(c);
		}
		
		criteria.add(d4);
		criteria.add(d1); 
		criteria.add(d3);
		criteria.setResultTransformer(DistinctRootEntityResultTransformer.INSTANCE);

		ArrayList<Mushroom> m = new ArrayList<>();	
		m = (ArrayList<Mushroom>) criteria.list();
		
		Criteria criteria1 = sessionFactory.getCurrentSession().createCriteria(Mushroom.class);
		
		for(Criterion c : crit) {
			criteria1.add(c);
		}
		
		criteria1.add(d4);
		criteria1.add(d1); 
		criteria1.add(d2);
		criteria1.add(d5);
		criteria1.add(d3);
		
		criteria1.setResultTransformer(DistinctRootEntityResultTransformer.INSTANCE);
		ArrayList<Mushroom> n = new ArrayList<>();
		n = (ArrayList<Mushroom>) criteria1.list();
		
		System.out.println("ooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
		for(Mushroom kj : n){
		System.out.println(kj.getName());	
		}
		System.out.println("ooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
		
		n.addAll(m);
		return n;
		
		
		
	}


}
