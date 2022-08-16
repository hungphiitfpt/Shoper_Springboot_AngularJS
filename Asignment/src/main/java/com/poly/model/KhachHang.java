package com.poly.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Data
@Entity
@Table(name="khachhangs")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class KhachHang implements Serializable {
	@Id
	@Column(name="TaiKhoan")
	private String taiKhoan;

	@Column(name="MatKhau")
	private String matKhau;
	
	@Column(name="TenKhachHang")
	private String tenKhachHang;

	@Column(name="SoDienThoai")
	private String soDienThoai;
	
	@Column(name="DiaChi")
	private String diaChi;

	//bi-directional many-to-one association to DonHang
	@JsonIgnore
	@OneToMany
	@JoinColumn(name = "maDonHang")
	private List<DonHang> donhangs;
	
	@ManyToOne
	@JoinColumn(name = "maQuyen")
	private Quyen quyen;	
}
