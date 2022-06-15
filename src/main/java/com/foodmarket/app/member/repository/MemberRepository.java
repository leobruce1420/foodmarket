package com.foodmarket.app.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.member.model.Member;



@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
	
	//用mail跟password搜尋(登入用)
	public Member findByMailAndPassword(String mail, String password);

}
