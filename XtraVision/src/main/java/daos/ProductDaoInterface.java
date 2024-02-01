package daos;

import business.Product;
import exceptions.DaoException;

public interface ProductDaoInterface {
    public boolean addProduct(Product p) throws DaoException;

}
