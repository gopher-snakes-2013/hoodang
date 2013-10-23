$(document).ready(function(){

  var updateStatus = function() {
    $('#friend-list li').click(function(event){
      switchKlassOfElement(event.target, event.target.className);
    });
  };

  function switchKlassOfElement (element, availability) {
    if (availability === "status-available"){
      $(element).removeClass('status-available').addClass('status-unavailable');
    }
    else {
      $(element).removeClass('status-unavailable').addClass('status-available');
    }
  }

  updateStatus();

});
