package com.foodmarket.app.member.repository;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.foodmarket.app.member.model.Member;


@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
	
	//用mail跟password搜尋(登入用)
	public Member findByMailAndPassword(String mail, String password);
	
	//用Id查詢
	public Member findByCustomerId(Long customerId);
	
	//用mail查詢
	public Member findByMail(String mail);
	
	//用AuthToken查詢
	public Member findByAuthToken(String token);
	
	//用AuthToken查詢
	public Member findByChangePasswordToken(String token);
	
	//用姓名查詢，有分頁
	@Query(value = "select * from customer where CustomerName like %:name%", nativeQuery=true)
	public Page<Member> findByName(Pageable pgb, @Param("name")String name);
	
	//用id刪除
	@Transactional
	@Modifying
	@Query(value = "delete from customer where CustomerId = :id", nativeQuery=true)
	public void deleteCustomerByIdSql(@Param("id")Long id);
	
	

}
