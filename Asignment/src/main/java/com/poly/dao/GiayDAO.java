package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.model.Giay;

@Repository
public interface GiayDAO extends JpaRepository<Giay, Integer> {
	@Query("SELECT g FROM Giay g WHERE g.tenGiay like %?1%")
    List<Giay> findByName(String tenGiay);
	
	@Query("SELECT g FROM Giay g WHERE g.giamGia like ?1")
    List<Giay> findByDiscount(double tenGiay);
	
	@Query("SELECT g FROM Giay g WHERE g.hangGiay like ?1")
    List<Giay> findByhangGiay(@Param("hangGiay") Integer hangGiay);
	
	@Query("SELECT g FROM Giay g WHERE g.loaiGiay like ?1")
    List<Giay> findByDanhMuc(@Param("loaiGiay") Integer loaiGiay);
}
