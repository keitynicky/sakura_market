$(window).load ->
  $('#datepicker-container input').datepicker({
    language: "ja",
    format: "yyyy-mm-dd",
    daysOfWeekDisabled: [0,6],     
    startDate: "+3d",
    endDate: "+14d",
    autoclose: true
  })