$(document).ready(function(){

  $('#header img.avatar').on('click', function(){    
    $.ajax({
      type: 'put',
      url:  '/user/' + this.id + '/' + getStatusClass(this),
      dataType: 'json'
    }).done(function(response) {
      updateUserStatus(response, 'img');
    });
  });

  // A helper funtion to scour the classes of the given
  // DOM object and return one of the relavant classes
  var getStatusClass = function(elm){
    if ($(elm).hasClass('available')){
      return "available";
    } else if ($(elm).hasClass('unavailable')) {
      return "unavailable";
    } else {
      return "";
    }
  };

  var updateUserStatus = function(UserIdStatus, tag){
    if (tag == 'img'){
      var user = $('img#' + UserIdStatus.id);
    } else {
      var user = $('li#' + UserIdStatus.id);
    }
    
    if(UserIdStatus.status === "unavailable"){
      user.removeClass('available').addClass('unavailable');
    } else {
      user.removeClass('unavailable').addClass('available');
    }
  };

});