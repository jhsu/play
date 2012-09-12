$(document).ready () ->
  $('#queue-results header a').click () ->
    clearSearch()

  # Refreshes the Queue.
  $('.queue').click () ->
    renderQueue()
    false

  # Searches things.
  $('#search').submit () ->
    keyword = $('#search').find('input')[0].value
    updateSongs("/search?q=#{keyword}", "GET")
    false

  # Queues up this song.
  #
  # data-song-id - The Data attribute set on the link whose value is the
  #                persistent ID of the song.
  $(document).on 'click', '.add-to-queue', () ->
    element = $(@)
    path = element.data('song-path')
    $.ajax
      url: '/queue',
      type: 'POST',
      data:
        path: path
      success: (response) ->
        # [TODO]: notify user that song has been added
    false

  # Removes this song from the queue.
  #
  # data-song-id - The Data attribute set on the link whose value is the
  #                persistent ID of the song.
  $(document).on 'click', '.remove-from-queue', () ->
    element = $(@)
    id = element.data('song-id')
    $.ajax
      url: '/queue',
      type: 'DELETE',
      data:
        id: id
      success: (response) ->
        # [TODO]: maybe just handle this clientside
        renderQueue()
    false

  $(document).on 'click', '#pause', () ->
    $.ajax
      url: '/pause'
      type: 'PUT'
      success: (response) ->
        renderControls()
        renderNowPlaying()
    false

  $(document).on 'click', '#play', () ->
    $.ajax
      url: '/play'
      type: 'PUT'
      success: (response) ->
        renderControls()
        renderNowPlaying()
    false
