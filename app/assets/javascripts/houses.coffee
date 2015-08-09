
$ ->
  if $('body.houses').size() > 0

    if $('body.houses').hasClass('show')
      $(document).on 'click', 'button.like', (e) ->
        btn = $(@)
        $.post $(@).data('url'), {}, (e) ->
          btn.find('.count').html e.comment.like_count

      # とりま、 3:2 のアスペ比 でグリグリの高さを調整します
      $("iframe#vr").height($("iframe#vr").width() * 2 / 3)

      $('textarea.vote').autosize()

      $(document).on 'ajax:success', '#new_comment', (event, data, status) ->
        $("#comment_body").val("").focus()
        comment = $(data.html)
        comment.addClass("inserted")
        $("#comment-list").prepend comment
        setTimeout(->
          comment.removeClass("inserted")
        , 1000)

