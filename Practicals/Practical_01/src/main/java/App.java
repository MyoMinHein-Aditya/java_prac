import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class App {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mydb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            String username = "root";
            String password = "root";

            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Success: Connected to the MySQL database!");
        } catch (ClassNotFoundException e) {
            System.out.println("Error: Driver class not found. Verify your JDBC dependency.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error: Connection failed. Verify your password or if MySQL Server is running.");
            e.printStackTrace();
        }
        return conn;
    }

    public static void insertData(Connection conn, String name, String email) {
        String insertSQL = "INSERT INTO users (name, email) VALUES (?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Data successfully inserted for: " + name);
            }
        } catch (SQLException e) {
            System.out.println("Error while running INSERT operation.");
            e.printStackTrace();
        }
    }

    public static void retrieveData(Connection conn) {
        String selectSQL = "SELECT id, name, email FROM users";
        System.out.println("\n--- Fetching Records From Database ---");
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(selectSQL)) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                System.out.println("ID: " + id + " | Name: " + name + " | Email: " + email);
            }
        } catch (SQLException e) {
            System.out.println("Error while running SELECT operation.");
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Connection connection = getConnection();
        if (connection != null) {
            try {
                insertData(connection, "Mumu", "mumu@sample.com");
                insertData(connection, "Rahul Kumar", "rahul@sample.com");
                insertData(connection, "Kumar", "rahul6@sample.com");
                insertData(connection, "Abhishek", "abhi@sample.com");
                insertData(connection, "Hetvi", "hetvi@sample.com");
                insertData(connection, "Anitha", "anitha@sample.com");

                retrieveData(connection);
            } finally {
                try {
                    connection.close();
                    System.out.println("\nDatabase connection closed safely.");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
