class Play.Views.SongView
  el: "#now-playing"
  template: "song"

  constructor: (json) ->
    @id      = json['id']
    @name    = json['name']
    @artist  = json['artist']
    @album   = json['album']
    # @starred = json['starred']
    # @queued  = json['queued']

  render: ->
    rendered = Mustache.to_html(Play.Templates[this.template], this, Play.Templates)
    $(this.el).html(rendered)


class Play.Views.SongListView
  el: "#songs"
  template: "song_list"
  constructor: (@songs) ->

  render: ->
    rendered = Mustache.to_html(Play.Templates[this.template], this, Play.Templates)
    $(this.el).html(rendered)
