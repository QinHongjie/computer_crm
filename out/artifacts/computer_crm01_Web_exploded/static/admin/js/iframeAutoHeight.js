// document.domain = "caibaojian.com";
/*function setIframeHeight(iframe) {
	if (iframe) {
		var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
		if (iframeWin.document.body) {
			iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
		}
	}
};
window.onload = function () {
	setIframeHeight(document.getElementById('external_frame'));
};*/

window.onresize = function () {
    reinitIframe();
}
function reinitIframe(){
    var iframe = document.getElementById("external_frame");
    try{
        var bHeight = iframe.contentWindow.document.body.scrollHeight;
        var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
        var height = Math.min(bHeight, dHeight);
        iframe.height = height+50;
        // console.log(iframe.height);
    }catch (ex){}
}
// 定时触发
window.setInterval("reinitIframe()", 200);