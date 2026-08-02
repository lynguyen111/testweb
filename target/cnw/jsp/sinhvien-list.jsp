<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sinh viên</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 40px;
            color: #333;
        }

        /* Thanh công cụ ở trên cùng */
        .toolbar {
            display: flex;
            justify-content: space-between;
            /* Đẩy 2 phần tử ra 2 góc */
            margin-bottom: 20px;
        }

        .toolbar-left {
            display: flex;
            gap: 10px;
            /* Khoảng cách giữa select và nút Xem */
        }

        .toolbar select {
            padding: 6px;
            border: 1px solid #ccc;
            width: 250px;
            color: #555;
            outline: none;
        }

        .btn {
            background-color: #337ab7;
            color: white;
            border: none;
            padding: 6px 15px;
            border-radius: 3px;
            font-size: 13px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background-color: #286090;
        }

        /* CSS cho bảng dữ liệu */
        table {
            width: 100%;
            border-collapse: collapse;
            /* Xóa khoảng trắng giữa các ô */
            font-size: 13px;
        }

        th {
            text-align: left;
            padding: 12px 10px;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
            color: #333;
        }

        td {
            padding: 12px 10px;
            border-bottom: 1px solid #eee;
            /* Đường gạch chân nhạt giữa các hàng */
        }

        /* Đổi màu nền mờ cho các hàng chẵn để dễ nhìn giống hình */
        tr:nth-child(even) {
            background-color: #fafafa;
        }

        /* Cột hành động sửa/xóa */
        .actions {
            color: #337ab7;
            /* Màu xanh biển */
            font-size: 15px;
            cursor: pointer;
            text-align: center;
        }

        .actions a {
            color: #337ab7;
            text-decoration: none;
        }

        .actions a:hover {
            color: #286090;
        }

        .actions span {
            margin: 0 10px;
        }
    </style>
</head>

<body>

    <div class="toolbar">
        <div class="toolbar-left">
            <form action="${pageContext.request.contextPath}/sinhvien" method="GET" style="display:flex; gap:10px; margin:0; padding:0;">
                <select name="maKhoa">
                    <option value="">-- Chọn khoa --</option>
                    <c:forEach items="${listKhoa}" var="k">
                        <option value="${k.maKhoa}" ${param.maKhoa == k.maKhoa ? 'selected' : ''}>${k.tenKhoa}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn">Xem</button>
            </form>
        </div>
        <a href="${pageContext.request.contextPath}/sinhvien/form" class="btn">Thêm mới</a>
    </div>

    <table>
        <thead>
            <tr>
                <th width="15%">MSV</th>
                <th width="25%">Họ và tên</th>
                <th width="15%">Giới tính</th>
                <th width="30%">Khoa</th>
                <th width="15%"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listSV}" var="sv">
                <tr>
                    <td>${sv.maSV}</td>
                    <td>${sv.hoTen}</td>
                    <td>${sv.gioiTinh == 1 ? 'Nam' : 'Nữ'}</td>
                    <td>${sv.khoa.tenKhoa}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/sinhvien/update?id=${sv.maSV}"><span>Sửa</span></a> |
                        <a href="${pageContext.request.contextPath}/sinhvien/delete?id=${sv.maSV}"><span>Xóa</span></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>

</html>
