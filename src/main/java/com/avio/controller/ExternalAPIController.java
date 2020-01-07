package com.avio.controller;

import com.avio.config.prop.AppProps;
import com.avio.domain.Airport;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/external-api")
public class ExternalAPIController {

    @Autowired
    private AppProps appProps;

    @RequestMapping("/airports")
    @ResponseBody
    public List<Airport> getAirports() throws UnirestException {
        HttpResponse<JsonNode> response = Unirest.get("https://v4p4sz5ijk.execute-api.us-east-1.amazonaws.com/anbdata/airports/locations/operational-list")
                .queryString("api_key", appProps.getAirportApiKey())
                .queryString("airports", "")
                .queryString("states", "SRB")
                .queryString("format", "json")
                .asJson();

        JSONArray res = response.getBody().getArray();
        List<Airport> airports = new ArrayList<>();

        for (int i = 0; i < res.length(); i++){
            JSONObject obj = res.getJSONObject(i);
            Airport a = new Airport();

//            a.setCode(obj.getString("airportCode"));
//            a.setName(obj.getString("airportName"));
//
//            if(a.getCode() != null && !a.getCode().isEmpty())
//                airports.add(a);
        }

        return airports;
    }
}
