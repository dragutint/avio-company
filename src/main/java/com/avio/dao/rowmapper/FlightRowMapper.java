package com.avio.dao.rowmapper;

import com.avio.dao.AeroplaneDao;
import com.avio.dao.AirportDao;
import com.avio.dao.PilotDao;
import com.avio.dao.util.AbstractMapper;
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
    private AirportDao airportDao;
    @Autowired
    @Lazy
    private PilotDao pilotDao;

    @Override
    protected Object mapRow() throws SQLException {
        Flight f = new Flight();
        f.setId(getInteger("id"));
        f.setAeroplane(aeroplaneDao.getById(getInteger("aeroplane_id")));
        f.setPilot(pilotDao.getById(getInteger("pilot_id")));
        f.setAirportDep(airportDao.getById(getInteger("airport_dep_id")));
        f.setAirportArr(airportDao.getById(getInteger("airport_arr_id")));
        f.setDateCreated(getDate("date_created"));
        f.setDateUpdated(getDate("date_updated"));
        f.setDurationInMin(getInteger("duration"));
        f.setGate(getString("gate"));
        f.setFreeSeatsBu(getInteger("free_seats_bu"));
        f.setFreeSeatsEc(getInteger("free_seats_ec"));
        f.setPriceBu(getDouble("price_bu"));
        f.setPriceEc(getDouble("price_ec"));
        f.setTimeDep(getDate("time_dep"));
        f.setTimeArr(getDate("time_arr"));
        return f;
    }
}
