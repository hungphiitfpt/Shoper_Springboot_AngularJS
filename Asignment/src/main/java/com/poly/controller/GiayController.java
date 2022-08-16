package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.poly.dao.GiayDAO;
import com.poly.model.Giay;

@CrossOrigin("*")
@RestController
public class GiayController {
	@Autowired
	private GiayDAO giayDAO;

	@GetMapping("/rest/giay")
	public ResponseEntity<List<Giay>> getAll(Model model) {
		return ResponseEntity.ok(giayDAO.findAll());
	}
	@GetMapping("/rest/searchgiay/{name}")
	public ResponseEntity<List<Giay>> get(@PathVariable("name") String name) {
		return ResponseEntity.ok(giayDAO.findByName(name));
	}

	@GetMapping("/rest/giay/{id}")
	public ResponseEntity<Giay> getOne(@PathVariable("id") Integer id) {
		if (!giayDAO.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(giayDAO.findById(id).get());
	}
	@GetMapping("/rest/giay/giamgia/{hangGiay}")
	public ResponseEntity<List<Giay>> getProductByDiscount(@PathVariable("hangGiay") Integer hangGiay) {
		
		return ResponseEntity.ok(giayDAO.findByhangGiay(hangGiay));
	}
	// Insert
	@PostMapping("/rest/giay")
	public ResponseEntity<Giay> post(@RequestBody Giay giay) {
		if (giayDAO.existsById(giay.getMaGiay())) {
			return ResponseEntity.badRequest().build();
		}
		giayDAO.save(giay);
		return ResponseEntity.ok(giay);
	}

	// Update
	@PutMapping("/rest/giay/{id}")
	public ResponseEntity<Giay> put(@PathVariable("id") Integer id, @RequestBody Giay giay) {
		if (!giayDAO.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		giayDAO.save(giay);
		return ResponseEntity.ok(giay);
	}

	@DeleteMapping("/rest/giay/{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") Integer id) {
		if (!giayDAO.existsById(id)) {
			return ResponseEntity.notFound().build();
		}
		giayDAO.deleteById(id);
		return ResponseEntity.ok().build();
	}
}
