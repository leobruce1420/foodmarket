package com.foodmarket.app.shopadvertisement;

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
	
	public List<ShopAdvertisement> findByBoard() {
		List<ShopAdvertisement> List = sDao.findShopAdByBoard();
		return List;
		
	}
	
	public Page<ShopAdvertisement> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3 );
		
		Page<ShopAdvertisement> page = sDao.findAll(pgb);
		
		return page;
		
	}
}
