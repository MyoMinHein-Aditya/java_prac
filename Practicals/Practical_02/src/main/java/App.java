import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class App {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mydb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            String username = "root";
            String password = "root";

            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Database Connected Successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {
        Connection conn = getConnection();
        if (conn == null) {
            System.out.println("Failed to make connection!");
            return;
        }

        try {
            String insertQuery = "INSERT INTO users(name, email) VALUES(?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertQuery);

            ps.setString(1, "Abhishek");
            ps.setString(2, "abhi@sample.com");
            ps.executeUpdate();

            ps.setString(1, "Hetvi");
            ps.setString(2, "hetvi@gmail.com");
            ps.executeUpdate();

            ps.setString(1, "Anitha");
            ps.setString(2, "anitha@gmail.com");
            ps.executeUpdate();

            System.out.println("Records Inserted Successfully.");

            String selectQuery = "SELECT * FROM users";
            PreparedStatement ps2 = conn.prepareStatement(selectQuery);
            ResultSet rs = ps2.executeQuery();

            System.out.println("\n========== USER RECORDS ==========\n");
            while (rs.next()) {
                System.out.println("ID    : " + rs.getInt("id"));
                System.out.println("Name  : " + rs.getString("name"));
                System.out.println("Email : " + rs.getString("email"));
                System.out.println("-----------------------------------");
            }

            rs.close();
            ps.close();
            ps2.close();
            conn.close();
            System.out.println("Database Connection Closed.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
