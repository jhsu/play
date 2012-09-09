//= require_directory ./frameworks
//= require_directory ./plugins

//= require play
//= require views
//= require templates
//= require helpers


$(document).ready ->
  $.ajax
    url: '/now_playing',
    dataType: 'json',
    success: (response) ->
      if response
        songView = new Play.Views.SongView(response)
        songView.render()

  $.ajax
    url: '/queue',
    dataType: 'json',
    success: (response) ->
      songsView = new Play.Views.SongListView(response.songs)
      songsView.render()
