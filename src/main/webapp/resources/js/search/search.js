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
        cache: true,
        dropdownAutoWidth: true,
        allowClear: true,
        theme: "classic"
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
        cache: true,
        dropdownAutoWidth: true,
        allowClear: true,
        theme: "classic"
    }
});

$('.btnReserve').click(function () {
    var flightid = $(this).data('flightid');
    window.location.href = path + "/reserve/" + flightid;
});

var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#greetings").html("");
}

function connect() {
    var socket = new SockJS(window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)) + '/websocket-endpoint');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/flight-change', function (greeting) {
            updatePrice(JSON.parse(greeting.body));
        });
    });
}

function updatePrice(json) {
    var flightId = json['flightId'];
    var freeSeats = json['freeSeats'];

    $('#freeSeats-' + flightId).text(freeSeats);

    if(freeSeats == 0 || freeSeats == null){
        $('#freeSeats-span-' + flightId).addClass("badge-danger");
        $('#btnReserve-' + flightId).attr("disabled", true);
    }
}

connect();