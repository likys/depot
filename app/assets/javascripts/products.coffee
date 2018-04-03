# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
App.products=App.cable.subscriptions.create "ProductsChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
            $(".store #main").html(data.html).animate( 1000, () -> 
                console.log(data.id)
                $("#product_#{data.id}").css({'background-color':'#88ff88'}).animate({'background-color':'#fff'},1000);
            )