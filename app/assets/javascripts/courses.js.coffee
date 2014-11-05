jQuery ->
  if $("#chart").length > 0
    ctx = $("#chart").get(0).getContext("2d")
    myNewChart = new Chart(ctx).Doughnut(window.data,{animateRotate: false})
