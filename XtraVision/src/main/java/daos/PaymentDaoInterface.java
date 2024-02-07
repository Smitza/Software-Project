package daos;
import business.Payment;
import exceptions.DaoException;

import java.time.LocalDate;
import java.util.ArrayList;

public interface PaymentDaoInterface {

    public boolean addPayment(Payment p) throws DaoException;

    public boolean deletePaymentById(int pId) throws DaoException;

    public int getPaymentById(int pId) throws DaoException;

    public boolean updatePayment(Payment p) throws  DaoException;

    public ArrayList<Payment> getPaymentByDateRange(LocalDate startDate, LocalDate endDate) throws DaoException;

    public ArrayList<Payment> getPaymentByMethod(String method) throws DaoException;

    public ArrayList<Payment> getAllPayments() throws DaoException;

}
