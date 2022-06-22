package com.foodmarket.app.shopadvertisement;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ShopAdService {

	@Autowired
	private ShopAdRepository sDao;
	
	public ShopAdvertisement insertAd(ShopAdvertisement sBean) {
		return sDao.save(sBean);
	}
	
	public List<ShopAdvertisement> getAllAds(){
		return sDao.findAll();
	}
	
	public ShopAdvertisement findById(Integer id) {
		Optional<ShopAdvertisement> optinal = sDao.findById(id); 
		if(optinal.isPresent()) {
			ShopAdvertisement ad = optinal.get();
			return ad;
		}
		return null;
	}
	public void deleteById(Integer id) {
		sDao.deleteById(id);
	}
}
