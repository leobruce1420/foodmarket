package com.foodmarket.app.wishList.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.product.model.WorkProduct;

@Entity
@Table(name="wishList")
public class WishList {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="wishId")
	private Long wishId;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "CustomerId")
	private Member member;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "productid")
	private WorkProduct product;

	public WishList() {
		// TODO Auto-generated constructor stub
	}

	public Long getWishId() {
		return wishId;
	}

	public void setWishId(Long wishId) {
		this.wishId = wishId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public WorkProduct getProduct() {
		return product;
	}

	public void setProduct(WorkProduct product) {
		this.product = product;
	}
	

}
