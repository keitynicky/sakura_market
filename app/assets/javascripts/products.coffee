$ ->
  $('#order_item_quantity').change ->
    $('#add_to_cart_button').prop('disabled', !$('#order_item_quantity').val())

