$(window).load ->
    $("#product_photo").change ->
      readURL(this)

readURL = (input) ->
  if (input.files && input.files[0])
      reader = new FileReader()
      reader.onload = (e) ->
        $('#blah').attr 'src', e.target.result
        $('#preview').attr 'src', e.target.result
        $ ->
          $('#blah').Jcrop
            onSelect: updateCoords
            onChange: updateCoords
            bgOpacity: .4
            setSelect: [
              100
              100
              50
              50
            ]
            aspectRatio: 5 / 4
      reader.readAsDataURL(input.files[0])

updateCoords = (c) ->
  $('#product_x').val c.x
  $('#product_y').val c.y
  $('#product_w').val c.w
  $('#product_h').val c.h
  if parseInt(c.w) > 0
    $('#preview').css
        width: Math.round(100 / c.w * $('#blah').width()) + 'px'
        height: Math.round(100 / c.h * $('#blah').height()) + 'px'  
        marginLeft: '-' + Math.round(100 / c.w * c.x) + 'px'
        marginTop: '-' + Math.round(100 / c.h * c.y) + 'px'