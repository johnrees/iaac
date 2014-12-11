jQuery ->

  # $('body.c-courses.a-index a.inactive').closest('li').hide()

  $('#toggle-all').click ->
    val = $(this).is(':checked')
    console.log val
    $('table input[type=checkbox]').prop('checked', val)

  $('#student-ids').selectize()
  $('#tutor-ids').selectize()

  el = document.getElementById('tutor-members')
  sortable = new Sortable el,
    animation: 150
    handle: '.handle'

  $('form.edit_course').submit ->
    $(this).find('.nested-fields').each ->
      $(this).find('input.ordinal').val( $(this).index() )