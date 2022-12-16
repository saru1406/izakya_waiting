//最上部へ戻るボタンで0.8sかけて戻る
$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

//スライドショーを自動で再生
$(function () {
  $("#theTarget").skippr({
    transition : 'fade',
    speed : 1000,
    easing : 'easeOutQuart',
    navType : 'bubble',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : true,
    autoPlayDuration : 4000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});