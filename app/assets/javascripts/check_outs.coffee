$(window).load ->
  $('#datepicker-container input').datepicker({
    language: "ja",
    format: "yyyy-mm-dd",
    daysOfWeekDisabled: [0,6],     
    startDate: "+" + getDate(3) + "d",
    endDate: "+" + getDate(14) + "d",
    autoclose: true
  })

getDate = (num) ->
  count = 0
  shiftDate = new Date()
  oneDay = 24*60*60*1000
  while count < num - 1
    tmpDate = new Date(shiftDate.setDate(shiftDate.getDate() + 1))
    if tmpDate.getDay() != 0 && tmpDate.getDay() != 6
      count++
  return Math.round(Math.abs((shiftDate.getTime() - new Date().getTime())/(oneDay)))