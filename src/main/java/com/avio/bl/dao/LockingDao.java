package com.avio.bl.dao;

import com.avio.bl.dao.util.AbstractJDBCDao;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;

@Component
public class LockingDao extends AbstractJDBCDao {
    public Integer insert(Integer clientId){
        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection
                    .prepareStatement(queries.getSQL("insert.lock"));
            ps.setInt(1, clientId);
            return ps;
        }, keyHolder);
        return keyHolder.getKey().intValue();
    }

    public void endLock(Integer lockId){
        jdbcTemplate.update(queries.getSQL("end.lock"), lockId);
    }

    public Integer getLockByFlightId(Integer flightId) {
        return jdbcTemplate.queryForObject(queries.getSQL("check.whether.flight.is.locked"), Integer.class, flightId);
    }

    public Boolean isFinishedLock(Integer lockId) {
        Integer notFinishedCount = jdbcTemplate.queryForObject(queries.getSQL("select.not.ended.lock"), Integer.class, lockId);
        if(notFinishedCount == null || notFinishedCount == 0)
            return true;
        return false;
    }
}
