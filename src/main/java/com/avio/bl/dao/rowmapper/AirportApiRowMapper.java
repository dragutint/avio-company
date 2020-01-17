package com.avio.bl.dao.rowmapper;

import com.avio.domain.AirportApiClass;
import com.avio.bl.dao.util.AbstractMapper;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class AirportApiRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        AirportApiClass a = new AirportApiClass();
        a.setId(getInteger("id"));
        a.setIdent(getString("ident"));
        a.setType(getString("type"));
        a.setName(getString("name"));
        a.setLatitude_deg(getDouble("latitude_deg"));
        a.setLongitude_deg(getDouble("longitude_deg"));
        a.setElevation_ft(getInteger("elevation_ft"));
        a.setContinent(getString("continent"));
        a.setIso_country(getString("iso_country"));
        a.setIso_region(getString("iso_region"));
        a.setMunicipality(getString("municipality"));
        a.setGps_code(getString("gps_code"));
        a.setIata_code(getString("iata_code"));
        a.setLocal_code(getString("local_code"));
        return a;
    }
}
