package business;

import java.util.Objects;

public class Delivery {

    private int deliveryId;
    private String address;
    private String phoneNumber;
    private Payment paymentMethod;

    private static final int MAX_ADDRESS_LENGTH = 320;
    private static final int MAX_PHONE_LENGTH = 50;

    public Delivery() {
    }

    public Delivery(int deliveryId, String address, String phoneNumber, Payment paymentMethod) {
        this.deliveryId = deliveryId;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.paymentMethod = paymentMethod;
    }

    public int getDeliverayId() {
        return deliveryId;
    }

    public void setDeliverayId(int deliverayId) {
        if (deliveryId <= 0) {
            throw new IllegalArgumentException("ID must be positive.");
        }
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        if (address == null || address.trim().isEmpty() || address.length() > MAX_ADDRESS_LENGTH) {
            throw new IllegalArgumentException("Address cannot be null, empty, or longer than " + MAX_ADDRESS_LENGTH + " characters.");
        }
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        if (phoneNumber == null || phoneNumber.trim().isEmpty() || phoneNumber.length() > MAX_PHONE_LENGTH) {
            throw new IllegalArgumentException("Name cannot be null, empty, or longer than " + MAX_PHONE_LENGTH + " characters.");
        }
    }

    public Payment getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(Payment paymentMethod) {
        if (paymentMethod == null) {
            throw new IllegalArgumentException("Payment method cannot be null.");
        }
    }

    @Override
    public String toString() {
        return "Delivery{" +
                "deliveryId=" + deliveryId +
                ", address='" + address + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", paymentMethod=" + paymentMethod +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Delivery delivery = (Delivery) o;
        return Objects.equals(address, delivery.address) && Objects.equals(phoneNumber, delivery.phoneNumber) && Objects.equals(paymentMethod, delivery.paymentMethod);
    }

    @Override
    public int hashCode() {
        return Objects.hash(address, phoneNumber, paymentMethod);
    }
}
