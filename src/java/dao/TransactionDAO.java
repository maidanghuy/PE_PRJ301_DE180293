/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Transaction;

/**
 *
 * @author macbookpro
 */
public class TransactionDAO {

    Connection conn;

    public TransactionDAO() {
        ConnectDB connectDB = new ConnectDB();
        try {
            conn = connectDB.getConnection();
        } catch (Exception e) {
            System.out.println(e);

        }
    }

    public double getTotalAmountByType(String cardNumber, String transactionType) {
        double total = 0;
        String query = "SELECT SUM(amount) FROM Transactions WHERE card_number = ? AND transaction_type = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cardNumber);
            ps.setString(2, transactionType);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public boolean insertTransaction(Transaction transaction) {
        String query = "INSERT INTO Transactions (card_number, transaction_date, amount, transaction_type) VALUES (?, GETDATE(), ?, ?)";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, transaction.getCardNumber());
            ps.setDouble(2, transaction.getAmount());
            ps.setString(3, transaction.getTransactionType());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<Transaction> getTransactionsByCard(String cardNumber) {
        ArrayList<Transaction> transactions = new ArrayList<>();
        String query = "SELECT id, card_number, transaction_date, amount, transaction_type FROM Transactions WHERE card_number = ? ORDER BY transaction_date DESC";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cardNumber);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setId(rs.getInt("id"));
                transaction.setCardNumber(rs.getString("card_number"));
                transaction.setTransactionDate(rs.getDate("transaction_date"));
                transaction.setAmount(rs.getDouble("amount"));
                transaction.setTransactionType(rs.getString("transaction_type"));
                transactions.add(transaction);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
    
    public static void main(String[] args) {
        TransactionDAO tdao = new TransactionDAO();

//        ArrayList<Transaction> transactions = tdao.getTransactionsByCard("123123123123");
//        for (Transaction t : transactions) {
//            System.out.println("ID: " + t.getId() + ", Amount: " + t.getAmount() + ", Type: " + t.getTransactionType() +   ", Date: " + t.getTransactionDate()) ;
//        }
//        Transaction newTransaction = new Transaction("555555555555", 500.0, "Deposit");
//        if (tdao.insertTransaction(newTransaction)) {
//            System.out.println("Thêm giao dịch thành công!");
//        } else {
//            System.out.println("Thêm giao dịch thất bại!");
//        }

        double total = tdao.getTotalAmountByType("555555555555", "Deposit");
        System.out.println("Tổng số tiền giao dịch Deposit: " + total);
    }
}
