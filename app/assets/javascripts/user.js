$(function(){
  function addUser(user){
    var html= `
      <div class="group_form_member-incri clearfix">
        <p class="group_form_member-incriName">${user.name}</p>
        <div class="addUserButton chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
      </div>
    `;
    $("#group_form_member-search-result").append(html);
  }

  function addNoUser(){
    var html = `
      <div class="group_form_member-incri clearfix">
        <p class="group_form_member-incriName">ユーザーが見つかりません</p>
      </div>
    `;
    $("#group_form_member-search-result").append(html);
  }

  function addDeleteUser(name,id) {
    var html = `
    <div class="chat-group-user clearfix" id="${id}">
      <p class="chat-group-user__name">${name}</p>
      <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $(".js-add-user").append(html);
  }

  function addMember(userId) {
    var html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}" />`;
    $(`#${userId}`).append(html);
  }

  $("#group_form_member-search").on("keyup",function(){
    let input= $("#group_form_member-search").val();
    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input},
      dataType: "json"
    })
      .done(function(users){
        $("#group_form_member-search-result").empty();
        if(users.length !== 0){
          users.forEach(function(user){
            addUser(user);
          });
        }else if(input.length == 0){
          return false;
        }else{
          addNoUser();
        }
      })
      .fail(function(){
        alert("通信エラーです。ユーザーが表示できません");
      });
  });

  $(document).on('click', '.chat-group-user__btn--add', function(){
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    $(this)
      .parent()
      .remove();
    addDeleteUser(userName,userId);
    addMember(userId);
  });
  $(document).on('click','.chat-group-user__btn--remove', function(){
    $(this)
      .parent()
      .remove();
  });
});