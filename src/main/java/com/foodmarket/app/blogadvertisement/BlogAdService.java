package com.foodmarket.app.blogadvertisement;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
}
