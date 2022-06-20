package com.foodmarket.app.product.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.model.WorkProductRepository;

@Service
@Transactional
public class WorkProductService {

	@Autowired
	private WorkProductRepository productDao;

	public void insertProduct(WorkProduct pmsg) {
		productDao.save(pmsg);
	}

	@Transactional
	public WorkProduct getLastest() {
		return productDao.findFirstByOrderByAddedDesc();
	}

	public Page<WorkProduct> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.DESC, "added");

		Page<WorkProduct> page = productDao.findAll(pgb);

		return page;
	}

	public Optional<WorkProduct> findById(Long productid) {
		Optional<WorkProduct> optional = productDao.findById(productid);
//
//		if (optional.isPresent()) {
//			return optional.get();
//
//		}
		return optional;
	}

	public Page<WorkProduct> findByProductcategoryKey(Integer pageNumber, String productcategory) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "added");
		Page<WorkProduct> page = productDao.findByProductcategoryKey(pgb, productcategory);

//		if(optionalcategory.isPresent()) {
//			return optionalcategory.get();
//			
//		}
		return page;
	}

	public Page<WorkProduct> findByName(Integer pageNumber, String productname) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.ASC, "added");

		Page<WorkProduct> page = productDao.findByName(pgb, productname);

		return page;
	}
//	public WorkProduct findById(Long productid) {
//		Optional<WorkProduct> optional = productDao.findById(productid);
//		
//		if(optional.isPresent()) {
//			return optional.get();
//			
//		}
//		return null;
//	}

//	public Page<WorkProduct> findByproductcategory(Integer pageNumber,String productcategory){
//		Pageable pgb = PageRequest.of(pageNumber-1, 10, Sort.Direction.ASC,"added");
//		
//		Page<WorkProduct> page = productDao.findByproductcategory(pgb, productcategory);
//		
//		return page;
//	}
//	public Page<WorkProduct> findByName(Integer pageNumber,String productname){
//		Pageable pgb = PageRequest.of(pageNumber-1, 10, Sort.Direction.ASC,"added");
//		
//		Page<WorkProduct> page = productDao.findByName(pgb,productname);
//		
//		return page;
//	}

//		return new Page<WorkProduct>() {
//			@Override
//			public Predicate toPredicate(Root<WorkProduct> root) {
//				List<Predicate>
//			}
//		
//		}
//	}

	public void deleteById(Long productid) {
		productDao.deleteById(productid);

	}

//	public List<WorkProduct> findByName(String productname) {
//		Session session = sessionfactory.openSession();
//		
//		try {
//			session.beginTransaction();
//			
//			String hql = "FROM Customer AS c WHERE c.CustomerName like '%" + productname + "%'";
//			Query<WorkProduct> query = session.createQuery(hql, WorkProduct.class);
//			
//			session.getTransaction().commit();
//			
//			return query.getResultList();
//		}catch(Exception e) {
//			session.getTransaction().rollback();
//		}finally {
//			session.close();
//		}
//		
//		return null;
//	}

//	public PageInfo list(ProductListDto productListDto) {
//		ProductListQuery productListQuery = new ProductListQuery();
//	}
//	

//	public String encode(String str) {
//		try {
//			MessageDigest md = MessageDigest.getInstance("SHA-1");
//			md.update(str.getBytes("utf-8"));
//			byte[] digest = md.digest();
//			return byteToHexString(digest);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public static String byteToHexString(byte[] bytes) {
//		return String.valueOf(Hex.encodeHex(bytes));
//	}
//
//	public String encoder(byte[] textByte) {
//		final Base64.Encoder encoder = Base64.getEncoder();
//		final String encodedText = encoder.encodeToString(textByte);
//		return encodedText;
//	}
//
//	public byte[] decoder(String encodedText) {
//		final Base64.Decoder decoder = Base64.getDecoder();
//		byte[] decodedArray = decoder.decode(encodedText);
//		return decodedArray;
//	}
//
//	public byte[] inputToBytes(InputStream ins) {
//		byte[] inputArray = null;
//		try {
//			ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
//			byte[] buff = new byte[128];
//			int rc = 0;
//			while ((rc = ins.read(buff, 0, 100)) > 0) {
//				swapStream.write(buff, 0, rc);
//			}
//			inputArray = swapStream.toByteArray();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		return inputArray;
//	}

}
