$(function(){
  // おみくじの配置
  // 0～4の間で乱数を取得し、その数字を基に棒とアイコンの画像を配置
  randNum = Math.floor(Math.random() * 5);
  $('#bou').html('<img src="/assets/bou' + randNum + '.png">');
  $('#icon').html('<img src="/assets/icon' + randNum + '.png">');
  // floor関数：小数点以下の値を切り捨てた結果を返す
  // random関数：乱数を返す

  // ボタンが消えたらおみくじの箱が移動、
  // 移動したら棒が出て来るアニメーション、
  // 棒が出てきたらアイコンが出現という様に、
  // 一つのアニメーションが完了した時点で次の処理を実行させていく

  // スタートボタンをクリック
  $("#startBtn").click(function(){
    // スタートボタンを非表示に ＊opacity：透明度
    $(this).stop().animate({ opacity: 0}, 500, 
    function(){
      // #omikujiを回転させながら移動
      $('#omikuji').css({ transform: "rotate(-120deg)" });
      // $('#omikuji').rotate({animateTo:-120});
      $('#omikuji').stop().animate({ top: "200px", left: "-100px"}, 1000, 'easeOutCubic',
      function(){
        // おみくじの結果が書かれた棒が出現 *delay():キューを遅延実行させるための時間を指定
        $('#bou img').stop().delay(300).animate({ marginTop: "0", marginLeft: "0"}, 800, 'easeOutBounce',
        function(){
          // アイコンが出現
          $('#icon').delay(500).animate({
            opacity: 1,
            "marginTop" : "-225px",
            "marginLeft" : "-225px",
            "width" : "450px",
          }, 1000, "easeOutBounce",
          function() {
            $('#return').css({ opacity: 0.8})
          });
        });
      });
    });
  });
  
});