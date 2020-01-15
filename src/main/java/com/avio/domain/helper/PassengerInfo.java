package com.avio.domain.helper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PassengerInfo {
    private String firstName;
    private String lastName;
    private Double price;
    private Integer classType;
    private Long passport;
}
