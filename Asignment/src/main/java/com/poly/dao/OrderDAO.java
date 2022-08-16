package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.model.DonHang;


@Repository
public interface OrderDAO extends JpaRepository<DonHang, Integer> {
	@Query("SELECT o FROM DonHang o WHERE o.trangThai like %?1%")
    List<DonHang> findByStatus(String trangThai);
}
