package com.avio.domain.helper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FlightChange {
    private Integer id;
    private Integer flightId;
    @DateTimeFormat(pattern = "YYYY-MM-DD HH:mm:ss")
    private Date changeDate;
    private Boolean processed;
}
