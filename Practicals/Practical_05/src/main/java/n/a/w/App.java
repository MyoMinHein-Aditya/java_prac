package n.a.w;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class App {

    public static void main(String[] args) {
        Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml");
        SessionFactory sf = cfg.buildSessionFactory();

        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        Employee e01 = new Employee();
        e01.setEmp_fname("Anitha");
        e01.setEmp_lname("Nadar");
        e01.setEmp_city("Gujarat");

        try {
            session.save(e01);
            tr.commit();
            System.out.println("Data stored successfully! Generated ID: " + e01.getEmp_id());
        } catch (Exception e) {
            if (tr != null) tr.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        Session readSession = sf.openSession();
        try {
            System.out.println("\n--- Fetching All Employees from TestHibernate ---");
            List<Employee> list = readSession.createQuery("from Employee", Employee.class).list();
            for (Employee emp : list) {
                System.out.println(emp);
            }
        } finally {
            readSession.close();
        }

        Session updateSession = sf.openSession();
        Transaction updateTx = updateSession.beginTransaction();
        try {
            Employee empToUpdate = updateSession.get(Employee.class, e01.getEmp_id());
            if (empToUpdate != null) {
                empToUpdate.setEmp_city("Vadodara");
                updateSession.update(empToUpdate);
                updateTx.commit();
                System.out.println("\nEmployee ID " + empToUpdate.getEmp_id() + " city updated to Vadodara.");
            }
        } catch (Exception e) {
            if (updateTx != null) updateTx.rollback();
            e.printStackTrace();
        } finally {
            updateSession.close();
        }

        sf.close();
        System.out.println("\nHibernate SessionFactory closed safely.");
    }
}
