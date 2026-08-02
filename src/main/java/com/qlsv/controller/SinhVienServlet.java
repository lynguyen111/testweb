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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/sinhvien")
public class SinhVienServlet extends HttpServlet {
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
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String maKhoa = request.getParameter("maKhoa");
        List<SinhVien> list;
        if (maKhoa != null && !maKhoa.isEmpty()) {
            list = sinhVienDAO.findByKhoa(maKhoa);
        } else {
            list = sinhVienDAO.getAll();
        }

        List<Khoa> listKhoa = khoaDAO.getAllKhoa();

        request.setAttribute("listSV", list);
        request.setAttribute("listKhoa", listKhoa);
        request.getRequestDispatcher("/jsp/sinhvien-list.jsp").forward(request, response);
    }
}
