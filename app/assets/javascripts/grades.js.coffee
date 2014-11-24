jQuery ->

  # $('table#grades').on 'click', 'input.grade-radio', (e) ->
  #   console.log('click')

  # $('table#grades').on 'change', 'input', (e) ->
  #   $(this).parents('form').submit()

  $('table#grades input, table#grades textarea').change ->
    $(this).closest('form').submit()

# fireTogetherJSVisibility = ->
#   alert('a')

# TogetherJSConfig_on_ready = ->
#   MyApp.on("formUpdate", fireTogetherJSVisibility)

# TogetherJSConfig_on_close = ->
#   MyApp.off("formUpdate", fireTogetherJSVisibility)