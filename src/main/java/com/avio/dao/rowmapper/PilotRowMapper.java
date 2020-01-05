package com.avio.dao.rowmapper;

import com.avio.dao.util.AbstractMapper;
import com.avio.domain.Pilot;

import java.sql.SQLException;

public class PilotRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        Pilot p = new Pilot();
        p.setId(getInteger("id"));
        p.setFirstName(getString("first_name"));
        p.setLastName(getString("last_name"));
        p.setEmail(getString("email"));
        p.setDateOfBirth(getDate("date_of_birth"));
        p.setLicence(getString("licence"));
        return p;
    }
}
