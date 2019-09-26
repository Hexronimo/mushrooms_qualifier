package ru.hexronimo.web.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.hexronimo.web.model.*;


@Repository
public class MushroomPartDAOImpl implements MushroomPartDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Cap> listCaps() {
		@SuppressWarnings("unchecked")
		List<Cap> list = (List<Cap>)sessionFactory.getCurrentSession().createQuery("FROM Cap ORDER BY id").getResultList();
		return list;
	}
	
	@Override
	public List<Gill> listGills() {
		@SuppressWarnings("unchecked")
		List<Gill> list = (List<Gill>)sessionFactory.getCurrentSession().createQuery("FROM Gill ORDER BY id").getResultList();
		return list;
	}
	
	@Override
	public List<Scale> listScales() {
		@SuppressWarnings("unchecked")
		List<Scale> list = (List<Scale>)sessionFactory.getCurrentSession().createQuery("FROM Scale ORDER BY id").getResultList();
		return list;
	}
	
	@Override
	public List<Stipe> listStipes() {
		@SuppressWarnings("unchecked")
		List<Stipe> list = (List<Stipe>)sessionFactory.getCurrentSession().createQuery("FROM Stipe ORDER BY id").getResultList();
		return list;
	}
	
	@Override
	public List<Skirt> listSkirts() {
		@SuppressWarnings("unchecked")
		List<Skirt> list = (List<Skirt>)sessionFactory.getCurrentSession().createQuery("FROM Skirt ORDER BY id").getResultList();
		return list;
	}
	
	@Override
	public List<Size> listSizes() {
		@SuppressWarnings("unchecked")
		List<Size> list = (List<Size>)sessionFactory.getCurrentSession().createQuery("FROM Size ORDER BY id").getResultList();
		return list;
	}
	
	@Override
	public List<Forest> listForests() {
		@SuppressWarnings("unchecked")
		List<Forest> list = (List<Forest>)sessionFactory.getCurrentSession().createQuery("FROM Forest ORDER BY id").getResultList();
		return list;
	}
	
	@Override
	public List<Family> listFamilies() {
		@SuppressWarnings("unchecked")
		List<Family> list = (List<Family>)sessionFactory.getCurrentSession().createQuery("FROM Family ORDER BY name").getResultList();
		return list;
	}
	
	@Override
	public List<Color> listColors() {
		@SuppressWarnings("unchecked")
		List<Color> list = (List<Color>)sessionFactory.getCurrentSession().createQuery("FROM Color ORDER BY id").getResultList();
		return list;
	}
	
	@Override
	public void createMPart(MPart mpart) {
		sessionFactory.getCurrentSession().save(mpart);	
	}
	
	@Override
	public void updateMPart(MPart mpart) {
		sessionFactory.getCurrentSession().update(mpart);	
	}


	@Override
	public void createColor(Color color) {
		sessionFactory.getCurrentSession().save(color);		
	}

	@Override
	public void deleteMPart(MPart mpart) {
		//sessionFactory.getCurrentSession().delete(mushroom);
		
	}
	
	// проверяет занято ли имя файла иконки части гриба (шляпки, ножки и т.п.)
	@Override
	public boolean checkMPartIconFile(String filename, String classname) {
		@SuppressWarnings("unchecked")
		List<Object> part = sessionFactory.getCurrentSession().createQuery("FROM " +  classname + " WHERE icon='" + filename + "'").getResultList();

		if (!(part.size() == 0)) return true; //имя занято
		return false; //имя свободно		
	}
	
	@Override
	public List<String> listIconFiles() {
		@SuppressWarnings("unchecked")
		List<String> icons = (List<String>) sessionFactory.getCurrentSession().createQuery("SELECT icon FROM IconsView").getResultList();
		return icons;	
	}

	@Override
	public Cap getCap(int id) {
		return (Cap)sessionFactory.getCurrentSession().createQuery("FROM Cap WHERE id='" + id +"'").getSingleResult();	
	}

	@Override
	public Gill getGill(int id) {
		return (Gill)sessionFactory.getCurrentSession().createQuery("FROM Gill WHERE id=" + id).getSingleResult();
	}

	@Override
	public Scale getScale(int id) {
		return (Scale)sessionFactory.getCurrentSession().createQuery("FROM Scale WHERE id=" + id).getSingleResult();
	}

	@Override
	public Stipe getStipe(int id) {
		return (Stipe)sessionFactory.getCurrentSession().createQuery("FROM Stipe WHERE id=" + id).getSingleResult();
	}

	@Override
	public Skirt getSkirt(int id) {
		return (Skirt)sessionFactory.getCurrentSession().createQuery("FROM Skirt WHERE id=" + id).getSingleResult();
	}

	@Override
	public Size getSize(int id) {
		return (Size)sessionFactory.getCurrentSession().createQuery("FROM Size WHERE id=" + id).getSingleResult();
	}
	
	@Override
	public Forest getForest(int id) {
		return (Forest)sessionFactory.getCurrentSession().createQuery("FROM Forest WHERE id=" + id).getSingleResult();
	}
	
	@Override
	public Color getColor(int id) {
		return (Color)sessionFactory.getCurrentSession().createQuery("FROM Color WHERE id=" + id).getSingleResult();
	}
	
	@Override
	public Family getFamily(String name) {
		@SuppressWarnings("unchecked")
		List<Family> list = (List<Family>)sessionFactory.getCurrentSession().createQuery("FROM Family WHERE name='" + name + "'").getResultList();
		if (list == null || list.size() == 0) {
			return null;
		} else {
			return list.get(0);
		}
	}
	
	@Override
	public void createFamily(Family family) {
		sessionFactory.getCurrentSession().save(family);
	}

	@Override
	public String getMainPhoto(int mushroomId) {
		String url = (String) sessionFactory.getCurrentSession().createQuery("SELECT photoURL FROM PhotoURL WHERE mushroom='" + mushroomId + "' AND isMain=true").getSingleResult();
		return url;
	}
	
	@Override
	public void saveIcon(Icon icon) {
		sessionFactory.getCurrentSession().save(icon);	
	}


}
