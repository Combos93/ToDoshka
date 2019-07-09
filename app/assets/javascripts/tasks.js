// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {
  $('#datetimepicker13').datetimepicker({
  inline: true,
  sideBySide: true
  };
});

$('#datetimepicker1').datetimepicker({
  format: 'MMMM D, YYYY h:mm A',
  stepping: 15,
  minDate: Date(),
  maxDate: new Date(Date.now() + (365 * 24 * 60 * 60 * 1000)),
  sideBySide: true,
  icons: {
    up: 'fas fa-arrow-up',
    down: 'fas fa-arrow-down',
    previous: 'fas fa-chevron-left',
    next: 'fas fa-chevron-right',
    close: 'fas fa-times'
  },
  buttons: {showClose: true }
});
