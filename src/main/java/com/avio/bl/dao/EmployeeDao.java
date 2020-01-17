package com.avio.bl.dao;

import com.avio.bl.dao.rowmapper.EmployeeRowMapper;
import com.avio.bl.dao.util.AbstractJDBCDao;
import com.avio.domain.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class EmployeeDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private EmployeeRowMapper employeeRowMapper;

    public List<Employee> find() {
        return jdbcTemplate.query(queries.getSQL("select.employees"), employeeRowMapper);
    }

    public Employee getById(Integer id){
        return (Employee) jdbcTemplate.queryForObject(queries.getSQL("select.employee.by.id"), employeeRowMapper, id);
    }

    public Employee getByUsername(String username) {
        return (Employee) jdbcTemplate.queryForObject(queries.getSQL("select.employee.by.username"), employeeRowMapper, username);
    }
}
