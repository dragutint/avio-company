package com.avio.dao;

import com.avio.dao.rowmapper.EmployeeRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.administration.Employee;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class EmployeeDao extends AbstractJDBCDao {

    public List<Employee> find() {
        return jdbcTemplate.query(queries.getSQL("select.employees"), new EmployeeRowMapper());
    }

    public Employee getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.employee.by.id"), Employee.class, new EmployeeRowMapper(), id);
    }
}
