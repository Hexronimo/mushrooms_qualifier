package ru.hexronimo.web.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Immutable;

@Entity
@Immutable
@Table(name = "all_icons")
public class IconsView {

@Id	
@Column(name="icon")
String icon;

public String getIcon() {
	return icon;
}

public void setIcon(String icon) {
	this.icon = icon;
}


}
