package ru.hexronimo.web.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import ru.hexronimo.web.model.*;
import ru.hexronimo.web.service.MushroomPartService;
import ru.hexronimo.web.service.MushroomService;

@Controller
public class ApplicationController {

	@Autowired
	private MushroomService mushroomService;
	@Autowired
	private MushroomPartService mushroomPartService;
	
	public static final String ICONPATH = "resources/img/icons";
	
	@RequestMapping("/")
	public String homePage(HttpServletRequest request, Model model) {
		return "home";
	}
	
	@RequestMapping("/addMushroom")
	public String addMushroom(HttpServletRequest request, Model model) {
		
		//чистим директории от лишних картинок (которые не записаны в БД), учитывая что людей, добавляющих грибы в базу будет мало, операция не будет происходить слишком часто		
		File dir = new File(request.getSession().getServletContext().getRealPath("/")  + ICONPATH + "/");
		File[] listOfFiles = dir.listFiles();
		List<String> listOfUsedNames = mushroomPartService.listIconFiles();
		if (listOfFiles != null && listOfUsedNames != null && listOfFiles.length != 0 && listOfUsedNames.size() != 0) {
			for(File f: listOfFiles) {
				if(listOfUsedNames == null || !listOfUsedNames.contains(f.getName())) {
					System.out.println("Изображение " + f.getName() + " не используется и поэтому удалено.");
					f.delete();
				}		
			}
		}
		
		model.addAttribute("sid", request.getSession().getId());
		
		List<Cap> listC = mushroomPartService.listCaps();
		model.addAttribute("caps", listC);
		
		List<Gill> listG = mushroomPartService.listGills();
		model.addAttribute("gills", listG);
		
		List<Scale> listSc = mushroomPartService.listScales();
		model.addAttribute("scales", listSc);
		
		List<Stipe> listSt = mushroomPartService.listStipes();
		model.addAttribute("stipes", listSt);
		
		List<Skirt> listSk = mushroomPartService.listSkirts();
		model.addAttribute("skirts", listSk);
		
		List<Size> listSz = mushroomPartService.listSizes();
		model.addAttribute("sizes", listSz);

		List<Forest> listFr = mushroomPartService.listForests();
		model.addAttribute("forests", listFr);
		
		List<Family> listFm = mushroomPartService.listFamilies();
		model.addAttribute("families", listFm);
		
		List<Color> listCl = mushroomPartService.listColors();
		model.addAttribute("colors", listCl);
		
		model.addAttribute("imgUploadDir","/img/icons/");
		return "add-mushroom";
	}
	
	@RequestMapping(value = "/createColor", method = RequestMethod.POST)
	@ResponseBody
	public void submitColor(HttpServletRequest request) throws Exception {
		String colorName = request.getParameter("colorName");
		String color1 = request.getParameter("color1").substring(1);
		String color2 = request.getParameter("color2").substring(1);
		if (!(colorName == null) && !(color1 == null) || !"".equals(colorName) && !"".equals(color1)) {
			if(color2 == null || "".equals(color2)) color2 = color1;
		}
		
		Color color = new Color();
		color.setName(colorName);
		color.setHex1(color1);
		color.setHex2(color2);
		mushroomPartService.createColor(color);
	}
	
