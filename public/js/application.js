function getTweets () {

  userHandle = $('span').text();
  console.log(userHandle);

  // user={}

  $.ajax({
    url: '/fetch',
    type: 'Post',
    data: {user: userHandle},
    dataType: 'json',
    beforeSend: function () {
      $('.container img').addClass('visible');
    }
  })
  .done(function(response) {
    
    $('.container img').removeClass('visible');

    $.each(response, function(){
      console.log(this);
      console.log(this.tweet.content);
      $('<li>'+this.tweet.content+'</li>').appendTo('ul');

    });

  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });
  
}



$(document).ready(function() {

    getTweets();


});
