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
    var user = $( tag + '#' + UserIdStatus.id);
    
    if(UserIdStatus.status === "unavailable"){
      user.removeClass('available').addClass('unavailable');
    } else {
      user.removeClass('unavailable').addClass('available');
    }
  };

  var updateListStatus = function(){
    $.ajax({
      type: 'post',
      dataType: 'json',
      url: '/check_updates',
      data: "u_ids=2,3"
    }).done(function(response){
      var fullList = response;
      console.log(fullList);
    }).fail(function(response){
      console.log("FAIL: " + response);
    });

  };

  $('#btn').on('click', updateListStatus);

});