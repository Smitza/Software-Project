import business.Product;
import daos.ProductDao;
import exceptions.DaoException;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class ProductDaoTests {

    private static ProductDao productDao;

    @BeforeAll
    public static void setUp() {
        productDao = new ProductDao("xtra");
    }

    @Test
    public void testAddProduct() {
        Product product = new Product(77, "Test Product", "Test Description", "Test Genre", "Test Studio", LocalDate.now(), 9.99, 10);
        try {
            boolean result = productDao.addProduct(product);
            assertTrue(result);
        } catch (DaoException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }

    @Test
    public void testGetProductById() {
        Product product = productDao.getProductById(1);
        assertNotNull(product);
    }

    @Test
    public void testGetGameProducts() {
        List<Product> gameProducts = productDao.getGameProducts();
        assertNotNull(gameProducts);
    }

    @Test
    public void testGetMovieProducts() {
        List<Product> movieProducts = productDao.getMovieProducts();
        assertNotNull(movieProducts);
    }

    @Test
    public void testGetTvShowProducts() {
        List<Product> tvShowProducts = productDao.getTvShowProducts();
        assertNotNull(tvShowProducts);
    }

}
