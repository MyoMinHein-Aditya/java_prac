package n.a.w;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int emp_id;

    private String emp_fname;
    private String emp_lname;
    private String emp_city;

    public Employee() {
    }

    public Employee(String emp_fname, String emp_lname, String emp_city) {
        this.emp_fname = emp_fname;
        this.emp_lname = emp_lname;
        this.emp_city = emp_city;
    }

    public int getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(int emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_fname() {
        return emp_fname;
    }

    public void setEmp_fname(String emp_fname) {
        this.emp_fname = emp_fname;
    }

    public String getEmp_lname() {
        return emp_lname;
    }

    public void setEmp_lname(String emp_lname) {
        this.emp_lname = emp_lname;
    }

    public String getEmp_city() {
        return emp_city;
    }

    public void setEmp_city(String emp_city) {
        this.emp_city = emp_city;
    }

    @Override
    public String toString() {
        return "Employee [emp_id=" + emp_id + ", emp_fname=" + emp_fname + ", emp_lname=" + emp_lname + ", emp_city="
                + emp_city + "]";
    }
}
