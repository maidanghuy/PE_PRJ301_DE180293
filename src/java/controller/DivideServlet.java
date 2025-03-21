/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CardDAO;
import dao.TransactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Card;
import model.Transaction;

/**
 *
 * @author macbookpro
 */
public class DivideServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DivideServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DivideServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        String action = String.valueOf(request.getParameter("action"));
        // String action2 = String.valueOf(request.getParameter("formName"));

        switch (action) {
            case "login" -> {
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
                break;
            }
            default -> {
                String cardNumber = request.getParameter("cardNumber");

                if (cardNumber != null) {
                    TransactionDAO tdao = new TransactionDAO();
                    ArrayList<Transaction> transactions = tdao.getTransactionsByCard(cardNumber);
                    request.setAttribute("transactions", transactions);

                    // Tính tổng theo từng loại giao dịch
                    double totalWithdrawal = tdao.getTotalAmountByType(cardNumber, "Withdrawal");
                    double totalDeposit = tdao.getTotalAmountByType(cardNumber, "Deposit");
                    double totalTransfer = tdao.getTotalAmountByType(cardNumber, "Transfer");

                    // Đặt các giá trị tổng vào request attributes
                    request.setAttribute("totalWithdrawal", totalWithdrawal);
                    request.setAttribute("totalDeposit", totalDeposit);
                    request.setAttribute("totalTransfer", totalTransfer);
                }

                CardDAO cdao = new CardDAO();
                ArrayList<Card> cardList = cdao.getAllCards();
                request.setAttribute("cardList", cardList);
                request.getRequestDispatcher("views/home.jsp").forward(request, response);
                break;
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        String action = String.valueOf(request.getParameter("formName"));

        switch (action) {
            case "view" -> {

            }

            default -> {
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
