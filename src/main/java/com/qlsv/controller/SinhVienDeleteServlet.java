package com.qlsv.controller;

import com.qlsv.dao.SinhVienDAO;
import com.qlsv.dao.KhoaDAO;
import com.qlsv.model.SinhVien;
import com.qlsv.model.Khoa;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/sinhvien/delete")
public class SinhVienDeleteServlet extends HttpServlet {
    private SinhVienDAO sinhVienDAO;
    private KhoaDAO khoaDAO;

    @Override
    public void init() {
        sinhVienDAO = new SinhVienDAO();
        khoaDAO = new KhoaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String maSV = request.getParameter("id");
        if (maSV != null) {
            SinhVien sv = sinhVienDAO.findById(maSV);
            request.setAttribute("sv", sv);
        }
        
        List<Khoa> listKhoa = khoaDAO.getAllKhoa();
        request.setAttribute("listKhoa", listKhoa);

        request.getRequestDispatcher("/jsp/SinhVien-delete.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String maSV = request.getParameter("maSV");
        if (maSV != null) {
            sinhVienDAO.delete(maSV);
        }
        response.sendRedirect(request.getContextPath() + "/sinhvien");
    }
}
