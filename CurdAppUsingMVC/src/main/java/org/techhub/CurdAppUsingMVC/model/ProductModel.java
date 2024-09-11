package org.techhub.CurdAppUsingMVC.model;

public class ProductModel {

	private VendorModel vendormodel;
	private CategoryModel catmodel;
	private SubCatModel model;
	private int price;
	private int quantity;
	private String date;
	private int product;
	private int category;
	private int vendor;
	private String prourl;
	private String description;

	public VendorModel getVendormodel() {
		return vendormodel;
	}

	public void setVendormodel(VendorModel vendormodel) {
		this.vendormodel = vendormodel;
	}

	public CategoryModel getCatmodel() {
		return catmodel;
	}

	public void setCatmodel(CategoryModel catmodel) {
		this.catmodel = catmodel;
	}

	public SubCatModel getModel() {
		return model;
	}

	public void setModel(SubCatModel model) {
		this.model = model;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getProduct() {
		return product;
	}

	public void setProduct(int product) {
		this.product = product;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getVendor() {
		return vendor;
	}

	public void setVendor(int vendor) {
		this.vendor = vendor;
	}

	public String getProurl() {
		return prourl;
	}

	public void setProurl(String prourl) {
		this.prourl = prourl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
