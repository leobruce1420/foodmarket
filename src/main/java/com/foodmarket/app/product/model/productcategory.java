//package com.foodmarket.app.product.model;
//
//import java.util.Date;
//import java.util.LinkedList;
//import java.util.List;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.PrePersist;
//import javax.persistence.Table;
//import javax.persistence.Temporal;
//import javax.persistence.TemporalType;
//
//import org.springframework.format.annotation.DateTimeFormat;
//
//import com.fasterxml.jackson.annotation.JsonFormat;
//
//
//@Entity
//@Table(name="productcategorys")//srcmail/resources裡application 的 spring.jpa.hibernate.ddl-auto=update
//public class productcategory {
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name="categoryid")
//	private Integer categoryid;
//	
//	
//	
//	
//	@Column(name="productcategoryname", columnDefinition = "nvarchar(10)")
//	private String productcategoryname;
//	
//	@Column(name="takeon", columnDefinition = "nvarchar(10)")
//	private String takeon;
//	
//	private List<WorkProduct> products = new LinkedList<WorkProduct>();
//	
//	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
//	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") // Spring MVC 用
//	@Temporal(TemporalType.TIMESTAMP)
//	@Column(name="added", columnDefinition="datetime") // 預設是 datetime2
//	private Date added;
//	
//	// 檢查是否有時間，沒有的話依照現在時間產生
//	@PrePersist // helper function 在物件轉換成 Persistent 狀態以前，做此方法
//	public void onCreate() {
//		if(added == null) {
//			this.added = new Date();
//		}
//	}
//
//	public productcategory() {
//	}
//
//
//
//
//	public productcategory(Integer categoryid, String productcategoryname, String takeon, List<WorkProduct> products,
//			Date added) {
//		super();
//		this.categoryid = categoryid;
//		this.productcategoryname = productcategoryname;
//		this.takeon = takeon;
//		this.products = products;
//		this.added = added;
//	}
//
//	public List<WorkProduct> getProducts() {
//		return products;
//	}
//
//
//
//
//	public void setProducts(List<WorkProduct> products) {
//		this.products = products;
//	}
//
//
//
//
//	public String getTakeon() {
//		return takeon;
//	}
//
//
//
//
//	public void setTakeon(String takeon) {
//		this.takeon = takeon;
//	}
//
//
//
//
//	public Integer getCategoryid() {
//		return categoryid;
//	}
//
//
//
//
//	public void setCategoryid(Integer categoryid) {
//		this.categoryid = categoryid;
//	}
//
//
//
//
//	public String getProductcategoryname() {
//		return productcategoryname;
//	}
//
//
//
//
//	public void setProductcategoryname(String productcategoryname) {
//		this.productcategoryname = productcategoryname;
//	}
//
//	
//
//}
