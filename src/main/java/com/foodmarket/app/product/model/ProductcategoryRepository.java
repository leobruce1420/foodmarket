package com.foodmarket.app.product.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository // 可省略
public interface ProductcategoryRepository extends JpaRepository<productcategoryBean, Integer> {

	// 用新增時間排序
	public List<productcategoryBean> findFirstByOrderByCategoryidAsc();

	// 用Id查詢
	public List<productcategoryBean> findBycategoryid(Integer categoryid);

//商品種類的上架
	@Query(value = "select * from productcategorys where productcategoryname like %:productcategoryname% and takeon = '上架中'", nativeQuery = true)
	public List<productcategoryBean> findByProductcategoryname(@Param("productcategoryname") String productcategoryname);
//	return productcategoryDao.findByStoreBean(productcategory);

	//商品種類的上架 無分頁
	@Query(value = "select * from productcategorys where  takeon = '上架中'", nativeQuery = true)
	public List<productcategoryBean> findByProductCategoryTakeon(@Param("takeon") String takeon);
//	return productcategoryDao.findByStoreBean(productcategory);

	//商品種類的上架 分頁
	@Query(value = "select * from productcategorys where  takeon = '上架中'", nativeQuery = true)
	public Page<productcategoryBean> findByProductCategoryTakeonPage(@Param("takeon") String takeon,Pageable pgb);
//	return productcategoryDao.findByStoreBean(productcategory);

//商品種類名稱不能重複蔬菜類，無分頁 2
	@Query(value = "select count(*) as count from productcategorys	where productcategoryname = '蔬菜類'", nativeQuery = true)
	public List<productcategoryBean> findBycategoryname(@Param("takeon") String takeon);

	// 用商品總類名稱關鍵字查詢，有分頁
			@Query(value = "select * from product where productcategoryname like %:productcategoryname% ", nativeQuery=true)
			public Page<productcategoryBean> findByproductcategoryNamePage(@Param("productcategoryname")String productcategoryname,Pageable pgb);
	
	// 用id刪除
	@Transactional
	@Modifying
	@Query(value = "delete from productcategory where categoryid = :categoryid", nativeQuery = true)
	public void deleteproductidByIdSql(@Param("categoryid") Integer categoryid);

}