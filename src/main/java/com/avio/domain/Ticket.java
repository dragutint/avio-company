package com.avio.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {
    private Integer id;
    private String firstName;
    private String lastName;
    private Double price;
    private Long passportNum;
    private Reservation reservation;
    private ClassType classType;
}
