jQuery ->
  if $("#chart").length > 0
    ctx = $("#chart").get(0).getContext("2d")
    myNewChart = new Chart(ctx).Doughnut(window.data,{
      animateRotate: false
      segmentStrokeWidth : 2
      percentageInnerCutout : 60
      tooltipTemplate : "<%if (label){%><%=label%>: <%}%><%= value %> credits"
    })
    document.getElementById('chart').onclick = (evt) ->
      # console.log myNewChart.getSegmentsAtEvent(evt)
      window.location = "/courses/#{myNewChart.getSegmentsAtEvent(evt)[0].value}"

  $('.alert-box').delay(2000).fadeOut()
  $('textarea').autosize()
  $('#charge_amount_as_decimal, #payment_amount_as_decimal').maskMoney({thousands:' ', decimal:',', allowZero:true, suffix: ' €'})
