package com.avio.bl.dao.rowmapper;

import com.avio.bl.dao.util.AbstractMapper;
import com.avio.domain.ClassType;
import com.avio.domain.helper.FlightChange;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class FlightChangeRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        FlightChange fc = new FlightChange();
        fc.setId(getInteger("id"));
        fc.setFlightId(getInteger("flight_id"));
        fc.setChangeDate(getDate("date_time_change"));
        fc.setProcessed(getInteger("processed") == 1);
        return fc;
    }
}
