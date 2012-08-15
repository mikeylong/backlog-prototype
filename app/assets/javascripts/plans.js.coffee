jQuery ->
  if $('.plans.show').length > 0
    $('#backlog_popover').popover({
      placement: 'bottom',
      trigger: 'manual'
    })
    $('#backlog_popover').attr('data-content', $('#backlog-list').html());
    $('#backlog_popover').popover('show')
    
    $(".objective").draggable
      handle: 'handle'
      containment: 'document'
      stack: '.objectives'
    $( "#droppable" ).droppable
      drop: (event, ui) ->
        $(ui.draggable[0]).remove()
        $('#droppable img').attr('src', '/assets/online_retail_timeline_2.png')