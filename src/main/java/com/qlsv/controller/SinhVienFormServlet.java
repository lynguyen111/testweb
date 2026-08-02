package com.qlsv.controller;

import com.qlsv.dao.KhoaDAO;
import com.qlsv.dao.SinhVienDAO;
import com.qlsv.model.Khoa;
import com.qlsv.model.SinhVien;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/sinhvien/form")
public class SinhVienFormServlet extends HttpServlet {
    private SinhVienDAO sinhVienDAO;
    private KhoaDAO khoaDAO;

    @Override
    public void init() {
        sinhVienDAO = new SinhVienDAO();
        khoaDAO = new KhoaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<Khoa> listKhoa = khoaDAO.getAllKhoa();
        request.setAttribute("listKhoa", listKhoa);

        String maSV = request.getParameter("id");
        if (maSV != null) {
            SinhVien sv = sinhVienDAO.findById(maSV);
            request.setAttribute("sv", sv);
        }

        request.getRequestDispatcher("/jsp/sinhvien-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String maSV = request.getParameter("maSV");
        String hoTen = request.getParameter("hoTen");
        int gioiTinh = Integer.parseInt(request.getParameter("gioiTinh"));
        String maKhoa = request.getParameter("maKhoa");

        SinhVien sv = new SinhVien(maSV, hoTen, gioiTinh, maKhoa);

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            sinhVienDAO.insert(sv);
        } else if ("edit".equals(action)) {
            sinhVienDAO.update(sv);
        }

        response.sendRedirect(request.getContextPath() + "/sinhvien");
    }
}
