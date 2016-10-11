  $(window).load ->
    $("#user_postal_code").jpostal({
      postcode : [ "#user_postal_code" ],
      address : { 
        "#user_address_level1" : "%3", 
        "#user_address_level2" : "%4",
        "#user_address_line1" : "%5",
        "#user_address_line2" : "%6"
        }
    })