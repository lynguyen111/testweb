<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa thông tin sinh viên</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 50px;
        }

        .form-container {
            width: 500px;
        }

        .form-title {
            text-align: center;
            font-size: 20px;
            font-weight: normal;
            color: #444;
            margin-bottom: 30px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-group > label {
            width: 140px;
            font-size: 13px;
            font-weight: bold;
            color: #333;
        }

        .input-wrapper {
            flex: 1;
            display: flex;
            align-items: center;
        }

        /* Thêm background mờ xám cho ô nhập bị vô hiệu hóa (giống trên hình xóa) */
        .input-wrapper input[type="text"], 
        .input-wrapper select {
            width: 100%;
            padding: 6px 8px;
            border: 1px solid #ccc;
            outline: none;
            background-color: #eee; /* Màu xám mờ */
            color: #555;
        }

        .radio-label {
            display: flex;
            align-items: center;
            margin-right: 25px;
            font-size: 13px;
            color: #333;
        }

        .radio-label input[type="radio"] {
            margin-right: 5px;
        }

        .button-group {
            display: flex;
            margin-left: 140px;
            gap: 10px;
            margin-top: 10px;
        }

        .button-group button {
            background-color: #337ab7;
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 3px;
            font-size: 13px;
            cursor: pointer;
        }

        .button-group button:hover {
            background-color: #286090;
        }
        
        .button-group a button {
            background-color: #e0e0e0;
            color: #333;
        }

        .button-group a button:hover {
            background-color: #ccc;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <div class="form-title">Xóa sinh viên: </div>
        
        <form action="${pageContext.request.contextPath}/sinhvien/delete" method="POST">
            <input type="hidden" name="maSV" value="${sv.maSV}">
            
            <div class="form-group">
                <label>Mã SV</label>
                <div class="input-wrapper">
                    <input type="text" value="${sv.maSV}" disabled>
                </div>
            </div>
            
            <div class="form-group">
                <label>Họ tên</label>
                <div class="input-wrapper">
                    <input type="text" value="${sv.hoTen}" disabled>
                </div>
            </div>
            
            <div class="form-group">
                <label>Giới tính</label>
                <div class="input-wrapper">
                    <label class="radio-label">
                        <input type="radio" ${sv.gioiTinh == 1 ? 'checked' : ''} disabled> Nam
                    </label>
                    <label class="radio-label">
                        <input type="radio" ${sv.gioiTinh == 0 ? 'checked' : ''} disabled> Nữ
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Khoa</label>
                <div class="input-wrapper">
                    <select disabled>
                        <option value="">-- Chọn khoa --</option>
                        <c:forEach items="${listKhoa}" var="k">
                            <option value="${k.maKhoa}" ${sv.maKhoa == k.maKhoa ? 'selected' : ''}>${k.tenKhoa}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            
            <div class="button-group">
                <button type="submit">Xác nhận</button>
                <a href="${pageContext.request.contextPath}/sinhvien" style="text-decoration:none;"><button type="button">Quay lại</button></a>
            </div>
        </form>
    </div>

</body>
</html>
