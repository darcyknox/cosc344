import java.util.*;

public class EmpRow implements Comparable<EmpRow>{

  private String fname;
  private String lname;
  private int salary;

  public EmpRow(String fname, String lname, int salary) {
    this.fname = fname;
    this.lname = lname;
    this.salary = salary;
  }

  public int getSalary() {
    return salary;
  }

  public int compareSalary(EmpRow employee) {
    if (salary > employee.salary) {
      return 1;
    } else if (salary < employee.salary) {
      return -1;
    } else {
      return 0;
    }
  }

  public String toString() {
    return "fname: " + fname + " lname: " + lname + " salary: " + salary;
  }
}
