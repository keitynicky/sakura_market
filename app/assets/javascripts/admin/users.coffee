$(window).load ->
    $("#imgInp").change ->
    readURL(this)

readURL = (input) ->
    if (input.files && input.files[0])
        reader = new FileReader()
        reader.onload ->
            $('#blah').attr('src', e.target.result)
        reader.readAsDataURL(input.files[0])