$(document).ready(function(){
  var updateFlag = function(obj){
    var item = $('#user-'+obj.id);
    if(obj.status){
      item.removeClass('unavailable').addClass('available');
    } else {
      item.removeClass('available').addClass('unavailable');
    }
  };

  $('#flag-container li').on('click', function(){
    var uid = (this.id).replace(/user-/gi,"");
    console.log(uid);
    $.ajax({
      type:'get',
      url: '/flag/' + uid,
      dataType: 'json'
    }).done(function(response) {
      console.log(response);
      updateFlag(response);
    }).fail(function(response){
      console.log("FAIL");
      console.log(response);
    });

  });

});