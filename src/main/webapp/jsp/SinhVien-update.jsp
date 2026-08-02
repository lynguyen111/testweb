<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa thông tin sinh viên</title>
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
            font-weight: normal; /* Không in đậm như hình */
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

        .input-wrapper input[type="text"] {
            width: 100%;
            padding: 6px 8px;
            border: 1px solid #ccc;
            outline: none;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.05);
        }

        .input-wrapper input[type="text"]:focus,
        .input-wrapper select:focus {
            border-color: #66afe9;
        }

        .input-wrapper select {
            width: 100%;
            padding: 6px 8px;
            border: 1px solid #ccc;
            outline: none;
        }

        /* Thêm background xám cho các trường bị vô hiệu hóa (không được phép chỉnh sửa) */
        .input-wrapper input[type="text"]:disabled,
        .input-wrapper select:disabled {
            background-color: #eee;
            color: #555;
        }

        .radio-label {
            display: flex;
            align-items: center;
            margin-right: 25px;
            font-size: 13px;
            color: #333;
            cursor: pointer;
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
        <div class="form-title">Sửa sinh viên: <!-- Không điền tên như yêu cầu --></div>
        
        <form action="${pageContext.request.contextPath}/sinhvien/update" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="maSV" value="${sv.maSV}">
            
            <div class="form-group">
                <label>Mã SV</label>
                <div class="input-wrapper">
                    <input type="text" value="${sv.maSV}" disabled> <!-- Bị khóa -->
                </div>
            </div>
            
            <div class="form-group">
                <label>Họ tên</label>
                <div class="input-wrapper">
                    <input type="text" name="hoTen" value="${sv.hoTen}" required>
                </div>
            </div>
            
            <div class="form-group">
                <label>Giới tính</label>
                <div class="input-wrapper">
                    <label class="radio-label">
                        <input type="radio" name="gioiTinh" value="1" ${sv.gioiTinh == 1 ? 'checked' : ''}> Nam
                    </label>
                    <label class="radio-label">
                        <input type="radio" name="gioiTinh" value="0" ${sv.gioiTinh == 0 ? 'checked' : ''}> Nữ
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Khoa</label>
                <div class="input-wrapper">
                    <select name="maKhoa" required>
                        <option value="">-- Chọn khoa --</option>
                        <c:forEach items="${listKhoa}" var="k">
                            <option value="${k.maKhoa}" ${sv.maKhoa == k.maKhoa ? 'selected' : ''}>${k.tenKhoa}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            
            <div class="button-group">
                <button type="submit">Lưu lại</button> <!-- Nút Lưu lại thay vì Thêm mới -->
                <a href="${pageContext.request.contextPath}/sinhvien" style="text-decoration:none;"><button type="button">Quay lại</button></a>
            </div>
        </form>
    </div>

</body>
</html>
