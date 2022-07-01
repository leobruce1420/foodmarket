//package com.foodmarket.app.product.model;
//
//import java.util.List;
//
//import javax.transaction.Transactional;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//import org.springframework.stereotype.Repository;
//
//@Repository // 可省略
//public interface ProductcategoryRepository extends JpaRepository<productcategory, Integer> {
//
////	// 用新增時間排序
////	public productcategory findFirstByOrderByAddedDesc();
////
////	// 用Id查詢
////	public List<productcategory> findBycategoryid(Integer categoryid);
////
//////商品種類的上架
////	@Query(value = "select * from productcategory where productcategoryname like %:productcategoryname% and takeon = '上架中'", nativeQuery = true)
////	public List<productcategory> findByProductcategory(@Param("productcategoryname") String productcategoryname);
//////	return productcategoryDao.findByStoreBean(productcategory);
////
//////商品種類名稱不能重複蔬菜類，無分頁 2
////	@Query(value = "select count(*) as count from productcategorys	where productcategoryname = '蔬菜類'", nativeQuery = true)
////	public List<productcategory> findBycategoryname(@Param("takeon") String takeon);
////
////	// 用id刪除
////	@Transactional
////	@Modifying
////	@Query(value = "delete from productcategory where categoryid = :categoryid", nativeQuery = true)
////	public void deleteproductidByIdSql(@Param("categoryid") Integer categoryid);
//
//}