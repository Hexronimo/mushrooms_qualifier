package ru.hexronimo.web.dao;

import java.util.List;

import ru.hexronimo.web.model.*;

public interface MushroomPartDAO {

	public void createMPart(MPart mpart);
	public void createColor(Color color);
	public void createFamily(Family family);
	
	public void updateMPart(MPart mpart);
	
	public void deleteMPart(MPart mpart);
	
	public Cap getCap(int id);
	public Gill getGill(int id);
	public Scale getScale(int id);
	public Stipe getStipe(int id);
	public Skirt getSkirt(int id);
	public Size getSize(int id);
	public Forest getForest(int id);
	public Color getColor(int id);
	public byte[] getMainPhoto(int mushroomId);
	
	public Family getFamily(String name);
	
	public List<Cap> listCaps();
	public List<Gill> listGills();
	public List<Scale> listScales();
	public List<Stipe> listStipes();
	public List<Skirt> listSkirts();
	public List<Size> listSizes();
	public List<Forest> listForests();
	public List<Color> listColors();
	public List<Family> listFamilies();
	public boolean checkMPartIconFile(String filename, String classname);
	public List<String> listIconFiles();

}
