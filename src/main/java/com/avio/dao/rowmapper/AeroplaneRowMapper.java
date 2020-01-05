package com.avio.dao.rowmapper;

import com.avio.domain.Aeroplane;

import java.sql.SQLException;

public class AeroplaneRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        Aeroplane a = new Aeroplane();
        a.setId(getInteger("id"));
        a.setName(getString("name"));
        return a;
    }
}
