var path = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

$('.showReservation').click(function () {
    var reservationId = $(this).data('reservationid');

    window.location.href = path + '/reserve/preview/' + reservationId;
});