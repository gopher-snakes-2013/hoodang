$(document).ready(function(){

  $('#flag-container li').on('click', function(){    
    $.ajax({
      type: 'put',
      url:  '/user/' + this.id + '/' + this.className,
      dataType: 'json'
    }).done(function(response) {
      updateUserStatus(response);
    });
  });

  var updateUserStatus = function(UserIdStatus){
    var user = $('li#' + UserIdStatus.id);
    console.log(user);
    console.log(UserIdStatus.status);
    console.log(UserIdStatus.status === 'unavaialable');
    if(UserIdStatus.status === "unavailable"){
      user.removeClass('available').addClass('unavailable');
    } else {
      user.removeClass('unavailable').addClass('available');
    }
  };

});