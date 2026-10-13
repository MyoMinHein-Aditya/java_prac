package com.springcrud.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.springcrud.entity.Employee;
import com.springcrud.service.EmployeeService;

@RestController
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService service;

    @GetMapping("/")
    public String home() {
        return "Employee CRUD Application Running Successfully";
    }

    @PostMapping("/save")
    public Employee save(@RequestBody Employee employee) {
        return service.save(employee);
    }

    @GetMapping("/all")
    public List<Employee> getAll() {
        return service.getAll();
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        service.delete(id);
        return "Record Deleted";
    }

    @PutMapping("/update/{id}")
    public Employee updateEmployee(@PathVariable Long id, @RequestBody Employee employee) {
        employee.setId(id);
        return service.save(employee);
    }
}
