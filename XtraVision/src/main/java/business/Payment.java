package business;

import java.time.LocalDate;
import java.util.Objects;


public class Payment {

    private int paymentId;
    private double amount;
    private LocalDate paymentDate;
    private String paymentMethod;

    private static final int MAX_ID = 100;
    private static final int MAX_PRICE = 10000;
    private static final int MAX_PAYMENTMETHOD_LENGTH = 100;
    
    public Payment() {
    }

    public Payment(int paymentId, double amount, LocalDate paymentDate, String paymentMethod) {
        this.paymentId = paymentId;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.paymentMethod = paymentMethod;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        if (paymentId <= 0) {
            throw new IllegalArgumentException("ID must be positive.");
        }
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        if (amount < 0.0 || amount > MAX_PRICE) {
            throw new IllegalArgumentException("Price must be positive and not exceed €" + MAX_PRICE);
        }
    }

    public LocalDate getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDate paymentDate) {
        if (paymentDate == null || paymentDate.isAfter(LocalDate.now())) {
            throw new IllegalArgumentException("Payment date cannot be null or in the future.");
        }
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        if (paymentMethod == null || paymentMethod.trim().isEmpty() || paymentMethod.length() > MAX_PAYMENTMETHOD_LENGTH) {
            throw new IllegalArgumentException("Payment method cannot be null, empty, or longer than " + MAX_PAYMENTMETHOD_LENGTH + " characters.");
        }
    }

    @Override
    public String toString() {
        return "Payment{" +
                "paymentId=" + paymentId +
                ", amount=" + amount +
                ", paymentDate=" + paymentDate +
                ", paymentMethod='" + paymentMethod + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Payment payment = (Payment) o;
        return paymentId == payment.paymentId && Double.compare(amount, payment.amount) == 0 && Objects.equals(paymentDate, payment.paymentDate) && Objects.equals(paymentMethod, payment.paymentMethod);
    }

    @Override
    public int hashCode() {
        return Objects.hash(paymentId, amount, paymentDate, paymentMethod);
    }
}
