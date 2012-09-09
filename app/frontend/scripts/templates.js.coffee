Play.Templates = {}

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
    <ul class="song-info">
      <li>{{artist}}</li>
      <li>{{name}}</li>
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
