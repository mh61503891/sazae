
$ ->
  if $('body.houses').size() > 0

    if $('body.houses').hasClass('show')
      $(document).on 'click', 'button.like', (e) ->
        btn = $(@)
        $.post $(@).data('url'), {}, (e) ->
          btn.find('.count').html e.comment.like_count

