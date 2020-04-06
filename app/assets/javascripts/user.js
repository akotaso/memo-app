$(function(){
  $("#group_form_member-search").on("keyup",function(){
    let input= $("#group_form_member-search").val();
    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input},
      dataType: "json"
    })
      .done(function(users){
        console.log("成功です");
      })
      .fail(function(){
        console.log("失敗です");
      });
  });
});