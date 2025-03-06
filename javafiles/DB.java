package EventIs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

	private final String dbServer = "195.251.249.131";
	private final String dbServerPort = "3306";
	private final String dbName = "ismgroup8";
	private final String dbusername = "ismgroup8";
	private final String dbpassword = "ptd2uy";


    private Connection con = null;

    public Connection getConnection() throws Exception {
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();

        } catch(Exception e) {
            throw new Exception("My SQL Driver error:" + e.getMessage());
        }
        try{
            con = DriverManager.getConnection("jdbc:mysql://" 
				+ dbServer + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);
            return con;

        }catch (Exception e) {
            throw new Exception("Could not establish connection with the Database Server: " 
				+ e.getMessage());
        }

    }

    public void close() throws SQLException {

		try {

			// if connection is (still) open
			if (con != null)
				con.close(); // close the connection to the database to end database session

		} catch (SQLException e) {

			throw new SQLException("Could not close connection with the Database Server: " 
				+ e.getMessage());
		}  
    
}

}