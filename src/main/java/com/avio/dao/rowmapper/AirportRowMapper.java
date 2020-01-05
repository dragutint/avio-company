package com.avio.dao.rowmapper;

import com.avio.dao.util.AbstractMapper;
import com.avio.domain.Airport;

import java.sql.SQLException;

public class AirportRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        Airport a = new Airport();
        a.setId(getInteger("id"));
        a.setIata(getString("iata"));
        a.setName(getString("name"));
        a.setCountry(getString("country"));
        a.setInternational(getBoolean("international"));
        a.setCity(getString("city"));
        a.setTimeZoneName(getString("time_zone_name"));
        return a;
    }
}
