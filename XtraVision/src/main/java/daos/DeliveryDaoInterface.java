package daos;

import business.Delivery;
import exceptions.DaoException;

import java.time.LocalDate;
import java.util.Date;

public interface DeliveryDaoInterface {

    public boolean addDelivery(int userId, String status) throws DaoException;

}
