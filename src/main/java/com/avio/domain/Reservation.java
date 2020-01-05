package com.avio.domain;

import com.avio.domain.administration.Client;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
    private Integer id;
    private Flight flightFrom;
    private Flight flightTo;
    private Client client;
    private Integer passengersNum;
    private Boolean roundTrip;
    private Boolean payed;
    private Double price;
    private Date dateCreated;
}
