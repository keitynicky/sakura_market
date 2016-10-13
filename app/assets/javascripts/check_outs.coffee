$(window).load ->
  $('#datepicker-container input').datepicker({
    language: "ja",
    format: "yyyy年mm月dd日",
    daysOfWeekDisabled: [0,6],     
    startDate: "+3d",
    endDate: "+14d",
    autoclose: true
  })