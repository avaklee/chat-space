$(function() {
  function buildHTML(message) {
    var html =
    '<div class="right_content__middle_content__message">'
      + '<div class="right_content__middle_content__message__user_name">'
      + message.user_name
      +'</div>'
      + '<div class="right_content__middle_content__message__date">'
      + message.created_at
      +'</div>'
      + '<div class="right_content__middle_content__message__comment">'
      + message.body
      + message_image
      + '</div>'
    + '</div>'
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
     var formData = new FormData($(this).get(0));
     var url = $(this).get(0).action;
    $.ajax({
      type: 'POST',
      url: url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      var position = $('#new_message').offset().top;
      $('.right_content__middle_content').append(html);
      $('#message_body').val('');
      $("html, body").animate({scrollTop : position}, {
    });
    .fail(function(jqXHR, textStatus, errorThrown) {
      $("#XMLHttpRequest").html("XMLHttpRequest : " + jqXHR.status);
      $("#textStatus").html("textStatus : " + textStatus);
      $("#errorThrown").html("errorThrown : " + errorThrown);
    })
  });
});
