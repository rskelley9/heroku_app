$(document).ready(function() {
  $('#GO').on('click', function(event){
    event.preventDefault();

    var handle = $('#handle').val();
    var radio = $('#see_followers').val();
    var url = "/"+handle+"";

    $('#add_yo_stuff').html("<img src='/gif/ajax-loader.gif'></img>")

    if ($('#see_followers:checked').val() == "true")

    {
      var follower_url = "/followers/"+handle+"";
      $.get(follower_url, function(response) {
        $('#add_yo_stuff').html(response);
      });
    }

    else if ($('#see_tweets:checked').val() == "true")
    {
      $.get(url, function(response){
        $('#add_yo_stuff').html(response);

      });

    }

    else if ($('#tweet_followers:checked').val() == "tweet")
    {
      var tweet_form = "<form id='post_tweet' action='/tweet/handle/text' method='POST'><input id='twitterhandle' type='text' placeholder='Your Twitter Handle' name='handle'><input id='text' type='text' placeholder='Tweet Text' name='text'><input id='tweet' type='submit' value='TWEET!'></form>"
      $('#get_tweet').after(tweet_form)
      $("img[src='/gif/ajax-loader.gif']").addClass("hidden")

      $('#tweet').on('click', function(event){
        event.preventDefault();


        var text = $('#text').val()
        var timestamp = new Date()
        var twitter_handle = $('#twitterhandle').val()
        var data = {handle: twitter_handle, text: text, tweet_time: timestamp}
        var tweet_url = "/tweet/user"

        $.post(tweet_url, data, function(response){
          $('#add_yo_stuff').html(response)
        })

      });
    }

  });

});


 // $.post(tweet_url, data, function(response))