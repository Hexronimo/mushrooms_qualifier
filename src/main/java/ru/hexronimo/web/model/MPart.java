package ru.hexronimo.web.model;

import java.util.Base64;

public class MPart {
	private int id;
	private String name;
	private String icon;
	private byte[] file;
	
	public byte[] getFile() {
		return file;
	}
	public String getFileAsString() {
		try {
			String str = Base64.getEncoder().encodeToString(file);
			return str;
		} catch (Exception e) {}
		return null;
	}	
	public void setFile(byte[] file) {
		this.file = file;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}	
}
