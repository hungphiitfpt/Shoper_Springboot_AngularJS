package com.poly.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.model.KhachHang;


@Repository
public interface AccountDAO extends JpaRepository<KhachHang, String>  {

}
