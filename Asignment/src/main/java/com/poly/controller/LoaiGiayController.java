package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.poly.dao.LoaiGiayDAO;
import com.poly.model.LoaiGiay;


@CrossOrigin("*")
@RestController
public class LoaiGiayController {
	@Autowired
	private LoaiGiayDAO loaGiayDAO;

	@GetMapping("/rest/loaigiay")
	public ResponseEntity<List<LoaiGiay>> getAll(Model model) {
		return ResponseEntity.ok(loaGiayDAO.findAll());
	}

	@GetMapping("/rest/loaigiay/{id}")
	public ResponseEntity<LoaiGiay> getOne(@PathVariable("id") Integer id) {
		if (!loaGiayDAO.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(loaGiayDAO.findById(id).get());
	}
}
