$('#airportFrom').select2({
    placeholder: 'Search airports',
    minimumInputLength: 2,
    ajax: {
        delay: 250,
        url: function (params) {
            return 'http://' + window.location.href + '/api/airports/' + params.term;
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
            return 'http://' + window.location.href + '/api/airports/' + params.term;
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