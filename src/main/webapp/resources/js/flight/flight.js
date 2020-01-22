var path = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

$('.deleteFlight').click(function () {
    var flightid = $(this).data('flightid');

    $.ajax({
        url: path + '/flight/delete/' + flightid,
        type: "delete",
        dataType: "json",
        success: function (response) {
            window.location.reload(false);
        },
        error: function (xhr) {
            window.location.reload(false);
        }
    })
});

$('.listReservations').click(function () {
    var flightid = $(this).data('flightid');

    window.location.href = path + '/flight/' + flightid + '/reservations';
});


