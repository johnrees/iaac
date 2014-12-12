jQuery ->

  # $('body.c-courses.a-index a.inactive').closest('li').hide()

  $('#toggle-all').click ->
    val = $(this).is(':checked')
    console.log val
    $('table input[type=checkbox]').prop('checked', val)

  $('#student-ids').selectize()
  $('#tutor-ids').selectize()

  if $('#tutor-members').length > 0
    sortable = new Sortable document.getElementById('tutor-members'), {
      animation: 150
      handle: '.handle'
    }

    $('form.edit_course').submit ->
      $(this).find('.nested-fields').each ->
        $(this).find('input.ordinal').val( $(this).index() )
