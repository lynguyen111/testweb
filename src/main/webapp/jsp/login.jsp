<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Đăng Nhập</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 50px;
        }

        .login-container {
            width: 450px;
        }

        .login-title {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #555;
            margin-bottom: 25px;
        }

        .form-group {
            display: flex;
            align-items: center; /* Căn giữa theo chiều dọc */
            margin-bottom: 15px;
        }

        .form-group label {
            width: 140px; /* Chiều rộng cố định cho nhãn để các ô input thẳng hàng */
            font-size: 13px;
            font-weight: bold;
            color: #333;
        }

        .form-group input {
            flex: 1; /* Ô input chiếm phần còn lại của hàng */
            padding: 5px 8px;
            border: 1px solid #ccc;
            outline: none;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.05); /* Đổ bóng mờ bên trong ô giống hình */
        }

        .form-group input:focus {
            border-color: #66afe9;
        }

        .button-group {
            display: flex;
            margin-left: 140px; /* Đẩy các nút sang phải để thẳng hàng với ô input */
            gap: 10px; /* Khoảng cách giữa 2 nút */
            margin-top: 5px;
        }

        .button-group button {
            background-color: #337ab7; /* Màu xanh biển đậm */
            color: white;
            border: none;
            padding: 7px 18px;
            border-radius: 3px;
            font-size: 13px;
            cursor: pointer;
        }

        .button-group button:hover {
            background-color: #286090;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="login-title">Đăng nhập hệ thống</div>
        <c:if test="${not empty error}">
            <div style="color: red; text-align: center; margin-bottom: 15px; font-size: 13px;">${error}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label>Tên đăng nhập</label>
                <input type="text" name="username" required>
            </div>
            
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" required>
            </div>
            
            <div class="button-group">
                <button type="submit">Đăng nhập</button>
                <button type="button" onclick="document.querySelector('form').reset();">Hủy</button>
            </div>
        </form>
    </div>

</body>
</html>
