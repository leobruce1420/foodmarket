package com.foodmarket.app.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.member.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
	
	//用name跟password搜尋(登入用)
	public Admin findByNameAndPassword(String name, String password);	

}
