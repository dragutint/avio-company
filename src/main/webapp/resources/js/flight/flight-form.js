var path = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

$('#airportFrom').select2({
    placeholder: 'Search airports',
    minimumInputLength: 2,
    ajax: {
        delay: 250,
        url: function (params) {
            return path + '/api/airports/' + params.term;
        },
        dataType: 'json',
        processResults: function (data) {
            var results = [];
            $.each(data || [], function() {
                results.push({
                    id: this.iata_code,
                    text: this.name + '[' + this.iata_code + ']'
                });
            });
            return {
                results: results
            };
        },
        cache: true
    }
});

$('#airportTo').select2({
    placeholder: 'Search airports',
    minimumInputLength: 2,
    ajax: {
        delay: 250,
        url: function (params) {
            return path + '/api/airports/' + params.term;
        },
        dataType: 'json',
        processResults: function (data) {
            var results = [];
            $.each(data || [], function() {
                results.push({
                    id: this.iata_code,
                    text: this.name + '[' + this.iata_code + ']'
                });
            });
            return {
                results: results
            };
        },
        cache: true
    }
});


$('#airportFrom').on('select2:select', function () {
    generateTimeZone($('#airportFrom'), $('.timezoneFrom'));
});

$('#airportTo').on('select2:select', function () {
    generateTimeZone($('#airportTo'), $('.timezoneTo'));
});

function generateTimeZone(input, output){
    var key = 'QWRHIORZIVVB';
    var format = 'json';
    var lat;
    var lng;

    $.ajax({
        url: path + '/api/airports/iata/' + input.val(),
        dataType: 'json',
        success: function (data) {

            lat = data[0].latitude_deg;
            lng = data[0].longitude_deg;

            $.ajax({
                url: 'http://api.timezonedb.com/v2.1/get-time-zone',
                data: {
                    "key": key,
                    "format": format,
                    "by": 'position',
                    "lat": lat,
                    "lng": lng
                },
                dataType: 'json',
                type: "get",
                success: function (response) {
                    output.text(response.zoneName);
                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        }
    });
}

$('#generateArrivalTime').click(function () {
    var key = 'QWRHIORZIVVB';
    var format = 'json';
    var fromTimezone = $('#timezoneFromId').text();
    var toTimezone = $('#timezoneToId').text();
    var flightDuration = $('#flightDuration').val();
    console.log($('#timeDep').val());
    var fromDate = new Date($('#timeDep').val());
    console.log(fromDate);
    var toDate = new Date(fromDate.getTime() + flightDuration*60000);
    var toDateTimestamp = Math.round(toDate.getTime()/1000);

    $.ajax({
        url: 'http://api.timezonedb.com/v2.1/convert-time-zone',
        data: {
            "key": key,
            "format": format,
            "from": fromTimezone,
            "to": toTimezone,
            "time": toDateTimestamp
        },
        type: "get",
        dataType: 'json',
        success: function (response) {
            var toTimezoneGeneratedTimestamp = response.toTimestamp;
            var momentDate = new moment(toTimezoneGeneratedTimestamp * 1000);

            $('#timeArr').val(momentDate.format('YYYY-MM-DD HH:mm:ss'));
        },
        error: function (xhr) {
            console.log(xhr);
        }
    });
});