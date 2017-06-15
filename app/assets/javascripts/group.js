$(function(){
  function buildHTML(user){
    var html =
    '<div class="chat-group-user clearfix">'
    +'<p class="chat-group-user__name">'
    + user.name
    +'</p>'
    +'<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="<%= user.id %>" data-user-name="<%= user.name %>">'
    +'追加'
    +'</a>'
    +'</div>'
    return html;
  }

  $('#user-search-field').keyup(function() {
      var val = $("#user-search-field").val();
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: val },
        dataType: 'json'
      })

    .done(function(data) {
      data.forEach(function(user){
        var html = buildHTML(user);
        $('.chat-group-form__search.clearfix').append(html);
      })
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      $("#XMLHttpRequest").html("XMLHttpRequest : " + jqXHR.status);
      $("#textStatus").html("textStatus : " + textStatus);
      $("#errorThrown").html("errorThrown : " + errorThrown);
    })
  });
})
