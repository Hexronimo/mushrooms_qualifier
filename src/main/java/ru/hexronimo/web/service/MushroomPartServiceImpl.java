package ru.hexronimo.web.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ru.hexronimo.web.dao.MushroomPartDAO;
import ru.hexronimo.web.model.Cap;
import ru.hexronimo.web.model.Color;
import ru.hexronimo.web.model.Family;
import ru.hexronimo.web.model.Forest;
import ru.hexronimo.web.model.Gill;
import ru.hexronimo.web.model.MPart;
import ru.hexronimo.web.model.Scale;
import ru.hexronimo.web.model.Size;
import ru.hexronimo.web.model.Skirt;
import ru.hexronimo.web.model.Stipe;

@Service
public class MushroomPartServiceImpl implements MushroomPartService {
	
	@Autowired
	private MushroomPartDAO mushroomPartDAO;
	
	@Transactional
	@Override
	public List<Cap> listCaps() {
		return mushroomPartDAO.listCaps();
	}
	
	@Transactional
	@Override
	public List<Gill> listGills() {
		return mushroomPartDAO.listGills();
	}
	
	@Transactional
	@Override
	public List<Scale> listScales() {
		return mushroomPartDAO.listScales();
	}

	@Transactional
	@Override
	public List<Stipe> listStipes() {
		return mushroomPartDAO.listStipes();
	}

	@Transactional
	@Override
	public List<Skirt> listSkirts() {
		return mushroomPartDAO.listSkirts();
	}

	@Transactional
	@Override
	public List<Size> listSizes() {
		return mushroomPartDAO.listSizes();
	}

	@Transactional
	@Override
	public List<Forest> listForests() {
		return mushroomPartDAO.listForests();
	}
	
	@Transactional
	@Override
	public List<Family> listFamilies() {
		return mushroomPartDAO.listFamilies();
	}
	
	@Transactional
	@Override
	public List<Color> listColors() {
		return mushroomPartDAO.listColors();
	}

	@Transactional
	@Override
	public void createMPart(MPart mpart) {
		mushroomPartDAO.createMPart(mpart);
	}
	
	@Transactional
	@Override
	public void createColor(Color color) {
		mushroomPartDAO.createColor(color);
	}
	
	@Transactional
	@Override
	public void createFamily(Family family) {
		mushroomPartDAO.createFamily(family);
	}

	@Transactional
	@Override
	public void updateMPart(MPart mpart) {
		mushroomPartDAO.updateMPart(mpart);
	}

	@Transactional
	@Override
	public void deleteMPart(MPart mpart) {
		mushroomPartDAO.deleteMPart(mpart);
	}
	
	@Transactional
	@Override
	public boolean checkMPartIconFile(String filename, String classname) {
		return mushroomPartDAO.checkMPartIconFile(filename, classname);
	}
	
	@Transactional
	@Override
	public List<String> listIconFiles() {
		return mushroomPartDAO.listIconFiles();
	}

	@Transactional
	@Override
	public Cap getCap(int id) {
		return mushroomPartDAO.getCap(id);
	}

	@Transactional
	@Override
	public Gill getGill(int id) {
		return mushroomPartDAO.getGill(id);
	}

	@Transactional
	@Override
	public Scale getScale(int id) {
		return mushroomPartDAO.getScale(id);
	}

	@Transactional
	@Override
	public Stipe getStipe(int id) {
		return mushroomPartDAO.getStipe(id);
	}

	@Transactional
	@Override
	public Skirt getSkirt(int id) {
		return mushroomPartDAO.getSkirt(id);
	}

	@Transactional
	@Override
	public Size getSize(int id) {
		return mushroomPartDAO.getSize(id);
	}
	
	@Transactional
	@Override
	public Forest getForest(int id) {
		return mushroomPartDAO.getForest(id);
	}
	
	@Transactional
	@Override
	public Family getFamily(String name) {
		return mushroomPartDAO.getFamily(name);
	}
	
	@Transactional
	@Override
	public Color getColor(int id) {
		return mushroomPartDAO.getColor(id);
	}
	
	@Transactional
	@Override
	public String getMainPhoto(int id) {
		return mushroomPartDAO.getMainPhoto(id);
	}
	
}
