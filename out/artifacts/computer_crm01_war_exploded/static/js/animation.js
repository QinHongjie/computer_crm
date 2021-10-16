$(function(){
	// * * * 动画懒加载实现原理 * * *
	// 初始页面无滚动也加载动画
	animations("move_top");//实现上移入场动画
	animations("move_bottom");//实现下移入场动画
	animations("move_left");//实现左移入场动画
	animations("move_right");//实现右移入场动画
	// 页面滚动监听
	$(window).scroll(function(){
		animations("move_top");//实现上移入场动画
		animations("move_bottom");//实现下移入场动画
		animations("move_left");//实现左移入场动画
		animations("move_right");//实现右移入场动画
	});
	// 封装入场动画函数
	function animations(move){//传入入场动画类型
		// 遍历动画类的所有元素
		$("."+move).each(function(){
			var sTop = $(window).scrollTop();//获取滚动条距页面顶部的距离
			var w_h = $(window).height();//获取浏览器窗口高度
			var d_h = $(this).height();//获取元素高度
			var dTop = $(this).offset().top;//获取元素距页面顶部的距离
			// 判断窗口底部是否已超过元素高度的1/3
			if(dTop+(d_h/3) < sTop+w_h){
				$(this).addClass(move+"_show");//超过 则添加入场动画
			}else if(dTop > sTop+w_h){
				//$(pstr).removeClass(move_mode + "_show");//否则 移除动画 为下一次入场做准备
			}
		});
	}
	
	
	// * * * 图片懒加载实现原理 * * *
	// 一开始没有滚动的时候，出现在视窗中的图片也会加载
	start();

	// 当页面开始滚动的时候，遍历图片，如果图片出现在视窗中，就加载图片
	var clock; //函数节流
	$(window).on('scroll',function(){
		if(clock){//如果已有定时器则清除,防止重复,定时器错乱
			clearTimeout(clock);
		}
		clock = setTimeout(function(){
			start();
		},5)
	})
	
	function start(){
		// 遍历所有还没有加载的图片
		 $('img').not('[data-isLoading]').each(function () {
			if (isShow($(this))) {
				loadImg($(this));
			}
		})
	}

	// 判断图片是否出现在视窗的函数
	function isShow($node){
		return $node.offset().top <= $(window).height()+$(window).scrollTop();
	}

	// 加载图片的函数，就是把自定义属性data-src 存储的真正的图片地址，赋值给src
	function loadImg($img){
		
		$img.attr('src', $img.attr('data-src'));
		
		// 已经加载的图片，我给它设置一个属性，值为1，作为标识
		// 弄这个的初衷是因为，每次滚动的时候，所有的图片都会遍历一遍，这样有点浪费，所以做个标识，滚动的时候只遍历哪些还没有加载的图片
		$img.attr('data-isLoading',1);
	}
	
});