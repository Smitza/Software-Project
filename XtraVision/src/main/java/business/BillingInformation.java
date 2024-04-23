package business;

import java.time.LocalDate;

public class BillingInformation {

    int userid;
    String addressLine1;
    String addressLine2;
    String cardHolder;
    int cardNumber;
    String expDate;
    int secNum;

    public BillingInformation(int userid, String addressLine1, String addressLine2, String cardHolder, int cardNumber, String expDate, int secNum) {
        this.userid = userid;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
        this.cardHolder = cardHolder;
        this.cardNumber = cardNumber;
        this.expDate = expDate;
        this.secNum = secNum;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

    public int getSecNum() {
        return secNum;
    }

    public void setSecNum(int secNum) {
        this.secNum = secNum;
    }
}
