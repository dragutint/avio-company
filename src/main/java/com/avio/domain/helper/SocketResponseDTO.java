package com.avio.domain.helper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SocketResponseDTO {
    private Integer flightId;
    private Integer freeSeatsBu;
    private Integer freeSeatsEc;
}
