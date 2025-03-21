<%-- Document : home Created on : Mar 21, 2025, 10:14:25 AM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý thẻ ATM</title>
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
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            }

            .page-header {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 30px;
                position: relative;
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

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                margin: 25px 0;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
                background-color: white;
                border-radius: 10px;
                overflow: hidden;
            }

            th,
            td {
                padding: 15px 20px;
                text-align: left;
                border-bottom: 1px solid #e5e7eb;
            }

            th {
                background-color: #2563eb;
                color: white;
                font-weight: 500;
                text-transform: uppercase;
                font-size: 14px;
                letter-spacing: 1px;
            }

            tr:last-child td {
                border-bottom: none;
            }

            tr:hover {
                background-color: #f1f5f9;
            }

            .blocked {
                color: #ef4444;
                font-weight: 600;
                background-color: #fee2e2;
                padding: 6px 10px;
                border-radius: 30px;
                font-size: 14px;
                display: inline-block;
            }

            .active {
                color: #10b981;
                font-weight: 600;
                background-color: #ecfdf5;
                padding: 6px 10px;
                border-radius: 30px;
                font-size: 14px;
                display: inline-block;
            }

            .btn {
                background-color: #3b82f6;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 6px;
                cursor: pointer;
                margin-right: 10px;
                font-size: 14px;
                font-weight: 500;
                transition: all 0.3s;
                display: inline-flex;
                align-items: center;
            }

            .btn:hover {
                background-color: #2563eb;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(37, 99, 235, 0.2);
            }

            .btn-view {
                background-color: #6366f1;
            }

            .btn-add {
                background-color: #0ea5e9;
            }

            .alert {
                padding: 15px 20px;
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

            .text-center {
                text-align: center;
            }

            form {
                display: inline;
            }

            .actions {
                display: flex;
                gap: 8px;
            }

            .empty-state {
                text-align: center;
                padding: 30px;
                background-color: #f1f5f9;
                border-radius: 10px;
                margin: 30px 0;
                color: #64748b;
                font-size: 16px;
                font-weight: 500;
            }

            .summary-table {
                margin-top: 25px;
            }

            .summary-table th {
                background-color: #4f46e5;
            }

            .withdrawal {
                color: #e11d48;
                font-weight: 500;
            }

            .deposit {
                color: #059669;
                font-weight: 500;
            }

            .transfer {
                color: #6366f1;
                font-weight: 500;
            }

            .amount-cell {
                text-align: right;
                font-family: 'Roboto Mono', monospace;
            }

            /* Responsive */
            @media (max-width: 768px) {
                body {
                    padding: 15px;
                }

                table {
                    display: block;
                    overflow-x: auto;
                    white-space: nowrap;
                }

                .btn {
                    padding: 8px 12px;
                    font-size: 13px;
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
            <c:if test="${not empty sessionScope.error}">
                <div class="alert alert-danger text-center">${sessionScope.error}</div>
                <c:remove var="error" scope="session" />
            </c:if>

            <c:if test="${not empty sessionScope.message}">
                <div class="alert alert-success text-center">${sessionScope.message}</div>
                <c:remove var="message" scope="session" />
            </c:if>

            <div class="page-header">
                <h2>Danh sách thẻ ATM</h2>
            </div>

            <!-- Lấy danh sách thẻ từ Servlet -->
            <table>
                <tr>
                    <th>Số thẻ</th>
                    <th>Chủ thẻ</th>
                    <th>Ngày hết hạn</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                <c:forEach var="card" items="${cardList}">
                    <tr>
                        <td>${card.cardNumber}</td>
                        <td>${card.customerName}</td>
                        <td>${card.expirationDate}</td>
                        <td>
                            <span class="${card.isBlocked ? 'blocked' : 'active'}">
                                ${card.isBlocked ? "Bị khóa" : "Hoạt động"}
                            </span>
                        </td>
                        <td class="actions">
                            <!-- Xem giao dịch -->
                            <form action="DivideServlet" method="GET">
                                <input type="hidden" name="action" value="viewTransaction">
                                <input type="hidden" name="cardNumber" value="${card.cardNumber}">
                                <input type="submit" value="Xem giao dịch" class="btn btn-view">
                            </form>

                            <!-- Thêm giao dịch -->
                            <form action="TransactionServlet" method="GET">
                                <input type="hidden" name="cardNumber" value="${card.cardNumber}">
                                <input type="submit" value="Thêm giao dịch" class="btn btn-add">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <!-- Hiển thị danh sách giao dịch -->
            <c:if test="${transactions != null}">
                <c:choose>
                    <c:when test="${not empty transactions}">
                        <h2>Danh sách giao dịch của thẻ: ${param.cardNumber}</h2>
                        <table>
                            <tr>
                                <th>ID</th>
                                <th>Số tiền</th>
                                <th>Loại giao dịch</th>
                                <th>Ngày giao dịch</th>
                            </tr>
                            <c:forEach var="transaction" items="${transactions}">
                                <tr>
                                    <td>${transaction.id}</td>
                                    <td class="amount-cell">${transaction.amount}</td>
                                    <td class="${transaction.transactionType.toLowerCase()}">
                                        ${transaction.transactionType}</td>
                                    <td>${transaction.transactionDate}</td>
                                </tr>
                            </c:forEach>
                        </table>

                        <!-- Tổng giao dịch theo loại -->
                        <h2>Tổng giao dịch theo loại</h2>
                        <table class="summary-table">
                            <tr>
                                <th>Loại giao dịch</th>
                                <th>Tổng tiền</th>
                            </tr>
                            <tr>
                                <td class="withdrawal">Rút tiền (Withdrawal)</td>
                                <td class="amount-cell">${totalWithdrawal}</td>
                            </tr>
                            <tr>
                                <td class="deposit">Nạp tiền (Deposit)</td>
                                <td class="amount-cell">${totalDeposit}</td>
                            </tr>
                            <tr>
                                <td class="transfer">Chuyển khoản (Transfer)</td>
                                <td class="amount-cell">${totalTransfer}</td>
                            </tr>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            Thẻ ${param.cardNumber} chưa thực hiện giao dịch nào.
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
    </body>
</html>