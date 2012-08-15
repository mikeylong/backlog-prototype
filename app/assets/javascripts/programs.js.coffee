jQuery ->
  if $('.programs.show').length > 0
    $(".objectives").sortable
      handle: '.handle'
      tolerance: 'pointer'
      containment: 'parent'
      update: (event, ui) ->
        objective_ids = []
        $('.objective').each (index, item) ->
          objective_ids.push $(item).data('objective-id')
        $.post '/programs/prioritize', { 'objective_ids' : objective_ids }
    $('.compare_checkbox').change (event) ->
      objectives = []
      costs = []
      values = []
      $('.objectives input:checked').each (index, checkbox) ->
        checkbox = $(checkbox)
        objectives.push checkbox.data('title')
        costs.push checkbox.data('cost')
        values.push checkbox.data('value')
      new Highcharts.Chart
        title:
          text: ''
        chart:
          renderTo: 'chart'
          type: 'column'
        series: [{name: 'Value', data: values}, {name: 'Cost', data: costs}]
        xAxis: {
          categories: objectives
        }
