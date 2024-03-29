package com.avio.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Flight {
    private Integer id;
    private Pilot pilot;
    private Aeroplane aeroplane;
    private String airportDepIata;
    private String airportArrIata;
    private String gate;
    private Integer durationInMin;
    @DateTimeFormat(pattern = "YYYY-MM-DD HH:mm:ss")
    private Date timeDep;
    @DateTimeFormat(pattern = "YYYY-MM-DD HH:mm:ss")
    private Date timeArr;
    private Integer freeSeats;
    private Date dateCreated;
    private Date dateUpdated;
    private Double priceEc;
    private Double priceBu;
}
