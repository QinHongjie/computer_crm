$(function(){
	
	var loc = location.href;//获取地址url
	var n1 = loc.length;//地址的总长度
	var n2 = loc.indexOf("=");//取得=号的位置
	var active = decodeURI(loc.substr(n2+1));//取得=号后面的内容
	if(active == 1){
		changeRegister();
	}
	// 页面改变为登录页
	function changeLogin(){
		$("#form-login").show();//显示登录
		$("#form-register").hide();//隐藏注册
		$("title").text("数码商场 | 登录");
	}
	// 页面改变为注册页
	function changeRegister(){
		$("#form-login").hide();//隐藏登录
		$("#form-register").show();//显示注册
		$("title").text("数码商场 | 注册");
	}
	
	// 点击注册页中的登录按钮
	$("#changeLogin").click(function(){
		changeLogin();
	});
	
	
	var sleep = 700;//加载时间
	// 点击提交按钮时 显示加载动画
	$(".form-signin button.submit").click(function(){
		$(".loading").show();
		setTimeout(function(){
			$(".loading").hide();
		},sleep);
	});
	
	//注册验证
	// 输入框输入实时验证
	// 验证用户名
	$("#inputRegisterName").on("input propertychange", checkRegisterName);
	// 验证电话号码
	$("#inputTel").on("input propertychange", checkTel);
	// 验证密码
	$("#inputPass1").on("input propertychange", checkPass);
	// 确认密码验证
	$("#inputPass2").on("input propertychange", checkBothPassRight);
	// 点击提交激活验证
	$("#form-register button.submit").click(function(){
		setTimeout(function(){
			if(checkRegisterName() && checkTel() && checkPass() && checkBothPassRight() && checkbox()){
				$("#form-register").attr("onsubmit","return true");
				$("#form-register").submit();
			}
		},sleep);
	});
	
	
	
	
	/*	-	-	-	-	-	特效背景区	-	-	-	-	-	*/ 
	var SEPARATION = 100, AMOUNTX = 50, AMOUNTY = 50;
	
	    var container;
	    var camera, scene, renderer;
	
	    var particles, particle, count = 0;
	
	    var mouseX = 0, mouseY = -350;
	
	    var windowHalfX = window.innerWidth / 2;
	    var windowHalfY = window.innerHeight / 2;
	
	    init();
	    animate();
	
	    function init() {
	
	        container = document.createElement( 'div' );
	        document.body.appendChild( container );
	
	        camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 10000 );
	        camera.position.z = 1000;
	
	        scene = new THREE.Scene();
	
	        particles = new Array();
	
	        var PI2 = Math.PI * 2;
	        var material = new THREE.ParticleCanvasMaterial( {
	
	            color: 0xc4c4c4,
	            program: function ( context ) {
	
	                context.beginPath();
	                context.arc( 0, 0, 1, 0, PI2, true );
	                context.fill();
	
	            }
	
	        } );
	
	        var i = 0;
	
	        for ( var ix = 0; ix < AMOUNTX; ix ++ ) {
	
	            for ( var iy = 0; iy < AMOUNTY; iy ++ ) {
	
	                particle = particles[ i ++ ] = new THREE.Particle( material );
	                particle.position.x = ix * SEPARATION - ( ( AMOUNTX * SEPARATION ) / 2 );
	                particle.position.z = iy * SEPARATION - ( ( AMOUNTY * SEPARATION ) / 2 );
	                scene.add( particle );
	
	            }
	
	        }
	
	        renderer = new THREE.CanvasRenderer();
	        renderer.setSize( window.innerWidth, window.innerHeight );
	        container.appendChild( renderer.domElement );
	
	        document.addEventListener( 'mousemove', onDocumentMouseMove, false );
	        document.addEventListener( 'touchstart', onDocumentTouchStart, false );
	        document.addEventListener( 'touchmove', onDocumentTouchMove, false );
	
	        //
	
	        window.addEventListener( 'resize', onWindowResize, false );
	
	    }
	
	    function onWindowResize() {
	
	        windowHalfX = window.innerWidth / 2;
	        windowHalfY = window.innerHeight / 2;
	
	        camera.aspect = window.innerWidth / window.innerHeight;
	        camera.updateProjectionMatrix();
	
	        renderer.setSize( window.innerWidth, window.innerHeight );
	
	    }
	
	    //
	
	    function onDocumentMouseMove( event ) {
	
	        mouseX = event.clientX - windowHalfX;
	        mouseY = event.clientY - windowHalfY;
	
	    }
	
	    function onDocumentTouchStart( event ) {
	
	        if ( event.touches.length === 1 ) {
	
	            event.preventDefault();
	
	            mouseX = event.touches[ 0 ].pageX - windowHalfX;
	            mouseY = event.touches[ 0 ].pageY - windowHalfY;
	
	        }
	
	    }
	
	    function onDocumentTouchMove( event ) {
	
	        if ( event.touches.length === 1 ) {
	
	            event.preventDefault();
	
	            mouseX = event.touches[ 0 ].pageX - windowHalfX;
	            mouseY = event.touches[ 0 ].pageY - windowHalfY;
	
	        }
	
	    }
	
	    //
	
	    function animate() {
	
	        requestAnimationFrame( animate );
	
	        render();
	
	
	    }
	
	    function render() {
	
	        camera.position.x += ( mouseX - camera.position.x ) * .05;
	        camera.position.y += ( - mouseY - camera.position.y ) * .05;
	        camera.lookAt( scene.position );
	
	        var i = 0;
	
	        for ( var ix = 0; ix < AMOUNTX; ix ++ ) {
	
	            for ( var iy = 0; iy < AMOUNTY; iy ++ ) {
	
	                particle = particles[ i++ ];
	                particle.position.y = ( Math.sin( ( ix + count ) * 0.3 ) * 50 ) + ( Math.sin( ( iy + count ) * 0.5 ) * 50 );
	                particle.scale.x = particle.scale.y = ( Math.sin( ( ix + count ) * 0.3 ) + 1 ) * 2 + ( Math.sin( ( iy + count ) * 0.5 ) + 1 ) * 2;
	
	            }
	
	        }
	
	        renderer.render( scene, camera );
	
	        count += 0.1;
	
	    }
	
	
});