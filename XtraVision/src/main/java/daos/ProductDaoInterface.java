package daos;

import business.Product;
import exceptions.DaoException;

import java.util.List;

public interface ProductDaoInterface {
    public boolean addProduct(Product p) throws DaoException;

    public Product getProductById(int productId) throws DaoException;

    public List<Product> getGameProducts();

}
