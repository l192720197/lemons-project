
layui.define(['element','laypage','jquery','laytpl'],function(exports){
  var element = layui.element
  ,laypage = layui.laypage
  ,$ = layui.jquery
  ,laytpl = layui.laytpl;
  

 


  // start 导航显示隐藏
  
  $("#mobile-nav").on('click', function(){
    $("#pop-nav").toggle();
  });

  // end 导航显示隐藏




  //start 评论的特效
  
  (function ($) {
    $.extend({
        tipsBox: function (options) {
          

          $("body").append("<span class='num'>" + options.str + "</span>");

          var box = $(".num");
          var left = options.obj.offset().left + options.obj.width() / 2;
          var top = options.obj.offset().top - 10;
          
          box.animate({
            "font-size": options.endSize,
            "opacity": "0",
            "top": top - parseInt(options.endSize) + "px"
          }, options.interval, function () {
            box.remove();
            options.callback();
          });
        }
      });
  })($); 

  function niceIn(prop){
    prop.find('i').addClass('niceIn');
    setTimeout(function(){
      prop.find('i').removeClass('niceIn'); 
    },1000);    
  }

  $(function () {
    $(".like").on('click',function () {
     
      if(!($(this).hasClass("layblog-this"))){
        $(this).addClass('layblog-this');
        $.tipsBox({
          obj: $(this),
          callback: function () {
          }
        });
        niceIn($(this));
        layer.msg('删除成功', {
          icon: 6
          ,time: 1000
        })
      } 
    });
  });

  //end 评论的特效



  //end 提交
  $('#item-btn').on('click', function(){
    var elemCont = $('#LAY-msg-content')
    ,content = elemCont.val();
    if(content.replace(/\s/g, '') == ""){
      layer.msg('请输入日记名');
      return elemCont.focus();
    }

    var view = $('#LAY-msg-tpl').html()

    //模拟数据
    /*,data = {
      username: '柠檬'
      ,avatar: '../res/static/images/info-img.png'
      ,praise: 0
      ,content: content
    };*/

    //模板渲染
    laytpl(view).render(data, function(html){
      $('#LAY-msg-box').prepend(html);
      elemCont.val('');
      layer.msg('提交成功', {
        icon: 1
      })
    });

  })

  // start  图片遮罩
  var layerphotos = document.getElementsByClassName('layer-photos-demo');
  for(var i = 1;i <= layerphotos.length;i++){
    layer.photos({
      photos: ".layer-photos-demo"+i+""
      ,anim: 0
    }); 
  }
  // end 图片遮罩


  //输出test接口
  exports('blog', {});
});  
