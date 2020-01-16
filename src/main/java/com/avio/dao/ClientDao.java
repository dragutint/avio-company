package com.avio.dao;

import com.avio.dao.rowmapper.ClientRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.administration.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ClientDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private ClientRowMapper clientRowMapper;

    public List<Client> find() {
        return jdbcTemplate.query(queries.getSQL("select.clients"), clientRowMapper);
    }

    public Client getById(Integer id){
        return (Client) jdbcTemplate.queryForObject(queries.getSQL("select.client.by.id"), clientRowMapper, id);
    }

    public Client getByUsername(String username) {
        return (Client) jdbcTemplate.queryForObject(queries.getSQL("select.client.by.username"), clientRowMapper, username);

    }

    public void insert(Client c) {
        jdbcTemplate.update(
                queries.getSQL("insert.client"),
                new Object[]{
                    c.getFirstName(),
                    c.getLastName(),
                    c.getDateOfBirth(),
                    c.getGender(),
                    c.getEmail(),
                    c.getCountry(),
                    c.getContact(),
                    c.getPassportNum(),
                    c.getUser().getId()
                });
    }
}
