<%-- Document : transaction Created on : Mar 21, 2025, 1:02:47 PM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm giao dịch</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
              rel="stylesheet">
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Roboto', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
            }

            body {
                background-color: #f8f9fa;
                margin: 0;
                padding: 30px;
                color: #343a40;
                line-height: 1.6;
            }

            .container {
                max-width: 700px;
                margin: 0 auto;
                padding: 30px;
                background-color: #ffffff;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            }

            .page-header {
                text-align: center;
                margin-bottom: 30px;
            }

            h2 {
                color: #1e3a8a;
                margin: 25px 0;
                text-align: center;
                padding-bottom: 15px;
                border-bottom: 3px solid #3b82f6;
                font-weight: 700;
                letter-spacing: 0.5px;
            }

            form {
                max-width: 500px;
                margin: 0 auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            }

            .form-group {
                margin-bottom: 25px;
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: 600;
                color: #1e3a8a;
                font-size: 16px;
            }

            input[type="number"],
            select {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                font-size: 16px;
                transition: all 0.3s;
                background-color: #f9fafb;
                color: #4b5563;
            }

            input[type="number"]:focus,
            select:focus {
                outline: none;
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.25);
                background-color: #ffffff;
            }

            select {
                appearance: none;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%234b5563' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-position: right 15px center;
                padding-right: 40px;
            }

            .btn {
                display: inline-block;
                padding: 12px 24px;
                background-color: #3b82f6;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                text-align: center;
                width: 100%;
            }

            .btn:hover {
                background-color: #2563eb;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
            }

            .btn-back {
                display: inline-block;
                padding: 12px 24px;
                background-color: transparent;
                color: #3b82f6;
                border: 2px solid #3b82f6;
                border-radius: 8px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                text-align: center;
                text-decoration: none;
                margin-top: 20px;
                width: 100%;
            }

            .btn-back:hover {
                background-color: rgba(59, 130, 246, 0.1);
                color: #2563eb;
            }

            .alert {
                padding: 16px 20px;
                margin-bottom: 25px;
                border-radius: 8px;
                font-weight: 500;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .alert-danger {
                background-color: #fee2e2;
                color: #b91c1c;
                border: 1px solid #fecaca;
            }

            .alert-success {
                background-color: #d1fae5;
                color: #065f46;
                border: 1px solid #a7f3d0;
            }

            @media (max-width: 576px) {
                body {
                    padding: 15px;
                }

                .container {
                    padding: 20px;
                }

                form {
                    padding: 20px;
                }

                input[type="number"],
                select {
                    padding: 10px;
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
            <c:if test="${not empty sessionScope.error}">
                <div class="alert alert-danger">${sessionScope.error}</div>
                <c:remove var="error" scope="session" />
            </c:if>

            <c:if test="${not empty sessionScope.message}">
                <div class="alert alert-success">${sessionScope.message}</div>
                <c:remove var="message" scope="session" />
            </c:if>

            <div class="page-header">
                <h2>Thêm giao dịch</h2>
            </div>

            <form action="TransactionServlet" method="POST">
                <input type="hidden" name="cardNumber" value="${param.cardNumber}">

                <div class="form-group">
                    <label for="amount">Số tiền:</label>
                    <input type="number" name="amount" id="amount" required>
                </div>

                <div class="form-group">
                    <label for="transactionType">Loại giao dịch:</label>
                    <select name="transactionType" id="transactionType">
                        <option value="Withdrawal">Rút tiền</option>
                        <option value="Deposit">Nạp tiền</option>
                        <option value="Transfer">Chuyển khoản</option>
                    </select>
                </div>

                <button type="submit" class="btn">Thêm giao dịch</button>
            </form>

            <a href="DivideServlet" class="btn-back">Quay lại trang chủ</a>
        </div>
    </body>

</html>