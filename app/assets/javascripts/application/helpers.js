$.namespace("$.helpers");

$.helpers.update_save_window = function() {
  $('#save_and_continue').modal('show') 
  $('#sign-in').modal('hide')
  $('#sign-up').modal('hide')
  $('.unsigner_user_content').hide();
}

$.helpers.initialize_photos_uploading = function() {
  photos_counter_for_albums = [0,0,0]                                                                                                                                                                     

  for(index=0;index<2;index++) {
    $('.album_'+index).click(function(event) {
      event.preventDefault()      
      album_id = $(this).attr("class").split("album_")[1]
      photos_counter_for_albums[album_id]++
      $("<input id='design_request_room_attributes_photo_albums_attributes_"+album_id+"_photos_attributes_"+photos_counter_for_albums[album_id]+
        "_image' name='design_request[room_attributes][photo_albums_attributes]["+album_id+"][photos_attributes]["+photos_counter_for_albums[album_id]+
        "][image]' type='file'>").appendTo('#album_photos_'+album_id)
      $("<input id='design_request_room_attributes_photo_albums_attributes_"+album_id+"_photos_attributes_"+photos_counter_for_albums[album_id]+
        "_image_cache' name='design_request[room_attributes][photo_albums_attributes]["+album_id+"][photos_attributes]["+photos_counter_for_albums[album_id]+
        "][image_cache]' type='hidden'>").appendTo('#album_photos_'+album_id)
    })
  }

  $('.photo_deleter').click(function(event) {
    event.preventDefault()
    $(this).parent().remove()
  })
}

$.helpers.initialize_invite_request = function() {
  $('.submit-request-invite').click(function(event) {
    event.preventDefault()
    $('.request-invite-form').submit()
  })

  $('.file_deleter').click(function(event) {
    event.preventDefault()
    fileBlock = $(this).parent()
    field = $(this).attr('id')
    fileBlock.empty()
    $("<input id='invite_request_"+field+"' name='invite_request["+field+"]' type='file'>").appendTo(fileBlock)
    $("<input id='invite_request_"+field+"_cache' name='invite_request["+field+"_cache]' type='hidden'>").appendTo(fileBlock)
  })
}
