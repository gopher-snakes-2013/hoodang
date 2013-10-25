$(document).ready(function(){

  var removeCreateHoodangButton = function() {
    $('#party').remove();
  };

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
    if(UserIdStatus.status === "unavailable"){
      user.removeClass('available').addClass('unavailable');
    } else {
      user.removeClass('unavailable').addClass('available');
    }
  };

  $('#party').click(function(event){
    event.preventDefault();
    removeCreateHoodangButton(); // {removeCreateHoodangButton}removes the button so that we don't get multiple drop-boxes
    $('.drop-box').append('<img src="http://plaink8.web.unc.edu/files/2011/11/aww.jpg"/>');
    $('.drop-box').append('<h3> Drag-In Friends that you would be down to Hoodang with :) </h3>');
  });

  $('.drop-box').on('click', 'img', function(event){
    event.preventDefault();
    console.log("WASSUP");
    console.log(event);

  });

});