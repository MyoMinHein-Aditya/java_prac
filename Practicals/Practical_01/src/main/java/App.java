import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class App {

    public static void main(String[] args) throws Exception {
        // Step 1: Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Step 2: Create Database Connection
        String url = "jdbc:mysql://localhost:3306/mydb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String username = "root";
        String password = "Dash@1908";

        Connection conn = DriverManager.getConnection(url, username, password);
        System.out.println("Database Connected Successfully!");

        // Step 3: Insert Data
        String insertSQL = "INSERT INTO users (name, email) VALUES (?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(insertSQL);
        pstmt.setString(1, "Kalpataru Dash");
        pstmt.setString(2, "kalpataru@sample.com");
        pstmt.executeUpdate();
        System.out.println("Record inserted successfully.");

        // Step 4: Retrieve and Display Data
        String selectSQL = "SELECT id, name, email FROM users";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(selectSQL);

        System.out.println("\n--- User Records ---");
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            System.out.println("ID: " + id + " | Name: " + name + " | Email: " + email);
        }

        // Step 5: Close Connections
        rs.close();
        stmt.close();
        pstmt.close();
        conn.close();
        System.out.println("\nConnection closed successfully.");
    }
}
