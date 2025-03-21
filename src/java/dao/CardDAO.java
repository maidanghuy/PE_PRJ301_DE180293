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
import model.Card;

/**
 *
 * @author macbookpro
 */
public class CardDAO {
    Connection conn;

    public CardDAO() {
        ConnectDB connectDB = new ConnectDB();
        try {
            conn = connectDB.getConnection();
        } catch (Exception e) {
            System.out.println(e);

        }
    }

    public ArrayList<Card> getAllCards() {
        ArrayList<Card> cardList = new ArrayList<>();
        String query = "SELECT card_number, account_number, customer_name, expiration_date, is_blocked FROM Cards";

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Card card = new Card();
                card.setCardNumber(rs.getString("card_number"));
                card.setAccountNumber(rs.getString("account_number"));
                card.setCustomerName(rs.getString("customer_name"));
                card.setExpirationDate(rs.getDate("expiration_date"));
                card.setIsBlocked((rs.getBoolean("is_blocked")));

                cardList.add(card);
            }
        }  catch (SQLException e) {
            e.printStackTrace();
        }
        return cardList;
    }
    
    public Card getCardByNumber(String cardNumber) {
        Card card = null;
        String query = "SELECT * FROM Cards WHERE card_number = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cardNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                card = new Card();
                card.setCardNumber(rs.getString("card_number"));
                card.setCustomerName(rs.getString("customer_name"));
                card.setExpirationDate(rs.getDate("expiration_date"));
                card.setIsBlocked((rs.getBoolean("is_blocked")));
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return card;
    }
    
    public static void main(String[] args) {
        CardDAO cdao = new CardDAO();
        System.out.println(cdao.getCardByNumber("555555555555"));
    }
}
