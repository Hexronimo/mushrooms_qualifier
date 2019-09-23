package ru.hexronimo.web.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "colors")
public class Color {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "other_values_seq")
	@Column(name = "id", updatable = false, nullable = false)
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name = "hexcolor_1")
	private String hex1;
	@Column(name = "hexcolor_2")
	private String hex2;
	
	
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
	public String getHex1() {
		return hex1;
	}
	public void setHex1(String hex1) {
		this.hex1 = hex1;
	}
	public String getHex2() {
		return hex2;
	}
	public void setHex2(String hex2) {
		this.hex2 = hex2;
	}
		
	
}
