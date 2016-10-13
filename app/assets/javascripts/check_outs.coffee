$(window).load ->
  $('#delivery_date').datepicker({
    language: 'ja',
    format: "yyyy年mm月dd日",
    startDate: "+3d", 
    autoclose: true
  })