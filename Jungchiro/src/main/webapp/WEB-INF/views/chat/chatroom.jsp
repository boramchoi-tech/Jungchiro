<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
<style type="text/css">
	*{
		paddin: 0;
		margin: 0;
	}
	
	#chat_header{
		background-color: #2c2c2c;
	}
	
	#chat_name{
		display: inline-block;
		width: 80%;
		line-height: 50px;
		color: white;
		text-align: center;
	}
	
	#chat_exit{
		float: right;
		line-height: 50px;
		color: white;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="chat_header">
		<div id="chat_name">
			채팅방 이름
		</div>
		
		<div id="chat_exit">
			&nbsp;&nbsp;나가기&nbsp;&nbsp;
		</div>
	</div>
<%-- 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	var wsocket;
	var uri = "ws://localhost:8090/poli/chatws.do?chat_seq="+${chat_seq};
	
	//웹소켓 생성
	wsocket = new WebSocket(uri);
	wsocket.onopen = onOpen;
    wsocket.onmessage = onMessage;
    wsocket.onclose = onClose;
	
    //퇴장
    function disconnect() {
        wsocket.close();
    }
    
    //웹소켓 연결 시
    function onOpen(evt) {
        appendMessage("연결되었습니다.");
    }
    
	 // 이는 서버로부터 메세지가 도착했을 때 호출 
    function onMessage(evt) {
        var data = evt.data;
        if (data.substring(0, 4) == "msg:") {
            appendMessage(data.substring(4));
        }
    }
    
    // WebSocket 인터페이스의 연결상태가 readyState 에서 CLOSED 로 바뀌었을 때 호출 이벤트 리스너.
    // 이 이벤트 리스너는 "close"라는 이름의 CloseEvent를 받는다.
    function onClose(evt) {
        appendMessage("연결을 끊었습니다.");
    }
    
	function send() {
        var nickname = $("#nickname").val();
        var msg = $("#message").val();
        wsocket.send("msg:"+nickname+":" + msg);
        $("#message").val("");
    }
	

    // onMessage()에 내장된 함수로 받은 메세지를 채팅 내역에 추가시키는 기능을 한다.
    function appendMessage(msg) {
        
        // 메세지 입력창에 msg를 하고 줄바꿈 처리
        $("#chatMessageArea").append(msg+"<br>");
        
        // 채팅창의 heigth를 할당
        var chatAreaHeight = $("#chatArea").height();
        
        // 쌓인 메세지의 height에서 채팅창의 height를 뺀다
        // 이를 이용해서 바로 밑에서 스크롤바의 상단여백을 설정한다
        var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
        
        /* .scrollTop(int) : Set the current vertical position of the scroll bar
                             for each of the set of matched elements.*/
        // .scrollTop(int) : 파라미터로 들어간 px 만큼 top에 공백을 둔 채
        //                   스크롤바를 위치시킨다
        $("#chatArea").scrollTop(maxScroll);
    }

    $(document).ready(function() {
       
        $('#message').keypress(function(event){
    
		var keycode = (event.keyCode ? event.keyCode : event.which);
            
       if(keycode == '13'){
                send(); 
            }

            event.stopPropagation();
        });
        $('#sendBtn').click(function() { send(); });
        $('#enterBtn').click(function() { connect(); });
        $('#exitBtn').click(function() { disconnect(); });
    });
	
</script>
</head>
<body>
	
	
    이름:<input type="text" id="nickname">
    <input type="button" id="exitBtn" value="나가기">
    
    <h1>대화 영역</h1>
    
    		<c:choose>
    			<c:when test="${empty chatMessage }">
    				채팅방을 생성하였습니다.
    			</c:when>
    			
    			<c:otherwise>
    				<c:forEach items="${chatMessage }" var="chatMessage">
    					보낸 시각 : ${chatMessage.message_time }<br>
    					${chatMessage.member_seq }님의 말 : ${chatMessage.message_content }
    					<br><br>
    				</c:forEach>
    			</c:otherwise>
    		</c:choose>
    		
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송"> --%>
</body>
</html>