package com.foodmarket.app.blogadvertisement;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface BlogAdRepository extends JpaRepository<BlogAdvertisement, Integer> {

}
