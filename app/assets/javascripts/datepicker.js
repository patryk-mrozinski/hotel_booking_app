$(document).ready(function(){
  $(' .fa-calendar').flatpickr({
    mode: "range",
    onChange: function(selectedDates, dateStr, instance){
      const dates = selectedDates.map(date => this.formatDate(date, "Y-m-d"));
      $('#reservation_reservation_from').val(dates[0]);
      $('#reservation_reservation_to').val(dates[1]);
    },
  });
});
