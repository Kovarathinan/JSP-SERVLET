package Pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Jdbc {
	
	public Connection dbconnect() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/student";
		String user="root",pass="kova123";
		Connection con=DriverManager.getConnection(url, user, pass);
		return con;
		
	}

}
