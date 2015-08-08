
$ ->
  if $('body.welcome').size() > 0
    console.log "WelcomeController"

    if $('body.welcome').hasClass('index')
      console.log "WelcomeController#index"

