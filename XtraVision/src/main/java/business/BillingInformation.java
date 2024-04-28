package business;

import java.time.LocalDate;

public class BillingInformation {

    int userid;
    String addressLine1;
    String addressLine2;


    public BillingInformation(int userid, String addressLine1, String addressLine2) {
        this.userid = userid;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
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

}
