import business.Payment;
import daos.PaymentDao;
import exceptions.DaoException;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class PaymentDaoTests {

    private static PaymentDao paymentDao;

    @BeforeAll
    public static void setUp() {
        paymentDao = new PaymentDao("xtra");
    }

    @Test
    public void testAddPayment() throws DaoException {
        int amount = 100;
        int userid = 0;
        String paymentDate = LocalDate.now().toString();
        String paymentMethod = "Credit Card";
        int rowsAffected = paymentDao.addPayment(userid , amount, paymentDate, paymentMethod);
        assertEquals(1, rowsAffected);
    }

    @Test
    public void testDeletePaymentById() {
        int idToDelete = 1;
        int rowsAffected = paymentDao.deletePaymentById(idToDelete);
        assertTrue(rowsAffected >= 0);
    }

    @Test
    public void testGetPaymentById() {
        int idToRetrieve = 1;
        ArrayList<Payment> payments = paymentDao.getPaymentById(idToRetrieve);
        assertNotNull(payments);
    }

    @Test
    public void testGetPaymentByMethod() {
        String paymentMethod = "Credit Card";
        ArrayList<Payment> payments = paymentDao.getPaymentByMethod(paymentMethod);
        assertNotNull(payments);
    }

    @Test
    public void testGetAllPayments() {
        ArrayList<Payment> payments = paymentDao.getAllPayments();
        assertNotNull(payments);
    }

}