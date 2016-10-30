$ ->
  $("[data-link]").click ->
    window.location = $(this).data("link")
  
  $(".dropdown-toggle").dropdown()
