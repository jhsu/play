//= require_directory ./frameworks
//= require_directory ./plugins

//= require play
//= require views
//= require templates
//= require helpers

//= require behaviors


$(document).ready ->
  renderNowPlaying()
  renderControls()
  renderQueue()
