package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RestController;

import com.poly.dao.ReportDAO;
import com.poly.model.Report;

@CrossOrigin("*")
@RestController
public class StatisticalAdminController {
	@Autowired
	ReportDAO reportDAO;

	@GetMapping("/rest/thongke/{year}")
	@Transactional(readOnly = true)
	public ResponseEntity<Report> index(@PathVariable("year") Integer year) {
		return ResponseEntity.ok(reportDAO.getReport(year));
	}
}
