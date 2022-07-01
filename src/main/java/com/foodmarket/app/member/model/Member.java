package com.foodmarket.app.member.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodmarket.app.blog.model.Recipe;
import com.foodmarket.app.shopcar.entity.OrderRecord;
import com.foodmarket.app.wishList.model.WishList;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name="customer")
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="CustomerId")
	private Long customerId;
	
	@Column(name="CustomerName", columnDefinition = "nvarchar(50)", nullable = false)
	private String customerName;
	
	@Column(name="Gender", columnDefinition = "varchar(10)", nullable = false)
	private String gender;
	
	@Column(name="Mobile", columnDefinition = "varchar(20)", nullable = false)
	private String mobile;
	
	@Column(name="Adress1", columnDefinition = "nvarchar(100)")
	private String adress1;
	
	@Column(name="Adress2", columnDefinition = "nvarchar(100)")
	private String adress2;
	
	@Column(name="Adress3", columnDefinition = "nvarchar(100)")
	private String adress3;
	
	@Column(name="Mail", columnDefinition = "varchar(50)", nullable = false)
	private String mail;
	
	@Column(name="Password", columnDefinition = "varchar(50)", nullable = false)
	private String password;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(name="Birthday", columnDefinition="date", nullable = false) 
	private Date birthday;
	
	@Column(name="ImgFile", columnDefinition = "varchar(MAX)")
	private String imgFile;
	
	@Column(name="ImgType", columnDefinition = "varchar(10)")
	private String imgType;
	
	@Column(name="AuthCheck", columnDefinition = "varchar(10)", nullable = false)
	private String authCheck;
	
	@Column(name="AuthToken", columnDefinition = "varchar(50)")
	private String authToken;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") // Spring MVC 用
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="AuthLimit", columnDefinition="datetime") // 預設是 datetime2
	private Date authLimit;
	
	@Column(name="ChangePasswordToken", columnDefinition = "varchar(50)")
	private String changePasswordToken;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") // Spring MVC 用
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ChangePasswordLimit", columnDefinition="datetime") // 預設是 datetime2
	private Date changePasswordLimit;
	
	@Column(name="Banned", columnDefinition = "varchar(10)", nullable = false)
	private String banned;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") // Spring MVC 用
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CreatedDate", columnDefinition="datetime", nullable = false) 
	private Date createdDate;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") // Spring MVC 用
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ModifiedDate", columnDefinition="datetime", nullable = false) 
	private Date modifiedDate;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private Set<Recipe> recipe = new LinkedHashSet<Recipe>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private Set<OrderRecord> orderRecord = new LinkedHashSet<OrderRecord>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private Set<WishList> wishList = new LinkedHashSet<WishList>();



	// 檢查是否有時間，沒有的話依照現在時間產生
		@PrePersist // helper function 在物件轉換成 Persistent 狀態以前，做此方法
		public void onCreate() {
			if(createdDate == null) {
				this.createdDate = new Date();
			}
			if(modifiedDate == null) {
				this.modifiedDate = new Date();
			}
			if(authCheck == null) {
				this.authCheck = "false";
			}
			if(banned == null) {
				this.banned = "false";
			}
		}
	
	public Member() {
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAdress1() {
		return adress1;
	}

	public void setAdress1(String adress1) {
		this.adress1 = adress1;
	}

	public String getAdress2() {
		return adress2;
	}

	public void setAdress2(String adress2) {
		this.adress2 = adress2;
	}

	public String getAdress3() {
		return adress3;
	}

	public void setAdress3(String adress3) {
		this.adress3 = adress3;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getImgFile() {
		return imgFile;
	}

	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgType() {
		return imgType;
	}

	public void setImgType(String imgType) {
		this.imgType = imgType;
	}

	public String getAuthCheck() {
		return authCheck;
	}

	public void setAuthCheck(String authCheck) {
		this.authCheck = authCheck;
	}

	public String getAuthToken() {
		return authToken;
	}

	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}

	public Date getAuthLimit() {
		return authLimit;
	}

	public void setAuthLimit(Date authLimit) {
		this.authLimit = authLimit;
	}

	public String getChangePasswordToken() {
		return changePasswordToken;
	}

	public void setChangePasswordToken(String changePasswordToken) {
		this.changePasswordToken = changePasswordToken;
	}

	public Date getChangePasswordLimit() {
		return changePasswordLimit;
	}

	public void setChangePasswordLimit(Date changePasswordLimit) {
		this.changePasswordLimit = changePasswordLimit;
	}

	public String getBanned() {
		return banned;
	}

	public void setBanned(String banned) {
		this.banned = banned;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public Set<Recipe> getRecipe() {
		return recipe;
	}

	public void setRecipe(Set<Recipe> recipe) {
		this.recipe = recipe;
	}

	public Set<OrderRecord> getOrderRecord() {
		return orderRecord;
	}

	public void setOrderRecord(Set<OrderRecord> orderRecord) {
		this.orderRecord = orderRecord;
	}
	
	

}
