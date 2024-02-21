package daos;

import business.Tv;
import exceptions.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TvDao extends Dao implements TvDaoInterface {
    public TvDao(String dbName) {
        super(dbName);
    }

    public ArrayList<Tv> getAllTvShows() throws DaoException {
        ArrayList<Tv> Tvs = new ArrayList<>();
        String query = "SELECT * FROM tvshows";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int productid = rs.getInt("Tvid");
                String showrunner = rs.getString("showrunner");
                String format = rs.getString("format");
                int noofseasons = rs.getInt("noofseasons");
                int noofepisodes = rs.getInt("noofepisodes");
                String runtime = rs.getString("runtime");
                String tvrating = rs.getString("tvrating");

                Tv Tv = new Tv(productid,showrunner,format,noofseasons,noofepisodes,runtime,tvrating);
                Tvs.add(Tv);
            }
        } catch (SQLException e) {
            throw new DaoException("Error listing all Tvs: " + e.getMessage(), e);
        }

        return Tvs;
    }
}
