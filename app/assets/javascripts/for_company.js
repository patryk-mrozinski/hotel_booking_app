//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap
//= require_tree .

$( document ).ready(function() {

  $('#hotel_country_id').on('change', function(event) {
    var country_id = this.value

    if (country_id) {
      $.get("/api/v1/countries/" + country_id +"/cities", function( cities ) {
        $('#hotel_city_id').find('option').remove()

        $.each(cities, function(index, city) {
          $('#hotel_city_id').append('<option value=' + city.id + '>' + city.name + '</option>');
        });
      });
    } else {
      $('#hotel_city_id').find('option').remove()
    }
  });

});
