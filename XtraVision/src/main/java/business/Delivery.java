package business;

import java.util.Objects;

public class Delivery {

    private int deliverayId;
    private String address;
    private String phoneNumber;
    private Payment paymentMethod;

    public int getDeliverayId() {
        return deliverayId;
    }

    public void setDeliverayId(int deliverayId) {
        this.deliverayId = deliverayId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Payment getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(Payment paymentMethod) {
        this.paymentMethod = paymentMethod;
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
