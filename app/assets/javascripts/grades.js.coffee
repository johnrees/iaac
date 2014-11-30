setGrade = (element) ->
  grade = element.data('grade')
  element.closest('tr').find('.grade').html( grade ).fadeIn().prop('class', "grade #{grade}")

jQuery ->

  $('table#grades input, table#grades textarea').change ->
    $(this).closest('form').submit()

  # $('table#grades input.grade-radio').change ->
  #   setGrade($(this))

  # $('table#grades input.grade-radio:checked').each ->
  #   setGrade($(this))
