$(function () {
  $(document).on('click', '#comment_button', function () {
    var comment = $("#comment_text").val();
    var commentPos = $('#nicoscreen').offset();
    var nico_comment = $('<div id="item" style="font-size: 36px; color: white; font-weight: bold; text-shadow: black 1px 1px 1px; width: 100px; white-space: nowrap; position: absolute;">' + comment + '</li>').appendTo('#nicoscreen');
    var offset = nico_comment.offset({
      top: setPosition('#item'),
      left: commentPos.left + $('#nicoscreen').width()
    });
    var animation = offset.animate({
      left: commentPos.left
    }, {
      duration: 3000,
      easing: 'linear',
      queue: false,
      complete: function () {
        animation.hide();
      }
    });
    // リスト表示
    $('<li id="list_item" class="list-group-item list-group-item-light" color:black">' + comment + '</li>').prependTo('#list');
    $("#comment_text").val("");
  });
});

// コメントの場所を指定
function setPosition(id) {
  var top = $('#nicoscreen').offset();
  var itemHeight = $(id).height();
  var bottom = top.top + $('#nicoscreen').height() - itemHeight;
  var length = bottom - top.top;
  return bottom - length * Math.random();
}
