package ru.hexronimo.web.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "photo")
public class PhotoURL {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "other_values_seq")
	@Column(name = "id", updatable = false, nullable = false)
	private int id;
	@ManyToOne
	@JoinColumn(name = "mushroom_id")
	private Mushroom mushroom;
	@Column(name = "photo_url")
	private String photoURL;
	@Column(name = "main")
	private boolean isMain;
	public Mushroom getMushroom() {
		return mushroom;
	}
	public void setMushroom(Mushroom mushroom) {
		this.mushroom = mushroom;
	}
	public boolean isMain() {
		return isMain;
	}
	public void setMain(boolean isMain) {
		this.isMain = isMain;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhotoURL() {
		return photoURL;
	}
	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}
	
}
