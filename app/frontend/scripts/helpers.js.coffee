window.renderQueue = ->
  $.ajax
    url: '/queue',
    dataType: 'json',
    success: (response) ->
      songsView = new Play.Views.SongListView(response.songs)
      songsView.render()

window.renderNowPlaying = ->
  $.ajax
    url: '/now_playing',
    dataType: 'json',
    success: (response) ->
      songView = new Play.Views.SongView(response)
      songView.render()

window.renderControls = ->
  $.ajax
    url: '/now_playing',
    dataType: 'json',
    success: (response) ->
      controlsView = new Play.Views.ControlsView({playing: !!response})
      controlsView.render()

window.updateSongs = (path, method) ->
  $.ajax
    type: method,
    url: path,
    success: (response) ->
      songsView = new Play.Views.SongListView(response.songs)
      songsView.render()

window.clearSearch = ->
  $('#search input').val('')
