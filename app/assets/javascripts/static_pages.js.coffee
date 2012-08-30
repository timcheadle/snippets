# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#micropost_content").on "keydown keyup focus blur", ->
    quota = 140 - $(this).val().length
    if quota < 0
      $(".character-count").html(quota).addClass "over-quota"
    else
      $(".character-count").html(quota).removeClass "over-quota"
