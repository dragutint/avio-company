package com.avio.bl.dao.rowmapper;

import com.avio.bl.dao.util.AbstractMapper;
import com.avio.domain.Pilot;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
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
