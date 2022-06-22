package com.foodmarket.app.blogadvertisement;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

@Entity@Table(name="blog_advertisement")
@Component
public class BlogAdvertisement {

	
	@Id@Column(name="blog_activity_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer blogAdId;
	
	@Column(name="blog_activity_name")
	private String blogAdName;
	
	@Column(name="picture")
	private String picture;
	
	@Temporal(TemporalType.DATE)
	@Column(name="begin_date")
	private Date beginDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name="end_date")
	private Date endDate;
	
	@Column(name="remark")
	private String remark;
	
	
	@Column(name="recipeId")
	private String recipeId;
	
	
	public BlogAdvertisement() {
	}

	
	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Integer getBlogAdId() {
		return blogAdId;
	}


	public void setBlogAdId(Integer blogAdId) {
		this.blogAdId = blogAdId;
	}


	public String getBlogAdName() {
		return blogAdName;
	}


	public void setBlogAdName(String blogAdName) {
		this.blogAdName = blogAdName;
	}


	public Date getBeginDate() {
		return beginDate;
	}


	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getRecipeId() {
		return recipeId;
	}


	public void setRecipeId(String recipeId) {
		this.recipeId = recipeId;
	}


	public BlogAdvertisement(String blogAdName, String picture, Date beginDate, Date endDate, String remark,
			String recipeId) {
		super();
		this.blogAdName = blogAdName;
		this.picture = picture;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.remark = remark;
		this.recipeId = recipeId;
	}


}
