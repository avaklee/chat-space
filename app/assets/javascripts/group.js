$(function(){
  function buildHTML(user){
    var html =
    '<div class="chat-group-user clearfix">'
      + '<p class="chat-group-user__name">'
        + user.name
      + '</p>'
    + '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id='
        + user.id
    + ' ' +  "data-user-name="
      + user.name
      +'>'
        +'追加'
        +'</a>'
    +'</div>'
    return html;
  };

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
      $("#textStatus").text("ユーザーの検索に失敗しました");
      $("#errorThrown").html("errorThrown : " + errorThrown);
    })
  })

  function buildHTML2(user){
    var html =
    '<div class="chat-group-user clearfix js-chat-member" id="chat-group-user-8">'
      + '<input name="group[user_ids][]" type="hidden" value="'
        + user.data('userId')
        + '">' + '<p class="chat-group-user__name">'
          + user.data('userName')
        + '</p>'
        + '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn">'
        + '削除'
      +'</a>'
    +'</div>'
    return html;
  };

  $('.chat-group-form__search').on('click', '.chat-group-user__btn--add', function() {
    var addBtn = $(this);
    var html = buildHTML2(addBtn);
    $('.chat-group-form__search.clearfix').append(html);
    $(addBtn).parent().remove();
   });

  $('.chat-group-form__search').on('click', '.js-remove-btn', function() {
    $(this).parent().remove();
  });
});
