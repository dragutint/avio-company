var path = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

$('#btnSavePassengers').click(function () {
    var numberOfPassengers = $(this).data('passengers');
    var reservationId = $(this).data('reservationid');
    var list = [];

    for(var i = 1; i <= numberOfPassengers; i++){
        var passengerInfo = {};
        passengerInfo.firstName = $('#first-name-' + i).val();
        passengerInfo.lastName = $('#last-name-' + i).val();
        passengerInfo.classType = $('#class-' + i).val();
        passengerInfo.price = $('#price-' + i).val();
        passengerInfo.passport = $('#passport-' + i).val();
        list.push(passengerInfo);
    }

    var obj = { reservationID: reservationId, list: list};

    $.ajax({
        url: path + '/tickets/passengers-info',
        dataType: 'json',
        type: 'post',
        contentType : 'application/json',
        data: JSON.stringify(obj),
        success: function (data) {
            console.log(data);
            window.location.href = path + '/reserve/preview/' + data;
        },
        error: function (xhr) {
            console.log(xhr);
        }
    });
});

function generatePrice(priceEc, priceBu, id) {
    if($('.classType').val() == 1){
        $('#price-' + id).val(priceEc);
    } else {
        $('#price-' + id).val(priceBu);
    }
}