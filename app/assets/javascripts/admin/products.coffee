$(window).load ->
    $("#product_photo").change ->
      readURL(this)

readURL = (input) ->
  if (input.files && input.files[0])
      reader = new FileReader()
      reader.onload = (e) ->
        $('#blah').attr 'src', e.target.result
        $ ->
          $('#blah').Jcrop
            onSelect: updateCoords
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
  $('#x').val c.x
  $('#y').val c.y
  $('#w').val c.w
  $('#h').val c.h