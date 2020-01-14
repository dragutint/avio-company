package com.avio.dao.util;


import lombok.extern.log4j.Log4j2;
import org.springframework.jdbc.core.RowMapper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@Log4j2
public abstract class AbstractMapper<T> implements RowMapper<T>, Serializable {

    private ResultSet rs;

    public AbstractMapper() {
        super();
    }

    protected abstract T mapRow() throws SQLException;

    @Override
    public T mapRow(ResultSet rs, int rowNum) throws SQLException {

        this.rs = rs;

        return mapRow();
    }

    public int getRowNum() throws SQLException {
        return rs.getRow();
    }

    public ResultSet getResultSet() {
        return rs;
    }

    protected Integer getInteger(String columnLabel) throws SQLException {
        Integer value = rs.getInt(columnLabel);
        return rs.wasNull() ? null : value;
    }

    protected Long getLong(String columnLabel) throws SQLException {
        Long value = rs.getLong(columnLabel);
        return rs.wasNull() ? null : value;
    }

    protected Double getDouble(String columnLabel) throws SQLException {
        Double value = rs.getDouble(columnLabel);
        return rs.wasNull() ? null : value;
    }

    protected String getString(String columnLabel) throws SQLException {
        return rs.getString(columnLabel);
    }

    protected Date getDate(String columnLabel) throws SQLException {
        return new Date(rs.getTimestamp(columnLabel).getTime());
    }


    protected Boolean getBoolean(String columnLabel) throws SQLException {
        return rs.getBoolean(columnLabel);
    }

}