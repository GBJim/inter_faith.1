# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
	$(".vote").on("ajax:send", ->
  	$(this).addClass "loading"
  	return
	).on("ajax:complete", ->
  	$(this).removeClass "loading"
  	return
	).on("ajax:error", ->
  	$(this).after "<div class=\"error\">There was an issue.</div>"
  	return
	).on "ajax:success", (data) ->
  	$(this).html data.count
  	return

