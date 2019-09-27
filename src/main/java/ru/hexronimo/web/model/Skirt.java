package ru.hexronimo.web.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "skirt")
public class Skirt extends MPart {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "other_values_seq")
	@Column(name = "id", updatable = false, nullable = false)
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name = "icon")
	private String icon;
	@Column(name = "icon_heroku")
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
