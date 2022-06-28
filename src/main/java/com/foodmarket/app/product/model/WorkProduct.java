package com.foodmarket.app.product.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
<<<<<<< HEAD
=======
import com.foodmarket.app.shopcar.entity.ShopCart;
>>>>>>> origin/ShopCart

@Entity
@Table(name="product")//srcmail/resources裡application 的 spring.jpa.hibernate.ddl-auto=update
public class WorkProduct {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="productid")
	private Long productid;
	
	
	// 若沒寫 columnDefinition ， 預設為 varchar(255)
	@Column(name="productname", columnDefinition = "nvarchar(30)")
	private String productname;
	
	@Column(name="productcategory", columnDefinition = "nvarchar(10)")
	private String productcategory;
	
	@Column(name="productprice", columnDefinition = "int")
	private Integer productprice;
	
	@Column(name="productimg", columnDefinition = "varchar(MAX)")
	private String productimg;
	
	
	@Column(name="administrator", columnDefinition="nvarchar(30)") 
	private String administrator;
	
	
	@Column(name="productdesciption", columnDefinition = "nvarchar(200)")
	private String productdesciption;
	
	@Column(name="Inventoryquantity", columnDefinition = "int")
	private Integer inventoryquantity;
	
	@Column(name="takedown", columnDefinition = "nvarchar(5)")
	private String takedown;
	
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") // Spring MVC 用
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="added", columnDefinition="datetime") // 預設是 datetime2
	private Date added;
	
	// 檢查是否有時間，沒有的話依照現在時間產生
	@PrePersist // helper function 在物件轉換成 Persistent 狀態以前，做此方法
	public void onCreate() {
		if(added == null) {
			this.added = new Date();
		}
	}

	public WorkProduct() {
	}

	public Long getProductid() {
		return productid;
	}

	public void setProductid(Long productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductcategory() {
		return productcategory;
	}

	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}

	public Integer getProductprice() {
		return productprice;
	}

	public void setProductprice(Integer productprice) {
		this.productprice = productprice;
	}

	public String getProductimg() {
		return productimg;
	}

	public void setProductimg(String productimg) {
		this.productimg = productimg;
	}

	public String getProductdesciption() {
		return productdesciption;
	}

	public void setProductdesciption(String productdesciption) {
		this.productdesciption = productdesciption;
	}

	public Integer getInventoryquantity() {
		return inventoryquantity;
	}

	public void setInventoryquantity(Integer inventoryquantity) {
		this.inventoryquantity = inventoryquantity;
	}

	public String getTakedown() {
		return takedown;
	}

	

	public void setTakedown(String takedown) {
		this.takedown = takedown;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	public String getAdministrator() {
		return administrator;
	}

	public void setAdministrator(String administrator) {
		this.administrator = administrator;
	}


}
