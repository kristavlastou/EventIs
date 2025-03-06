package EventIs;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {
		

	public List<User> getUsers() throws Exception {
		 List<User> users = new ArrayList<>();
		 DB db = new DB();
		 Connection con = null;
		 String sql = "SELECT firstname, lastname, username, email, password FROM USER;";
		 try{
		  con = db.getConnection();	
		  PreparedStatement stmt = con.prepareStatement(sql);
		  ResultSet rs = stmt.executeQuery();
		  while (rs.next()) {
			String username = rs.getString("username");
			String password = rs.getString("password");
			String name = rs.getString("name");
			String surname = rs.getString("surname");
			String city = rs.getString("city");
			String email = rs.getString("email");
			String age = rs.getString("age");
			User user = new User(username, name,surname, password, age, city , email);
			users.add(user);
		  }
		 
		  rs.close();
		  stmt.close();
		  db.close();
		 
		 }catch (SQLException e){
			throw new SQLException("Error accessing the database: " 
				+ e.getMessage());

		 }
		 finally {
			try {
				db.close();
		   } catch (Exception e) {

		   }

		 }
		
		return users;
		
	}

	public User findUser(String username) throws Exception {
		Connection con = null;
		DB db = new DB();
		String sql = "SELECT name, surname, password, city, age,  email FROM USER WHERE username = ?;";
		User user = null;
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				String surname = rs.getString("surname");
                String password = rs.getString("password");
                String age = rs.getString("age");
                String city = rs.getString("city");
                String email = rs.getString("email");
				
				user = new User(username, name,surname, password, age, city , email);
			}
			rs.close();
			stmt.close();
		}catch(SQLException e) {
			throw new SQLException("Error accessing the database: " + e.getMessage());

		}finally {
			try{
				con.close();
			}catch (Exception e) {
                e.printStackTrace();
			}
			try {
				db.close();
		   } catch (Exception e) {

		   }
		}
		return user;	
		
	} 

	public User authenticate(String username, String password) throws Exception {
		DB db = new DB();
		Connection con = null;
		User user = null;
		String sql = "SELECT username ,name , surname,  password, city , age, email FROM USER WHERE username = ? AND password = ? ";
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				String surname = rs.getString("surname");
				String city = rs.getString("city");
			    String email = rs.getString("email");
			    String age = rs.getString("age");
				user = new User(username, name,surname, password, age, city , email);
			}else {
				throw new Exception("Wrong username or password");
			}
			rs.close();
            stmt.close();
		}catch(SQLException e) {
			throw new SQLException("Error accessing the database: " + e.getMessage());
		} finally {
			try{
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				db.close();
		   } catch (Exception e) {

		   }
		}

		return user;

			
		
	} 



	public void register(User user) throws Exception {
		DB db= new DB();
		Connection con = null;
		String sql1 = "SELECT COUNT(*) FROM USER WHERE username = ? OR email = ?;";
		String sql2 = "INSERT INTO USER (username, name, surname, password, city, age, email) VALUES(?,?,?,?,?,?,?);";
		try {
			con = db.getConnection();
			PreparedStatement check  = con.prepareStatement(sql1);
			PreparedStatement insert = con.prepareStatement(sql2);
			check.setString(1, user.getUsername());
			check.setString(2, user.getEmail());
            ResultSet rs = check.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    throw new Exception("Sorry, username or email already registered.");
                }else {
					insert.setString(1, user.getUsername());
					insert.setString(2, user.getName());
					insert.setString(3, user.getSurname());
					insert.setString(4, user.getPassword());
					insert.setString(5, user.getCity());
					insert.setString(6, user.getAge());
					insert.setString(7, user.getEmail());
					int rowsInserted = insert.executeUpdate();
					if (rowsInserted == 0) {
						throw new Exception("Error occurred while registering the user.");
					}
				}
				rs.close();
            	check.close();
				insert.close();
				
            }catch(SQLException e ) {
				if (e.getMessage().contains("Duplicate entry")) {
					throw new Exception("Sorry, username or email already registered.");
				} else {
					// Άλλα σφάλματα SQL
					throw new SQLException("Database error: " + e.getMessage());
				}
			} finally {
				try{
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			
	}

	}

    public void addFavoriteToDatabase(int eventID, String username) {
        DB db= new DB();
		Connection con = null;
        String sql1 = "INSERT INTO FAVEVENTS (username, event_id) VALUES (?, ?)";
        try{
            con = db.getConnection();
            PreparedStatement stmnt = con.prepareStatement(sql1);
            stmnt.setString(1, username);
            stmnt.setInt(2, eventID);
            int rowsAffected = stmnt.executeUpdate();
            if (rowsAffected == 0) {
                throw new Exception("Error occurred while inseting the event in the favorite list.");
            }
           
            stmnt.close();
        }catch(Exception e) {
            e.printStackTrace();

        }finally {
            try{
                con.close();
            }catch(Exception e) {
                e.printStackTrace();
            }
			try {
				db.close();
		   } catch (Exception e) {

		   }
        }

    }



	public void removeFavoriteFromDatabase(int eventID, String username) {
		DB db = new DB();
		Connection con = null;
		String sql = "DELETE FROM FAVEVENTS WHERE username = ? AND event_id = ?";
		
		try {
			con = db.getConnection();
			PreparedStatement stmnt = con.prepareStatement(sql);
			stmnt.setString(1, username);
			stmnt.setInt(2, eventID);
			int rowsAffected = stmnt.executeUpdate();
			
			if (rowsAffected == 0) {
				throw new Exception("No matching favorite found to remove.");
			}
			
			stmnt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				db.close();
		   } catch (Exception e) {

		   }
		}
	}
	

	public boolean isFavorite(int eventID, String username) {
		DB db = new DB();
		Connection con = null;
		String sql = "SELECT * FROM FAVEVENTS WHERE username = ? AND event_id = ?";
		
		try {
			con = db.getConnection();
			PreparedStatement stmnt = con.prepareStatement(sql);
			stmnt.setString(1, username);
			stmnt.setInt(2, eventID);
			
			ResultSet rs = stmnt.executeQuery();
			
			if (rs.next()) {
				return true;  
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				db.close();
			} catch (Exception e) {
			}
		}
		return false;  
	}
	
	
} 