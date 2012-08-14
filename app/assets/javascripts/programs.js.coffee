jQuery ->
  if $('.programs.show').length > 0
    $(".objectives").sortable
      handle: '.handle'
      update: (event, ui) ->
        objective_ids = []
        $('.objective').each (index, item) ->
          objective_ids.push $(item).data('objective-id')
        $.post '/programs/prioritize', { 'objective_ids' : objective_ids }
          