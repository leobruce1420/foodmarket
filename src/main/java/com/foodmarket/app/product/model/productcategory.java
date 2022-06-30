//package com.foodmarket.app.product.model;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;
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
//	
//	
//	
////	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
////	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") // Spring MVC 用
////	@Temporal(TemporalType.TIMESTAMP)
////	@Column(name="added", columnDefinition="datetime") // 預設是 datetime2
////	private Date added;
////	
////	// 檢查是否有時間，沒有的話依照現在時間產生
////	@PrePersist // helper function 在物件轉換成 Persistent 狀態以前，做此方法
////	public void onCreate() {
////		if(added == null) {
////			this.added = new Date();
////		}
////	}
//
//	public productcategory() {
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
