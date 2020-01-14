package com.avio.service;

import com.avio.dao.EmployeeDao;
import com.avio.domain.administration.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    public Employee getById(Integer id) {
        return employeeDao.getById(id);
    }

    public Employee getByUsername(String username) {
        return employeeDao.getByUsername(username);
    }
}