	@RequestMapping(value = "/createMushroom", method = RequestMethod.POST)
	public RedirectView submitMushroom(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String name = request.getParameter("mName");
		String otherNames = request.getParameter("mOtherNames");
		String desc = request.getParameter("mDesc");
		String fam = request.getParameter("family");
		Family family = mushroomPartService.getFamily(fam);
		
		if (family == null) {
			Family f = new Family();
			f.setName(fam);
			mushroomPartService.createFamily(f);
			family = f;
		}
		String eatable = request.getParameter("eatable");
		boolean eatableBool = ("1".equals(eatable)? true : false);
		String eatableDesc = request.getParameter("nEatDesc");
		
		
		String capID = request.getParameter("capID");
		Cap cap = mushroomPartService.getCap(Integer.parseInt(capID));
		String gillID = request.getParameter("gillID");
		Gill gill = mushroomPartService.getGill(Integer.parseInt(gillID));
		String scaleID = request.getParameter("scaleID");
		Scale scale = mushroomPartService.getScale(Integer.parseInt(scaleID));
		String stipeID = request.getParameter("stipeID");
		Stipe stipe = mushroomPartService.getStipe(Integer.parseInt(stipeID));
		String skirtID = request.getParameter("skirtID");
		Skirt skirt = mushroomPartService.getSkirt(Integer.parseInt(skirtID));
		String sizeID = request.getParameter("sizeID");
		Size size = mushroomPartService.getSize(Integer.parseInt(sizeID));
		
		String[] forests = request.getParameterValues("forestID");
		Set<Forest> setForests = new HashSet<>();
		for (String id: forests) {
			Forest forest = mushroomPartService.getForest(Integer.parseInt(id));
			setForests.add(forest);
		}
		


		
		Mushroom mushroom = new Mushroom();
		mushroom.setName(name);
		mushroom.setOtherNames(otherNames);
		mushroom.setDescription(desc);
		mushroom.setFamily(family);
		mushroom.setEatable(eatableBool);
		mushroom.setEatableDesc(eatableDesc);
		
		String[] colors = request.getParameterValues("capColorID");
		if (colors != null && colors.length >= 1)	{
			Color color1 = mushroomPartService.getColor(Integer.parseInt(colors[0]));
			mushroom.setColorCap1(color1);
		}
		if (colors.length > 1)	{
			Color color2 = mushroomPartService.getColor(Integer.parseInt(colors[1]));
			mushroom.setColorCap2(color2);
		}
		
		String[] colors1 = request.getParameterValues("stipeColorID");
		if (colors1 != null && colors1.length >= 1)	{
			Color color3 = mushroomPartService.getColor(Integer.parseInt(colors1[0]));
			mushroom.setColorStipe1(color3);
		}
		if (colors1.length > 1)	{
			Color color4 = mushroomPartService.getColor(Integer.parseInt(colors1[1]));
			mushroom.setColorStipe2(color4);
		}
		
		String gillColor = request.getParameter("gillColorID");
		if (gillColor != null)	{
			Color color5 = mushroomPartService.getColor(Integer.parseInt(gillColor));
			mushroom.setColorGill(color5);
		}
		
		
		
		mushroom.setCap(cap);
		mushroom.setGill(gill);
		mushroom.setScale(scale);
		mushroom.setStipe(stipe);
		mushroom.setSkirt(skirt);
		mushroom.setSize(size);
		
		mushroom.setForests(setForests);
		
		mushroomService.saveMushroom(mushroom);
		mushroom.setForests(setForests);
		
		String mainPhotoName = request.getParameter("mainPhoto");
		String sid = request.getParameter("sid");
		// перемещаем фотографии грибов из временной папки на постоянное хранение
		File dir = new File(request.getSession().getServletContext().getRealPath("/")  + "resources/img/tmp/" + sid);
		File[] listOfFiles = dir.listFiles();
		File createDir = new File(request.getSession().getServletContext().getRealPath("/")  + "resources/img/mushrooms");
		if (!createDir.exists()) {
			createDir.mkdir();	
		}
		Set<PhotoURL> photoURLs = new HashSet<>();
		for (File f : listOfFiles) {
			if (f.isFile()) {
				File newFile;
				do {
					String newFileName = RandomStringUtils.randomAlphabetic(12) + ".jpg";
					newFile = new File(request.getSession().getServletContext().getRealPath("/")  + "resources/img/mushrooms/" + newFileName);
				} while (newFile.exists());		
				PhotoURL purl = new PhotoURL();
				purl.setMushroom(mushroom);
				purl.setPhotoURL(newFile.getName());
				if(mainPhotoName.endsWith(f.getName())) {
					purl.setMain(true);
				} else {
					purl.setMain(false);
				}
				photoURLs.add(purl);
				
				try(InputStream is = new FileInputStream(f); OutputStream os = new FileOutputStream(new File(newFile.getPath()))){
						
					byte[] buf = new byte[1024];
					int bytesRead;
		            while ((bytesRead = is.read(buf)) > 0) {
		                os.write(buf, 0, bytesRead);
		            }
				}
			}
		}
		mushroom.setPhotos(photoURLs);
		mushroomService.updateMushroom(mushroom);
		FileUtils.cleanDirectory(dir);
		dir.delete();
		
		return  new RedirectView("listMushrooms");
		
	}
	
