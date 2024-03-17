import business.Product;
import exceptions.DaoException;
import daos.CartDao;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class CartDaoTests {

    private static CartDao cartDao;

    @BeforeAll
    public static void setUp() {
        cartDao = new CartDao("xtra");
    }

    @Test
    public void testAddProductToCart() {
        try {
            boolean result = cartDao.addProductToCart(1, 1, 1);
            assertTrue(result);
        } catch (DaoException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }

    @Test
    public void testGetCartByUserId() {
        try {
            int userId = 1;
            List<Product> cartProducts = cartDao.getCartByUserId(userId);
            assertNotNull(cartProducts);
        } catch (DaoException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }

    @Test
    public void testUpdateCartQuantity() {
        try {
            int cartId = 1;
            int quantity = 2;
            int productId = 1;
            boolean result = cartDao.updateCartQuantity(cartId, quantity, productId);
            assertTrue(result);
        } catch (DaoException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }

    @Test
    public void testCheckoutCart() {
        try {
            int userId = 1;
            cartDao.checkoutCart(userId);
        } catch (DaoException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }

}
