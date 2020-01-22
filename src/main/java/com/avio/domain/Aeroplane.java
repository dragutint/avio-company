package com.avio.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Aeroplane {
    private Integer id;
    private String name;
    private Integer capacity;
}
