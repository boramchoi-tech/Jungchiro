<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
<link rel="stylesheet" type="text/css" href="/poli/resources/css/header.css"/>
</head>
<body>

	<div id="role" class="nanum">
		<a href="#layer2" class="btn-example">로그인</a>
		 / 
		관리자 페이지
		 / 
		마이 페이지
		&nbsp;&nbsp;
	</div>

	<div id="header">
		<div id="header_logo">
			<a href="/poli/main.do"><img src="/poli/resources/images/logo.png" style="height: 80px;"></a>		
		</div>
		
		<div id="header_search">
			검색창
		</div>
	</div>
	
	<div id="header_menu" class="nanum">
		뉴스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		지도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		의안정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		자유게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		채팅
	</div>
	
	<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
     <form action="login.do" method="post" id="formbg">
		<input type="hidden" name="command" value="login">
		<table style="width: 100%;">
			<col width="100"/>
			<col width="100"/>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="member_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="member_pw"></td>
			</tr>		
			<tr>
				<td colspan="2" align="center">
				    <input type="submit" value="&nbsp;로그인&nbsp;" id="btn1"><br><br>
				</td>
			</tr>
		</table>
	</form>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">Close</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$('.btn-example').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});
function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });
    
    //회원가입 버튼
    $el.find('a.btn-regist').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut();
        var $layer1 = $(layer1);
        layer_popup($layer1);
        return false;
    });
    
    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}
</script>
</body>
</html>