package com.avio.controller;

import com.avio.config.prop.AppProps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/external-api")
public class ExternalAPIController {

    @Autowired
    private AppProps appProps;

//    @RequestMapping("/airports")
//    @ResponseBody
//    public List<Airport> getAirports() throws UnirestException {
//        HttpResponse<JsonNode> response = Unirest.get("https://v4p4sz5ijk.execute-api.us-east-1.amazonaws.com/anbdata/airports/locations/operational-list")
//                .queryString("api_key", appProps.getAirportApiKey())
//                .queryString("airports", "")
//                .queryString("states", "SRB")
//                .queryString("format", "json")
//                .asJson();
//
//        JSONArray res = response.getBody().getArray();
//        List<Airport> airports = new ArrayList<>();
//
//        for (int i = 0; i < res.length(); i++){
//            JSONObject obj = res.getJSONObject(i);
//            Airport a = new Airport();
//
//            a.setIata(obj.getString("airportCode"));
//            a.setName(obj.getString("airportName"));
//
//            if(a.getIata() != null && !a.getIata().isEmpty())
//                airports.add(a);
//        }
//
//        return airports;
//    }
}
