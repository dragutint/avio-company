package com.avio.dao;

import com.avio.dao.rowmapper.ClientRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.administration.Client;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ClientDao extends AbstractJDBCDao {

    public List<Client> find() {
        return jdbcTemplate.query(queries.getSQL("select.clients"), new ClientRowMapper());
    }

    public Client getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.client.by.id"), Client.class, new ClientRowMapper(), id);
    }
}
