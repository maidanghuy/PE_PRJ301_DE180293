/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author macbookpro
 */
public class Transaction {
    private int id;
    private String cardNumber;
    private double amount;
    private Date transactionDate;
    private String transactionType;

    public Transaction() {}

    public Transaction(String cardNumber, double amount, String transactionType) {
        this.cardNumber = cardNumber;
        this.amount = amount;
        this.transactionType = transactionType;
    }

    public Transaction(int id, String cardNumber, double amount, Date transactionDate, String transactionType) {
        this.id = id;
        this.cardNumber = cardNumber;
        this.amount = amount;
        this.transactionDate = transactionDate;
        this.transactionType = transactionType;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    @Override
    public String toString() {
        return "Transaction{" + "id=" + id + ", cardNumber=" + cardNumber + ", amount=" + amount + ", transactionDate=" + transactionDate + ", transactionType=" + transactionType + '}';
    }

}
