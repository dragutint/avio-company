var path = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

$('.clientProfile').click(function () {
    var clientId = $(this).data('clientid');

    window.location.href = path + '/client/profile/' + clientId;
});