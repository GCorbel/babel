class @Babel
  @init: ->
    $('.persist').click ->
      $.ajax
        method: 'POST'
        url: 'babel/translations'
