jQuery ->

  $('a.inactive').closest('li').hide()

  $('#toggle-all').click ->
    val = $(this).is(':checked')
    console.log val
    $('table input[type=checkbox]').prop('checked', val)

  $('#student-ids').selectize()
  $('#tutor-ids').selectize()