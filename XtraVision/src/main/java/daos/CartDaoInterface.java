package daos;

import business.Product;
import business.User;
import exceptions.DaoException;

import java.util.List;

public interface CartDaoInterface {

public boolean addProductToCart( int userId, int productId, int quantity) throws DaoException;

public List<Product> getCartByUserId(int userId) throws DaoException;

public boolean updateCartQuantity(int cartId, int quantity, int productId) throws DaoException;

public int checkoutCart(int userId) throws  DaoException;

public void removeProductFromCart(int userId, int productId) throws DaoException;

}