	@RequestMapping(value = "/submitPhotos", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void submitPhotos(@RequestParam("photos") MultipartFile[] files, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		String dir = request.getSession().getServletContext().getRealPath("/")  + "resources/img/tmp/" + request.getSession().getId() + "/";
		String dirthumb = request.getSession().getServletContext().getRealPath("/")  + "resources/img/tmp/thumbs/" + request.getSession().getId() + "/";
		File path = new File(dir);
		if(path.exists()) {
		FileUtils.cleanDirectory(path);
		}
		File paththumb = new File(dirthumb);
		path.mkdir();
		paththumb.mkdir();
		
		List<String> thumbs = new ArrayList<>();
		int i = 0;
		for(MultipartFile file: files) {
			i++;
			if(file.getOriginalFilename().endsWith(".jpg")) {
			String newFileName;
			do {	
			newFileName = RandomStringUtils.randomAlphabetic(6) + ".jpg";
			} while (newFileName.equals(file.getOriginalFilename()));
			
			File imgOriginal = new File( dir + "tmp" + i + "_" + newFileName);
			file.transferTo(imgOriginal);	
					
			BufferedImage bimg = ImageIO.read(imgOriginal);
			int width = bimg.getWidth();
			int height = bimg.getHeight();
			float ratio = (float)250 / width;

			BufferedImage img = new BufferedImage(250, (int)(height*ratio), BufferedImage.TYPE_INT_RGB);
			img.createGraphics().drawImage(bimg.getScaledInstance(250, (int)(height*ratio), Image.SCALE_SMOOTH),0,0,null);
			ImageIO.write(img, "jpg", new File(dirthumb + "tmp" + i + "_" + newFileName));
			thumbs.add(request.getSession().getId() + "/tmp" + i + "_" + newFileName);
			}
		}
		request.getSession().setAttribute("thumbs", thumbs);		
	}
	
	@RequestMapping(value = "/createMPart", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void createMPart(@RequestParam("mPartNewIcon") MultipartFile file, HttpServletRequest request) throws Exception {
		String mPartName = request.getParameter("mPartName");
		String mPartType = request.getParameter("mPartType");
		
		List<String> mPartVariants= new ArrayList<>();
		mPartVariants.addAll(Arrays.asList("Cap", "Gill", "Scale", "Skirt", "Stipe", "Size", "Forest"));
		
		if (!mPartVariants.contains(mPartType)) throw new Exception("Несуществующая часть гриба.");

		if (
				null != mPartName 														// если введено имя части
				&& mPartName.length() >= 3 												// если имя больше 3 букв
				&& null != file 
				&& file.getSize() > 1000 								// если файл прикреплен и больше 1000 байт
				&& ("svg".equals(FilenameUtils.getExtension(file.getOriginalFilename()))
						|| ("Forest".equals(mPartType) && "jpg".equals(FilenameUtils.getExtension(file.getOriginalFilename())))) // если файл имеет расширение svg
				) {	
	
		String filename;

		if ("Forest".equals(mPartType)) {
			do {																			// создаем уникальное рендомное имя
				filename = mPartType.toLowerCase() 
						+ RandomStringUtils.randomAlphabetic(6)+".jpg";
			} while (mushroomPartService.checkMPartIconFile(filename, mPartType));
		} else {
			do {																			// создаем уникальное рендомное имя
				filename = mPartType.toLowerCase() 
						+ RandomStringUtils.randomAlphabetic(6)+".svg";
			} while (mushroomPartService.checkMPartIconFile(filename, mPartType));
		}
		
		MPart part;
		
		if ("Cap".equals(mPartType)) part = new Cap();
		else if ("Gill".equals(mPartType)) part = new Gill();
		else if ("Stipe".equals(mPartType)) part = new Stipe();
		else if ("Scale".equals(mPartType)) part = new Scale();
		else if ("Size".equals(mPartType)) part = new Size();
		else if ("Forest".equals(mPartType)) part = new Forest();
		else part = new Skirt();

		part.setIcon(filename);
		part.setName(mPartName);

		try {
			file.transferTo(new File(request.getSession().getServletContext().getRealPath("/")  + ICONPATH + "/" + filename));		
			mushroomPartService.createMPart(part);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
    } else {
    	throw new Exception("Неправильное имя или файл.");
    }

}

	@RequestMapping(value = "/listMushrooms")
	public String listMushrooms(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		ArrayList<Mushroom> mushrooms = (ArrayList<Mushroom>) mushroomService.listMushrooms();
		Map<Mushroom,String> mushAndThumbs = new HashMap<>(); 
		for(Mushroom m : mushrooms) {
			String main = mushroomPartService.getMainPhoto(m.getId());
			File mainurl = new File(request.getSession().getServletContext().getRealPath("/") + "resources/img/mushrooms/" + main);
			File mainthumburl = new File(request.getSession().getServletContext().getRealPath("/") + "resources/img/mushrooms/thumb_" + main);
			if (!(mainthumburl.exists())) {
				BufferedImage bimg = ImageIO.read(mainurl);
				int width = bimg.getWidth();
				int height = bimg.getHeight();
				float ratio = (float)300 / width;

				BufferedImage img = new BufferedImage(300, (int)(height*ratio), BufferedImage.TYPE_INT_RGB);
				img.createGraphics().drawImage(bimg.getScaledInstance(300, (int)(height*ratio), Image.SCALE_SMOOTH),0,0,null);
				ImageIO.write(img, "jpg", mainthumburl);
			}
			mushAndThumbs.put(m, mainthumburl.getName());	
		}

		model.addAttribute("mushrooms", mushAndThumbs);
		return "list-mushrooms";
	}
	
	@RequestMapping(value = "/findMushroom")
	public String findMushroom(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		List<Cap> listC = mushroomPartService.listCaps();
		model.addAttribute("caps", listC);
		
		List<Gill> listG = mushroomPartService.listGills();
		model.addAttribute("gills", listG);
		
		List<Scale> listSc = mushroomPartService.listScales();
		model.addAttribute("scales", listSc);
		
		List<Stipe> listSt = mushroomPartService.listStipes();
		model.addAttribute("stipes", listSt);
		
		List<Skirt> listSk = mushroomPartService.listSkirts();
		model.addAttribute("skirts", listSk);
		
		List<Size> listSz = mushroomPartService.listSizes();
		model.addAttribute("sizes", listSz);
		
		List<Color> listCl = mushroomPartService.listColors();
		model.addAttribute("colors", listCl);

		return "find-mushroom";
	}
	
	@RequestMapping(value = "/finding")
	@ResponseBody
	public void finding(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		String capID = (String) request.getParameter("capID");
		String[] capColorsID = request.getParameterValues("capColorID");
		String gillID = (String) request.getParameter("gillID");
		String[] gillColorsID = request.getParameterValues("gillColorID");
		String scaleID = (String) request.getParameter("scaleID");
		String stipeID = (String) request.getParameter("stipeID");
		String[] stipeColorsID = request.getParameterValues("stipeColorID");
		String skirtID = (String) request.getParameter("skirtID");
		String sizeID = (String) request.getParameter("sizeID");
		
		ArrayList<Criterion> crits = new ArrayList();
		if(capID != null && !("2".equals(capID))) {
		crits.add(Restrictions.eq("cap", mushroomPartService.getCap(Integer.parseInt(capID))));
		}
		if(gillID != null && !("49".equals(gillID))) {
		crits.add(Restrictions.eq("gill", mushroomPartService.getGill(Integer.parseInt(gillID))));
		}
		if(scaleID != null && !("50".equals(scaleID))) {
		crits.add(Restrictions.eq("scale", mushroomPartService.getScale(Integer.parseInt(scaleID))));
		}
		if(stipeID != null && !("47".equals(stipeID))) {
		crits.add(Restrictions.eq("stipe", mushroomPartService.getStipe(Integer.parseInt(stipeID))));
		}
		if(!(skirtID != null && "3".equals(skirtID))) {
		crits.add(Restrictions.eq("skirt", mushroomPartService.getSkirt(Integer.parseInt(skirtID))));
		}
		if(!(sizeID != null && "52".equals(sizeID))) {
		crits.add(Restrictions.eq("size", mushroomPartService.getSize(Integer.parseInt(sizeID))));
		}
		
		Disjunction cr1 = Restrictions.disjunction();
		Disjunction cr2 = Restrictions.disjunction();		
		if(capColorsID != null && capColorsID.length != 0) {
			ArrayList<String> lc1 = new ArrayList<>(Arrays.asList(capColorsID));				
			lc1.forEach(e -> cr1.add(Restrictions.eq("colorCap1", mushroomPartService.getColor(Integer.parseInt(e)))));
			lc1.forEach(e -> cr2.add(Restrictions.eq("colorCap2", mushroomPartService.getColor(Integer.parseInt(e)))));		
			cr2.add(Restrictions.isNull("colorCap2"));
		}
		
		Disjunction cg1 = Restrictions.disjunction();		
		if(gillColorsID != null && gillColorsID.length != 0) {
			ArrayList<String> lg1 = new ArrayList<>(Arrays.asList(gillColorsID));
			lg1.forEach(e -> cg1.add(Restrictions.eq("colorGill", mushroomPartService.getColor(Integer.parseInt(e)))));	
		}
		
		Disjunction cs1 = Restrictions.disjunction();
		Disjunction cs2 = Restrictions.disjunction();
		if(stipeColorsID != null && stipeColorsID.length != 0) {
			ArrayList<String> ls1 = new ArrayList<>(Arrays.asList(stipeColorsID));		
			ls1.forEach(e -> cs1.add(Restrictions.eq("colorStipe1", mushroomPartService.getColor(Integer.parseInt(e)))));
			ls1.forEach(e -> cs2.add(Restrictions.eq("colorStipe2", mushroomPartService.getColor(Integer.parseInt(e)))));	
			cs2.add(Restrictions.isNull("colorStipe1"));
		}
		
		ArrayList<Mushroom> mushrooms = mushroomService.findMushroom(crits, cr1, cr2, cg1, cs1, cs2);
		// ох, это так плохо
		Map<Mushroom,String> mushAndThumbs = new HashMap<>(); 
		for(Mushroom m : mushrooms) {
			
			String main = mushroomPartService.getMainPhoto(m.getId());
			File mainurl = new File(request.getSession().getServletContext().getRealPath("/") + "resources/img/mushrooms/" + main);
			File mainthumburl = new File(request.getSession().getServletContext().getRealPath("/") + "resources/img/mushrooms/thumb_" + main);
			if (!(mainthumburl.exists())) {
				BufferedImage bimg = ImageIO.read(mainurl);
				int width = bimg.getWidth();
				int height = bimg.getHeight();
				float ratio = (float)300 / width;

				BufferedImage img = new BufferedImage(300, (int)(height*ratio), BufferedImage.TYPE_INT_RGB);
				img.createGraphics().drawImage(bimg.getScaledInstance(300, (int)(height*ratio), Image.SCALE_SMOOTH),0,0,null);
				ImageIO.write(img, "jpg", mainthumburl);
			}
			mushAndThumbs.put(m, mainthumburl.getName());	
		}

		request.getSession().setAttribute("mushrooms", mushAndThumbs);
				
	}
	
	@RequestMapping(value = "/getMushroom")
	@ResponseBody
	public void getMushroom(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
	
		Mushroom mushroom = mushroomService.getMushroom(Integer.parseInt((String) request.getParameter("id")));
		Set<PhotoURL> photos = mushroom.getPhotos();
		ArrayList<String> urls = new ArrayList<>();
		for(PhotoURL u: photos) {
			if(!u.isMain()) {
			urls.add(u.getPhotoURL());
			} else {
				request.getSession().setAttribute("mainPhoto", u.getPhotoURL());
			}
		}
		request.getSession().setAttribute("mushroom", mushroom);
		request.getSession().setAttribute("photos", urls);
		request.getSession().setAttribute("forests", mushroom.getForests());
	}
	
	@RequestMapping(value = "/deleteMushroom")
	@ResponseBody
	public void getMushroom(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String id = (String) request.getParameter("deleteID");
		mushroomService.deleteMushroom(Integer.parseInt(id));
	}
	
	
}
