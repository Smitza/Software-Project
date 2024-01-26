package business;

import java.util.Date;

public class Payment {

    private String paymentId;
    private double amount;
    private Date paymentDate;
    private String paymentMethod; //Methods could be credit card,  paypal,  google pay or  voucher

    // Constructors
    public Payment() {
    }

    public Payment(String paymentId, double amount, Date paymentDate, String paymentMethod) {
        this.paymentId = paymentId;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.paymentMethod = paymentMethod;
    }

    // Getters and Setters
    public String getPaymentId() {
        return paymentId;
    }

    public double getAmount() {
        return amount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }


}
