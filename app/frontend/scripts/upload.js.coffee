$(document).ready () ->
  $('#fileupload').fileupload({
    dropZone: $('body'),
    dataType: 'json',
    sequentialUploads: true,
    url: '/upload'
  })
