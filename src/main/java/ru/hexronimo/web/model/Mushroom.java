package ru.hexronimo.web.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

@Entity
@Table(name = "mushrooms")
public class Mushroom {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "mushrooms_seq")	
	@Column(name = "id", updatable = false, nullable = false)
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name="description")
	private String description;
	@Column(name="other_names")
	private String otherNames;
	@Column(name = "eatable")
	private boolean eatable;
	@Column(name = "eatabledesc")
	private String eatableDesc;
	
	@ManyToOne
	@JoinColumn(name = "cap")
	private Cap cap;
	@ManyToOne
	@JoinColumn(name = "scales")
	private Scale scale;
	@ManyToOne
	@JoinColumn(name = "stipe")
	private Stipe stipe;
	@ManyToOne
	@JoinColumn(name = "gills")
	private Gill gill;
	@ManyToOne
	@JoinColumn(name = "size")
	private Size size;
	
	@ManyToOne
	@JoinColumn(name = "skirt")
	private Skirt skirt;
	@ManyToOne
	@JoinColumn(name = "family")
	private Family family;
	@ManyToOne
	@JoinColumn(name = "cap_color")
	private Color colorCap1;
	@ManyToOne
	@JoinColumn(name = "cap_secondary_color")
	private Color colorCap2;
	@ManyToOne
	@JoinColumn(name = "stipe_color")
	private Color colorStipe1;
	@ManyToOne
	@JoinColumn(name = "stipe_secondary_color")
	private Color colorStipe2;
	@ManyToOne
	@JoinColumn(name = "gills_color")
	private Color colorGill;
	
    @ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(
        name = "forest_to_mushroom", 
        joinColumns = { @JoinColumn(name = "mushroom_id") }, 
        inverseJoinColumns = { @JoinColumn(name = "forest_id") }
    )
	private Set<Forest> forests;
    
    @OneToMany(mappedBy = "mushroom", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<PhotoURL> photos;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOtherNames() {
		return otherNames;
	}

	public void setOtherNames(String otherNames) {
		this.otherNames = otherNames;
	}

	public Cap getCap() {
		return cap;
	}

	public void setCap(Cap cap) {
		this.cap = cap;
	}

	public Scale getScale() {
		return scale;
	}

	public void setScale(Scale scale) {
		this.scale = scale;
	}

	public Stipe getStipe() {
		return stipe;
	}

	public void setStipe(Stipe stipe) {
		this.stipe = stipe;
	}

	public Gill getGill() {
		return gill;
	}

	public void setGill(Gill gill) {
		this.gill = gill;
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

	public Skirt getSkirt() {
		return skirt;
	}

	public void setSkirt(Skirt skirt) {
		this.skirt = skirt;
	}

	public boolean getEatable() {
		return eatable;
	}

	public void setEatable(boolean eatable) {
		this.eatable = eatable;
	}

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}

	public Set<Forest> getForests() {
		return forests;
	}

	public void setForests(Set<Forest> forests) {
		this.forests = forests;
	}

	public Set<PhotoURL> getPhotos() {
		return photos;
	}

	public void setPhotos(Set<PhotoURL> photos) {
		this.photos = photos;
	}

	public String isEatableDesc() {
		return eatableDesc;
	}

	public void setEatableDesc(String eatableDesc) {
		this.eatableDesc = eatableDesc;
	}

	public Color getColorCap1() {
		return colorCap1;
	}

	public void setColorCap1(Color colorCap1) {
		this.colorCap1 = colorCap1;
	}

	public Color getColorCap2() {
		return colorCap2;
	}

	public void setColorCap2(Color colorCap2) {
		this.colorCap2 = colorCap2;
	}

	public Color getColorStipe1() {
		return colorStipe1;
	}

	public void setColorStipe1(Color colorStipe1) {
		this.colorStipe1 = colorStipe1;
	}

	public Color getColorStipe2() {
		return colorStipe2;
	}

	public void setColorStipe2(Color colorStipe2) {
		this.colorStipe2 = colorStipe2;
	}

	public Color getColorGill() {
		return colorGill;
	}

	public void setColorGill(Color colorGill) {
		this.colorGill = colorGill;
	}

	public String getEatableDesc() {
		return eatableDesc;
	}
	
	
	
    
}
