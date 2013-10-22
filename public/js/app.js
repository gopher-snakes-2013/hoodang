app.js
$(document).ready(function(){
  var toggleFlag = function(DOM_node){
    if(DOM_node.attr('class').contains('available')){
      //remove .available and add .unavailable
    }
    else {
       //remove .unavailable and add .available
    }

  };

  $('#flag-container li').on('click', function(){

    toggleFlag(this); //question: is 'this' a jQuery object of a js object?
  });


});