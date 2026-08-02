package com.qlsv.dao;

import com.qlsv.model.Khoa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class KhoaDAO {
    public List<Khoa> getAllKhoa() {
        List<Khoa> list = new ArrayList<>();
        String sql = "SELECT * FROM Khoa";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Khoa khoa = new Khoa();
                khoa.setMaKhoa(rs.getString("ma_khoa"));
                khoa.setTenKhoa(rs.getString("ten_khoa"));
                list.add(khoa);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
