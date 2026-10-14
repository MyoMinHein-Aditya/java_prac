package n.a.w;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class App {

    public static void main(String[] args) throws Exception {
        // Step 1: Load Hibernate Configuration & SessionFactory
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sf = cfg.buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        // Step 2: Insert New Employee
        Employee e01 = new Employee();
        e01.setEmp_fname("Kalpataru");
        e01.setEmp_lname("Dash");
        e01.setEmp_city("Bhubaneswar");

        session.save(e01);
        tr.commit();
        System.out.println("Employee saved successfully! Generated ID: " + e01.getEmp_id());

        // Step 3: Fetch and Display All Employees
        System.out.println("\n--- All Employees from Database ---");
        List<Employee> list = session.createQuery("from Employee", Employee.class).list();
        for (Employee emp : list) {
            System.out.println(emp);
        }

        // Step 4: Close Session and Factory
        session.close();
        sf.close();
        System.out.println("\nHibernate closed successfully.");
        System.exit(0);
    }
}
