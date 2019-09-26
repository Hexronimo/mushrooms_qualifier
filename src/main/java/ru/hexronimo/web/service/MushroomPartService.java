package ru.hexronimo.web.service;

import java.util.List;

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

public interface MushroomPartService {
	
	public void deleteMPart(MPart mpart);

	
	public boolean checkMPartIconFile(String filename, String classname);
	public List<String> listIconFiles();
	public void createMPart(MPart mpart);
	public void createColor(Color color);
	public void createFamily(Family family);
	
	public List<Cap> listCaps();
	public List<Gill> listGills();
	public List<Scale> listScales();
	public List<Stipe> listStipes();
	public List<Skirt> listSkirts();
	public List<Size> listSizes();
	public List<Forest> listForests();
	public List<Family> listFamilies();
	public List<Color> listColors();
	
	public Cap getCap(int id);
	public Gill getGill(int id);
	public Scale getScale(int id);
	public Stipe getStipe(int id);
	public Skirt getSkirt(int id);
	public Size getSize(int id);
	public Forest getForest(int id);
	
	public Family getFamily(String name);
	
	public void updateMPart(MPart mpart);

	public Color getColor(int id);
	
	public String getMainPhoto(int mushroomId);
	
	public void saveIcon(DataObject obj);
}
