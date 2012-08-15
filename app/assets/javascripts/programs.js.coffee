fillChart = (container, objectives, series) ->
  message = ''
  if series[0].data.length == 0
    message = 'Select objectives for comparison'
  new Highcharts.Chart
    title:
      text: message
    chart:
      renderTo: container
      type: 'column'
    series: series
    xAxis:
      categories: objectives
    yAxis:
      title:
        text: ''
      labels:
        enabled: false
    plotOptions:
      series:
        events:
          mouseOver: (event) ->
            debugger;
            console.log(event)
          mouseOut: ->
            console.log('out')

fillCostAndValueChart = ->
  objectives = []
  costs = []
  values = []
  $('.objectives input:checked').each (index, checkbox) ->
    checkbox = $(checkbox)
    objectives.push checkbox.data('title')
    costs.push checkbox.data('cost')
    values.push checkbox.data('value')
  series = [{name: 'Value', data: values}, {name: 'Cost', data: costs}]
  fillChart('chart', objectives, series)

fillRatioChart = ->
  objectives = []
  ratios = []
  $('.objectives input:checked').each (index, checkbox) ->
    checkbox = $(checkbox)
    objectives.push checkbox.data('title')
    ratios.push checkbox.data('ratio')

  series = [{name: 'Value / Cost Ratio', data: ratios}]
  fillChart('ratio_chart', objectives, series)

highlight = ->
  $('.compare_checkbox').each (index, checkbox) ->
    checkbox = $(checkbox)
    if $(checkbox).is(':checked')
      $('li[data-objective-id=' + checkbox.data('id') + ']').addClass('highlight')
    else
      $('li[data-objective-id=' + checkbox.data('id') + ']').removeClass('highlight')

jQuery ->
  if $('.programs.show').length > 0
    fillCostAndValueChart();
    fillRatioChart();
    $(".objectives").sortable
      handle: '.handle'
      tolerance: 'pointer'
      containment: 'parent'
      update: (event, ui) ->
        objective_ids = []
        $('.objective').each (index, item) ->
          objective_ids.push $(item).data('objective-id')
        $.post '/programs/prioritize', { 'objective_ids' : objective_ids }
    $('.compare_checkbox').change(fillCostAndValueChart)
    $('.compare_checkbox').change(fillRatioChart)
    $('.compare_checkbox').change(highlight)
    
    $('#charts li a').click (e) ->
      e.preventDefault()
      $(this).tab('show')
