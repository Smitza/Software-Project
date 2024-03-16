package business;

import java.time.LocalDate;

public class Delivery {
    private int deliveryId;
    private int userId;
    private LocalDate deliveryDate;
    private String status;

    public Delivery(int deliveryId, int userId, LocalDate deliveryDate, String status) {
        this.deliveryId = deliveryId;
        this.userId = userId;
        this.deliveryDate = deliveryDate;
        this.status = status;
    }

    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDate getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(LocalDate deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Delivery{" +
                "deliveryId=" + deliveryId +
                ", userId=" + userId +
                ", deliveryDate=" + deliveryDate +
                ", status='" + status + '\'' +
                '}';
    }
}
