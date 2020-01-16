var path = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

$('.deleteFlight').click(function () {
    var flightid = $(this).data('flightid');
    console.log(flightid);

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

$('.changeFlight').click(function () {
    var fightid = $(this).data('flightid');


});

