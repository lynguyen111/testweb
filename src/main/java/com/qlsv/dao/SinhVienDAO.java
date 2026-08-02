package com.qlsv.dao;

import com.qlsv.model.Khoa;
import com.qlsv.model.SinhVien;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SinhVienDAO {

    public List<SinhVien> getAll() {
        List<SinhVien> list = new ArrayList<>();
        String sql = "SELECT s.*, k.ten_khoa FROM SinhVien s LEFT JOIN Khoa k ON s.ma_khoa = k.ma_khoa";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                SinhVien sv = new SinhVien();
                sv.setMaSV(rs.getString("ma_sv"));
                sv.setHoTen(rs.getString("ho_ten"));
                sv.setGioiTinh(rs.getInt("gioi_tinh"));
                sv.setMaKhoa(rs.getString("ma_khoa"));
                
                Khoa khoa = new Khoa();
                khoa.setMaKhoa(rs.getString("ma_khoa"));
                khoa.setTenKhoa(rs.getString("ten_khoa"));
                sv.setKhoa(khoa);
                
                list.add(sv);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<SinhVien> findByKhoa(String maKhoa) {
        List<SinhVien> list = new ArrayList<>();
        String sql = "SELECT s.*, k.ten_khoa FROM SinhVien s LEFT JOIN Khoa k ON s.ma_khoa = k.ma_khoa WHERE s.ma_khoa = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maKhoa);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    SinhVien sv = new SinhVien();
                    sv.setMaSV(rs.getString("ma_sv"));
                    sv.setHoTen(rs.getString("ho_ten"));
                    sv.setGioiTinh(rs.getInt("gioi_tinh"));
                    sv.setMaKhoa(rs.getString("ma_khoa"));
                    
                    Khoa khoa = new Khoa();
                    khoa.setMaKhoa(rs.getString("ma_khoa"));
                    khoa.setTenKhoa(rs.getString("ten_khoa"));
                    sv.setKhoa(khoa);
                    
                    list.add(sv);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insert(SinhVien sv) {
        String sql = "INSERT INTO SinhVien(ma_sv, ho_ten, gioi_tinh, ma_khoa) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, sv.getMaSV());
            ps.setString(2, sv.getHoTen());
            ps.setInt(3, sv.getGioiTinh());
            ps.setString(4, sv.getMaKhoa());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public SinhVien findById(String maSV) {
        String sql = "SELECT * FROM SinhVien WHERE ma_sv = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maSV);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    SinhVien sv = new SinhVien();
                    sv.setMaSV(rs.getString("ma_sv"));
                    sv.setHoTen(rs.getString("ho_ten"));
                    sv.setGioiTinh(rs.getInt("gioi_tinh"));
                    sv.setMaKhoa(rs.getString("ma_khoa"));
                    return sv;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean update(SinhVien sv) {
        String sql = "UPDATE SinhVien SET ho_ten=?, gioi_tinh=?, ma_khoa=? WHERE ma_sv=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, sv.getHoTen());
            ps.setInt(2, sv.getGioiTinh());
            ps.setString(3, sv.getMaKhoa());
            ps.setString(4, sv.getMaSV());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(String maSV) {
        String sql = "DELETE FROM SinhVien WHERE ma_sv=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maSV);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
