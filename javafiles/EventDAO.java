package EventIs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {

    public void uploadEventToDatabase(Event event, User user) {
        DB db = new DB();
        Connection con = null;

        String sql = "INSERT INTO EVENT (name, date, time, entrancePrice, city, place, category, description, username) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = db.getConnection();
            if (con == null) {
                throw new Exception("Database connection failed!");
            }

            PreparedStatement stmnt = con.prepareStatement(sql);

            stmnt.setString(1, event.getName());
            stmnt.setDate(2, java.sql.Date.valueOf(event.getDate()));
            stmnt.setTime(3, java.sql.Time.valueOf(event.getTime()));
            stmnt.setDouble(4, event.getPrice());
            stmnt.setString(5, event.getCity());
            stmnt.setString(6, event.getPlace());
            stmnt.setString(7, event.getCategory());
            stmnt.setString(8, event.getDescription());
            stmnt.setString(9, user.getUsername());

            System.out.println("Executing SQL: " + sql);
            System.out.println("Values: " + event.getName() + ", " + event.getDate() + ", " + event.getTime() + ", " +
                    event.getPrice() + ", " + event.getCity() + ", " + event.getPlace() + ", " +
                    event.getCategory() + ", " + event.getDescription() + ", " + user.getUsername());

            int rowsAffected = stmnt.executeUpdate();
            if (rowsAffected == 0) {
                throw new Exception("No rows were affected. Event was not inserted.");
            }

            System.out.println("Event uploaded successfully!");
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

    public void editEventInDatabase(Event event) {
        DB db = new DB();
        Connection con = null;

        String sql = "UPDATE EVENT SET name = ?, date = ?, time = ?, entrancePrice = ?, city = ?, place = ?, category = ?, description = ? "
                +
                "WHERE event_id = ?";

        try {
            con = db.getConnection();
            PreparedStatement stmnt = con.prepareStatement(sql);

            stmnt.setString(1, event.getName());
            stmnt.setDate(2, java.sql.Date.valueOf(event.getDate()));
            stmnt.setTime(3, java.sql.Time.valueOf(event.getTime()));
            stmnt.setDouble(4, event.getPrice());
            stmnt.setString(5, event.getCity());
            stmnt.setString(6, event.getPlace());
            stmnt.setString(7, event.getCategory());
            stmnt.setString(8, event.getDescription());
            stmnt.setInt(9, event.getEventID());

            int rowsAffected = stmnt.executeUpdate();
            if (rowsAffected == 0) {
                throw new Exception("Error occurred while updating the event in the database.");
            }

            System.out.println("Event updated successfully!");
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

    public void deleteEventFromDatabase(int eventID) {
        DB db = new DB();
        Connection con = null;

        String sql = "DELETE FROM event WHERE event_id = ?";

        try {
            con = db.getConnection();
            PreparedStatement stmnt = con.prepareStatement(sql);

            stmnt.setInt(1, eventID);

            int rowsAffected = stmnt.executeUpdate();
            if (rowsAffected == 0) {
                throw new Exception("Error occurred while deleting the event from the database.");
            }

            System.out.println("Event deleted successfully!");
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

    public List<String> searchEvents(String query) {
        List<String> eventIds = new ArrayList<>();
        DB db = new DB();
        Connection con = null;

        try {
            con = db.getConnection();
            String sql = "SELECT event_id FROM EVENT WHERE name LIKE ?";
            PreparedStatement stmnt = con.prepareStatement(sql);
            String searchTerm = "%" + query + "%";
            stmnt.setString(1, searchTerm);
            ResultSet rs = stmnt.executeQuery();

            while (rs.next()) {
                String eventId = rs.getString("event_id");
                if (eventId != null && !eventId.isEmpty()) {
                    eventIds.add(eventId);
                }
            }
            rs.close();
            stmnt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                db.close();
            } catch (Exception e) {
            }
        }
        return eventIds;
    }

    public List<String> searchUsernames(String query) {
        List<String> usernames = new ArrayList<>();
        DB db = new DB();
        Connection con = null;

        try {
            con = db.getConnection();
            String sql = "SELECT username FROM USER WHERE username LIKE ?";
            PreparedStatement stmnt = con.prepareStatement(sql);
            String searchTerm = "%" + query + "%";
            stmnt.setString(1, searchTerm);
            ResultSet rs = stmnt.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                if (username != null && !username.isEmpty()) {
                    usernames.add(username);
                }
            }
            rs.close();
            stmnt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                db.close();
            } catch (Exception e) {
            }
        }
        return usernames;
    }


    public Event findEventByID(int eventID) {
        Event event = null;
        DB db = new DB();
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT event_id, name, date, time, entrancePrice, city, place, category, description, username "
                    +
                    "FROM event WHERE event_id = ?";
            PreparedStatement stmnt = con.prepareStatement(sql);
            stmnt.setInt(1, eventID);

            ResultSet rs = stmnt.executeQuery();

            if (rs.next()) {

                String name = rs.getString("name");
                LocalDate date = rs.getDate("date").toLocalDate();
                LocalTime time = rs.getTime("time").toLocalTime();
                double entrancePrice = rs.getDouble("entrancePrice");
                String city = rs.getString("city");
                String place = rs.getString("place");
                String category = rs.getString("category");
                String description = rs.getString("description");

                event = new Event(eventID, name, date, time, city, place, entrancePrice, category, description);
            }
            rs.close();
            stmnt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                db.close();
            } catch (Exception e) {

            }
        }
        return event;
    }

    public List<Integer> getEventIDsByFilters(String category, LocalDate desiredDate, String city, Double maxPrice) {
        DB db = new DB();
        List<Integer> eventIDs = new ArrayList<>();
        Connection con = null;

        try {
            con = db.getConnection();
            StringBuilder sql = new StringBuilder("SELECT event_id FROM event WHERE category = ?");

            if (desiredDate != null) {
                sql.append(" AND date = ?");
            }
            if (city != null && !city.isEmpty()) {
                sql.append(" AND city = ?");
            }
            if (maxPrice != null) {
                sql.append(" AND entrancePrice <= ?");
            }

            PreparedStatement stmnt = con.prepareStatement(sql.toString());

            int paramIndex = 1;
            stmnt.setString(paramIndex, category);
            if (desiredDate != null) {
                stmnt.setDate(paramIndex++, java.sql.Date.valueOf(desiredDate));
            }
            if (city != null && !city.isEmpty()) {
                stmnt.setString(paramIndex++, city);
            }
            if (maxPrice != null) {
                stmnt.setDouble(paramIndex++, maxPrice);
            }

            ResultSet rs = stmnt.executeQuery();

            while (rs.next()) {
                int eventID = rs.getInt("event_id");
                eventIDs.add(eventID);
            }

            rs.close();
            stmnt.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                db.close();
            } catch (Exception e) {

            }
        }

        return eventIDs;
    }

    public List<Event> getEventsByUser(String username) {
        List<Event> events = new ArrayList<>();
        DB db = new DB();
        Connection con = null;

        try {
            try {
                con = db.getConnection();
            } catch (Exception e) {
                //
                e.printStackTrace();
            }

            String sql = "SELECT event_id, name, date, time, entrancePrice, city, place, category, description " +
                    "FROM event WHERE username = ?";

            PreparedStatement stmnt = con.prepareStatement(sql);
            stmnt.setString(1, username);

            ResultSet rs = stmnt.executeQuery();

            while (rs.next()) {
                int eventID = rs.getInt("event_id");
                String name = rs.getString("name");
                LocalDate date = rs.getDate("date").toLocalDate();
                LocalTime time = rs.getTime("time").toLocalTime();
                double entrancePrice = rs.getDouble("entrancePrice");
                String city = rs.getString("city");
                String place = rs.getString("place");
                String category = rs.getString("category");
                String description = rs.getString("description");

                Event event = new Event(eventID, name, date, time, city, place, entrancePrice, category, description);
                events.add(event);
            }

            rs.close();
            stmnt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                db.close();
            } catch (Exception e) {

            }
        }

        return events;
    }

    public List<Event> getEventsByCategory(String category) {
        List<Event> events = new ArrayList<>();
        DB db = new DB();
        Connection con = null;

        try {
            try {
                con = db.getConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Î•ÏÏŽÏ„Î·Î¼Î± SQL Î³Î¹Î± Î½Î± Î²ÏÎ¿ÏÎ¼Îµ Ï„Î± events Î¼Îµ Î²Î¬ÏƒÎ· Ï„Î·Î½ ÎºÎ±Ï„Î·Î³Î¿ÏÎ¯Î±
            String sql = "SELECT event_id, name, date, time, entrancePrice, city, place, category, description " +
                    "FROM event WHERE category = ?";

            PreparedStatement stmnt = con.prepareStatement(sql);
            stmnt.setString(1, category); // ÎŸÏÎ¯Î¶Î¿Ï…Î¼Îµ Ï„Î·Î½ ÎºÎ±Ï„Î·Î³Î¿ÏÎ¯Î± ÏƒÏ„Î·Î½ PreparedStatement

            ResultSet rs = stmnt.executeQuery();

            // Î‘Î½Î¬Î³Î½Ï‰ÏƒÎ· Ï„Ï‰Î½ Î±Ï€Î¿Ï„ÎµÎ»ÎµÏƒÎ¼Î¬Ï„Ï‰Î½ Î±Ï€ÏŒ Ï„Î¿ ResultSet
            while (rs.next()) {
                int eventID = rs.getInt("event_id");
                String name = rs.getString("name");
                LocalDate date = rs.getDate("date").toLocalDate();
                LocalTime time = rs.getTime("time").toLocalTime();
                double entrancePrice = rs.getDouble("entrancePrice");
                String city = rs.getString("city");
                String place = rs.getString("place");
                String categoryFromDB = rs.getString("category");
                String description = rs.getString("description");

                // Î”Î·Î¼Î¹Î¿Ï…ÏÎ³Î¯Î± Ï„Î¿Ï… Î±Î½Ï„Î¹ÎºÎµÎ¹Î¼Î­Î½Î¿Ï… Event ÎºÎ±Î¹ Ï€ÏÎ¿ÏƒÎ¸Î®ÎºÎ· ÏƒÏ„Î· Î»Î¯ÏƒÏ„Î±
                Event event = new Event(eventID, name, date, time, city, place, entrancePrice, categoryFromDB,
                        description);
                events.add(event);
            }

            rs.close();
            stmnt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                db.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return events;
    }



    public List<Event> getFavEvents(String username) {
        List<Event> favEvents = new ArrayList<>();
        DB db = new DB();
        Connection con = null;

        try {
            try {
                con = db.getConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }

            String sql = "SELECT e.event_id, e.name, e.date, e.time, e.entrancePrice, e.city, e.place, e.category, e.description "
                    +
                    "FROM favevents f " +
                    "JOIN event e ON f.event_id = e.event_id " +
                    "WHERE f.username = ?";

            PreparedStatement stmnt = con.prepareStatement(sql);
            stmnt.setString(1, username);

            ResultSet rs = stmnt.executeQuery();

            while (rs.next()) {
                int eventID = rs.getInt("event_id");
                String name = rs.getString("name");
                LocalDate date = rs.getDate("date").toLocalDate();
                LocalTime time = rs.getTime("time").toLocalTime();
                double entrancePrice = rs.getDouble("entrancePrice");
                String city = rs.getString("city");
                String place = rs.getString("place");
                String category = rs.getString("category");
                String description = rs.getString("description");

                Event event = new Event(eventID, name, date, time, city, place, entrancePrice, category, description);
                favEvents.add(event);
            }

            rs.close();
            stmnt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                db.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return favEvents;
    }




}
