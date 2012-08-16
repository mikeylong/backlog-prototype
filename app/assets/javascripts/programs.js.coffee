fillChart = (container, objectives, series) ->
  message = ''
  if series.lenght > 0 && series[0].data.length == 0
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

doSerie = (objective, value, cost, series) ->
  series.push
    name: objective
    data: [[value, cost]]

fillGraphChart = ->
  objectives = []
  costs = []
  values = []
  $('.objectives input:checked').each (index, checkbox) ->
    checkbox = $(checkbox)
    if checkbox.data('title').length > 15
      objectives.push checkbox.data('title').substring(0, 15) + '...'
    else
      objectives.push checkbox.data('title')
    costs.push checkbox.data('cost')
    values.push checkbox.data('value')
  series = []
  (doSerie(objectives[i], values[i], costs[i], series) for i in [0..(objectives.length - 1)])
  message = ''
  if series.lenght > 0 && series[0].data.length == 0
    message = 'Select objectives for comparison'
  new Highcharts.Chart
    title:
      text: message
    chart:
      renderTo: 'graph_chart'
      type: 'scatter'
      zoomType: 'xy'
    series: series
    xAxis:
      title:
        enabled: true
        text: 'Value'
      startOnTick: true
      endOnTick: true
      showLastLabel: true
      max: 10
      min: 0
    yAxis:
      title:
        text: 'Cost'
      max: 10,
      min: 0
    tooltip:
      formatter: ->
        this.series.name;
    plotOptions:
      scatter:
        marker:
          radius: 8
          states:
            hover:
              enabled: true
              lineColor: 'rgb(100,100,100)'
            states:
              hover:
                marker:
                  enabled: false

highlight = ->
  $('.compare_checkbox').each (index, checkbox) ->
    checkbox = $(checkbox)
    if $(checkbox).is(':checked')
      $('li[data-objective-id=' + checkbox.data('id') + ']').addClass('highlight')
    else
      $('li[data-objective-id=' + checkbox.data('id') + ']').removeClass('highlight')

fillBars = ->
  objectives = {}
  _($('.compare_checkbox')).each (checkbox) ->
    checkbox = $(checkbox)

    values = {};
    values['value'] = parseInt(checkbox.data('value'))
    values['cost'] = parseInt(checkbox.data('cost'))
    values['ratio'] = parseInt(checkbox.data('ratio'))

    objectives[checkbox.data('id')] = values
  higher_value_objective = _(objectives).max (objective) ->
    objective.value
  higher_cost_objective = _(objectives).max (objective) ->
    objective.cost
  higher_value = higher_value_objective.value
  higher_cost = higher_cost_objective.cost
  _(objectives).each (objective, id) ->
    objective.value_rank = Math.ceil(objective.value / higher_value * 100)
    objective.cost_rank = Math.ceil(objective.cost / higher_cost * 100)
    $('li[data-objective-id=' + id + '] .value .fill').attr('style', 'width: ' + objective.value_rank + '%');
    $('li[data-objective-id=' + id + '] .value .fill').attr('data-original-title', objective.value);
    $('li[data-objective-id=' + id + '] .cost .fill').attr('style', 'width: ' + objective.cost_rank + '%');
    $('li[data-objective-id=' + id + '] .cost .fill').attr('data-original-title', objective.cost);

jQuery ->
  if $('.programs.show').length > 0
    fillBars()
    fillCostAndValueChart()
    fillRatioChart()
    fillGraphChart()
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
    $('.compare_checkbox').change(fillGraphChart)
    $('.compare_checkbox').change(highlight)
    
    $('#charts li a').click (e) ->
      e.preventDefault()
      $(this).tab('show')
      
    $('.fill').tooltip({
      placement: 'right',
      trigger: 'hover'
    })  
    $('.fill').tooltip({
      placement: 'right',
      trigger: 'hover'
    })
