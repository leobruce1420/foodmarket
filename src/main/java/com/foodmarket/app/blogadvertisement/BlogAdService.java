package com.foodmarket.app.blogadvertisement;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BlogAdService {

	@Autowired
	private BlogAdRepository bDao;
	
	public BlogAdvertisement insertAd(BlogAdvertisement bBean) {
		return bDao.save(bBean);
	}
	
	public List<BlogAdvertisement> getAllAds() {
		return bDao.findAll();
	}
	
	public BlogAdvertisement findById(Integer id) {
		Optional<BlogAdvertisement> optinal = bDao.findById(id); 
		if(optinal.isPresent()) {
			BlogAdvertisement ad = optinal.get();
			return ad;
		}
		return null;
	}
	
	public void deleteById(Integer id) {
		bDao.deleteById(id);
	}
	
	public List<BlogAdvertisement> findByBoard() {
		List<BlogAdvertisement> List = bDao.findShopAdByBoard();
		return List;
		
	}
	
	public Page<BlogAdvertisement> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3 );
		
		Page<BlogAdvertisement> page = bDao.findAll(pgb);
		
		return page;
		
	}
}
