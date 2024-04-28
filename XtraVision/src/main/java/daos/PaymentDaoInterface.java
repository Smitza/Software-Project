package daos;
import business.Payment;
import exceptions.DaoException;

import java.time.LocalDate;
import java.util.ArrayList;

public interface PaymentDaoInterface {

    public int addPayment(int userId, double amount, String paymentDate, String paymentMethod) throws DaoException;

    public int deletePaymentById(int pId) throws DaoException;

    public ArrayList<Payment> getPaymentById(int pId) throws DaoException;

    public ArrayList<Payment> getPaymentByMethod(String method) throws DaoException;

    public ArrayList<Payment> getAllPayments() throws DaoException;

}
