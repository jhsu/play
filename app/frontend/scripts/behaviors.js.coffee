$(document).ready () ->

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
    id = element.data('song-id')
    $.ajax
      url: '/queue',
      type: 'POST',
      data:
        id: id
      success: (response) ->
        # element.replaceWith(queue(id, true))
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
        # element.replaceWith(queue(id, false))
    false
