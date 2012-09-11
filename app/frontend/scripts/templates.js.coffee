Play.Templates = {}

Play.Templates.controls = """
  {{#playing}}
  <a href="/pause" id="pause">Pause</a>
  {{/playing}}

  {{^playing}}
  <a href="/play" id="play">Play</a>
  {{/playing}}
"""

Play.Templates.now_playing = """
  <div class="song">
    <ul class="song-info">
      <li>{{artist}}</li>
      <li>{{name}}</li>
    </ul>
  </div>
"""

Play.Templates.song = """
  <div class="song">
    <ul class="song-info"">
      <li>{{artist}}</li>
      <li>{{name}}</li>
    </ul>

    <ul class="song-actions">
      <li>{{>queueing}}</li>
    </ul>

  </div>
"""

Play.Templates.song_list = """
  <div class="list">
    {{#songs}}
      {{>song}}
    {{/songs}}
  </div>
"""

Play.Templates.queueing = """
  {{#queued}}
    <a href="/queue/remove" class="remove-from-queue" data-song-id="{{id}}">remove from queue</a>
  {{/queued}}

  {{^queued}}
    <a href="/queue/add" class="add-to-queue" data-song-path="{{path}}">add to queue</a>
  {{/queued}}
"""
