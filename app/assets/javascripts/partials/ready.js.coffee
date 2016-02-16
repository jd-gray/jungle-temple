# Alert Messages
$(document).ready ->
  setTimeout (->
    $('.notice-alert-messages').fadeOut 'slow', ->
      $(this).remove()
  ), 3000

# Search
$(document).on 'mouseup', (e) ->
	searchContainer = $(".search-field")
	if not searchContainer.is(e.target) and searchContainer.has(e.target).length is 0
	  $('.trigger-search-form').siblings().closest(".form-control").fadeOut()
	  $('.trigger-search-form').siblings().closest(".search-field").removeClass "active"

ready = ->
	$('.trigger-search-form').on 'click', ->
    $(this).siblings().closest('.form-control').fadeToggle('fast')
    $(this).siblings().closest('.search-field').toggleClass 'active'
    $(this).siblings().closest('input').focus()

$(document).ready(ready)
$(document).on('page:load', ready)