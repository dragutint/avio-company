$('#airportFrom').select2({
    placeholder: 'Search airports',
    minimumInputLength: 2,
    ajax: {
        delay: 250,
        url: function (params) {
            return 'http://localhost:8085/aviocompany_war_exploded/api/airports/' + params.term;
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
            return 'http://localhost:8085/aviocompany_war_exploded/api/airports/' + params.term;
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