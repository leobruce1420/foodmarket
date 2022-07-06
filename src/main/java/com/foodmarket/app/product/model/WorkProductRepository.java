package com.foodmarket.app.product.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

//import com.foodmarket.app.product.dto.ProductcategoryDto;

@Repository // 可省略
public interface WorkProductRepository extends JpaRepository<WorkProduct, Long> {

	// 用新增時間排序
	public WorkProduct findFirstByOrderByAddedDesc();

	// 用Id查詢
	public WorkProduct findByproductid(Long productid);

	// 用productcategory種類查詢
//		public WorkProduct findByProductcategory (String productcategory);
	// 用商品名稱關鍵字查詢，有分頁
				@Query(value = "select * from product where productcategory like %:productcategory%", nativeQuery=true)
				public Page<WorkProduct> findByProductcategorypage(@Param("productcategory")String productcategory, Pageable pgb);

	// 用商品名稱關鍵字查詢，無分頁 0706
	@Query(value = "select * from product where categoryid =:categoryid  and takedown = '上架中'", nativeQuery = true)
	public List<WorkProduct> findByProductcategoryKey(@Param("categoryid") Integer  categoryid);

//	// 用商品名稱關鍵字查詢，無分頁 舊0706
//	@Query(value = "select * from product where productcategory like %:productcategory% and takedown = '上架中'", nativeQuery = true)
//	public List<WorkProduct> findByProductcategoryKey(@Param("productcategory") String productcategory);

	// 用商品名稱關鍵字查詢，有分頁
		@Query(value = "select * from product where productname like %:productname% ", nativeQuery=true)
		public Page<WorkProduct> findByNamePage(@Param("productname")String productname,Pageable pgb);

	// 用商品名稱關鍵字查詢，無分頁
	@Query(value = "select * from product where productname like %:productname% and takedown = '上架中'", nativeQuery = true)
	public List<WorkProduct> findByName(@Param("productname") String productname);
	
	// 用商品上下架關鍵字查詢，有分頁
	@Query(value = "select * from product where takedown = '上架中'", nativeQuery=true)
	public Page<WorkProduct> findByTakeDown(@Param("takedown")String takedown,Pageable pgb);
	
	// 用商品上下架關鍵字查詢，無分頁
	@Query(value = "select * from product where takedown = '上架中'", nativeQuery = true)
	public List<WorkProduct> findByOn(@Param("takedown") String takedown);
	
	// 用商品上下架關鍵字查詢商品資料庫商品種類ID與商品種類資料庫的種類ID，無分頁 1
//	@Query(value = "select * from (select * from product  where takedown = '上架中') as product  inner join productcategorys  on product.productcategoryid = productcategorys.categoryid ", nativeQuery = true)
//	public List<WorkProduct> findByOn(@Param("takedown") String takedown);

	// 用商品字查詢商品資料庫商品種類ID與商品種類資料庫的種類ID，有分頁 2
	@Query(value = "select *from product p 	inner join productcategorys pg  on p.productcategoryid = pg.categoryid", nativeQuery = true)
	public Page<WorkProduct> findByproductBean_productCategoryBean(Pageable pgb);

	// 用商品字查詢商品資料庫商品種類ID與商品種類資料庫的種類ID，有分頁 2
//	@Query(value = "select *from product p 	inner join productcategorys pg  on p.productcategoryid = pg.categoryid", nativeQuery = true,
//	countQuery = "select count(productid) from product p inner join productcategorys pg  on p.productcategoryid = pg.categoryid ")
//	public Page<WorkProduct> findByproductBean_productCategoryBean(Pageable pgb);

	// 列出商品與種類類似ID的商品種類，有分頁
//	@Query(value = "select productcategoryname from product p 	inner join productcategorys pg  on p.productcategoryid = pg.categoryid", nativeQuery = true)
//	public Page<WorkProduct> findByproductBean_productCategoryBeanname(@Param("productcategoryid") Integer productcategoryid,Pageable pgb);

	// 商品種類名稱不能重複，無分頁 2
	@Query(value = "select count(*) as count from productcategorys	where productcategoryname = '蔬菜類'", nativeQuery = true)
	public List<WorkProduct> findBycategoryname(@Param("takedown") String takedown);

	// 用id刪除
	@Transactional
	@Modifying
	@Query(value = "delete from product where productid = :productid", nativeQuery = true)
	public void deleteproductidByIdSql(@Param("productid") Long productid);

//	Page<WorkProduct> findByproductcategoryBean_categoryid(Pageable pageable, Integer categoryid);
//	
//	public Optional<WorkProduct> findByproductcategoryBean_categoryid(Integer categoryid);
//
//	public Page<WorkProduct> findproductBycategoryid(Integer categoryid,Pageable pageable);


}	