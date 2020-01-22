package com.avio.bl.dao.rowmapper;

import com.avio.bl.dao.AeroplaneDao;
import com.avio.bl.dao.PilotDao;
import com.avio.bl.dao.util.AbstractMapper;
import com.avio.domain.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class FlightRowMapper extends AbstractMapper {
    @Autowired
    @Lazy
    private AeroplaneDao aeroplaneDao;
    @Autowired
    @Lazy
    private PilotDao pilotDao;

    @Override
    protected Object mapRow() throws SQLException {
        Flight f = new Flight();
        f.setId(getInteger("id"));
        f.setAeroplane(aeroplaneDao.getById(getInteger("aeroplane_id")));
        f.setPilot(pilotDao.getById(getInteger("pilot_id")));
        f.setAirportDepIata(getString("airport_dep_iata"));
        f.setAirportArrIata(getString("airport_arr_iata"));
        f.setDateCreated(getDate("date_created"));
        f.setDateUpdated(getDate("date_updated"));
        f.setDurationInMin(getInteger("duration"));
        f.setGate(getString("gate"));
        f.setFreeSeats(getInteger("free_seats"));
        f.setPriceBu(getDouble("price_bu"));
        f.setPriceEc(getDouble("price_ec"));
        f.setTimeDep(getDate("time_dep"));
        f.setTimeArr(getDate("time_arr"));
        return f;
    }
}
