
import business.User;
import daos.UserDao;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class UserDaoTests {

    private static UserDao userDao;

    @BeforeAll
    public static void setUp() {
        userDao = new UserDao("xtra");
    }


    @Test
    public void testAddUser() {
        boolean result = userDao.addUser("testUser", "test@example.com", "testpassword", "123456789", "Test User", 0, 0, 0);
        assertTrue(result);
    }

    @Test
    public void testGetAllUsers() {
        ArrayList<User> users = userDao.getAllUsers();
        assertNotNull(users);
        assertFalse(users.isEmpty());
    }

    @Test
    public void testGetUserbyUserPass() {
        User user = userDao.getUserbyUserPass("testUser", "testpassword");
        assertNotNull(user);
    }

    @Test
    public void testGetUserById() {
        User user = userDao.getUserById(1);
        assertNotNull(user);
    }
}
