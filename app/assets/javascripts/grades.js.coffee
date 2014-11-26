setGrade = (element) ->
  grade = element.data('grade')
  element.closest('tr').find('.grade').html( grade ).fadeIn().prop('class', "grade #{grade}")

jQuery ->

  # $('table#grades').on 'click', 'input.grade-radio', (e) ->
  #   console.log('click')

  # $('table#grades').on 'change', 'input', (e) ->
  #   $(this).parents('form').submit()

  $('table#grades input.grade-radio, table#grades textarea').change ->
    $(this).closest('form').submit()

  $('table#grades input.grade-radio').change ->
    setGrade($(this))

  $('table#grades input.grade-radio:checked').each ->
    setGrade($(this))

# fireTogetherJSVisibility = ->
#   alert('a')

# TogetherJSConfig_on_ready = ->
#   MyApp.on("formUpdate", fireTogetherJSVisibility)

# TogetherJSConfig_on_close = ->
#   MyApp.off("formUpdate", fireTogetherJSVisibility)