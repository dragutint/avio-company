package com.avio.dao.rowmapper;

import com.avio.dao.util.AbstractMapper;
import com.avio.domain.Aeroplane;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class AeroplaneRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        Aeroplane a = new Aeroplane();
        a.setId(getInteger("id"));
        a.setName(getString("name"));
        a.setCapacityBu(getInteger("capacity_bu"));
        a.setCapacityEc(getInteger("capacity_ec"));
        return a;
    }
}
