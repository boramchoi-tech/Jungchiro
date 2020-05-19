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
		/* display: inline-block; */
		width: 100%;
		line-height: 50px;
		color: white;
		text-align: center;
	}
	
	#chat_exit{
		position: absolute;
	    left: 85%;
	    z-index: 99999;
	    line-height: 50px;
	    color: white;
	}
	
	#sendChat {
		position: fixed;
		bottom: 0;
		width: 100%;
		line-height: 50px;
		background-color: black;
	}
	
	#chatMessageArea{
		height: 430px;
		overflow: auto;
	}
	
	#chatMessageArea {
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		list-style-type: none;
		margin: 0 auto;
		padding: 8px;
	}
	
	#chatMessageArea .message_content {
	 	background: #eee;
  		border-radius: 8px;
 		padding: 8px;
 		margin: 2px 8px 2px 0;
	}
	
/* 	.messages li.ours {
  align-self: flex-end;  Stick to the right side, please! 
  margin: 2px 0 2px 8px;
} */
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var wsocket;
	var uri = "ws://localhost:8090/poli/chatws.do?chat_seq="+${chat.chat_seq};
	
	//웹소켓 생성
	wsocket = new WebSocket(uri);
	wsocket.onopen = onOpen;
    wsocket.onmessage = onMessage;
    wsocket.onclose = onClose;
    
    //웹소켓 연결 시
    function onOpen(evt) {
        //appendMessage("연결되었습니다.");
    }
	
    //퇴장
    function disconnect() {
        wsocket.close();
    }

	// 이는 서버로부터 메세지가 도착했을 때 호출 
    function onMessage(evt) {
        var data = evt.data;
        var messageToJSON = JSON.parse(data);
        appendMessage("<li class='message_id'>" + messageToJSON.message_id + "&nbsp;&nbsp;" + messageToJSON.message_time + "</li><br>");
        appendMessage("<li class='message_content'>" + messageToJSON.message_content + "</li><br>");
    }
    
    // WebSocket 인터페이스의 연결상태가 readyState 에서 CLOSED 로 바뀌었을 때 호출 이벤트 리스너.
    // 이 이벤트 리스너는 "close"라는 이름의 CloseEvent를 받는다.
    function onClose(evt) {
        appendMessage("연결을 끊었습니다.");
    }
    
    
    
	function send() {
		var today = new Date();

        var msg = $("#message").val();
        wsocket.send("${chat.chat_seq}&nbsp;&nbsp;${chat.member_id}&nbsp;&nbsp;"+today.toLocaleTimeString()+"<br>" + msg);
        $("#message").val("");
    }
	

    // onMessage()에 내장된 함수로 받은 메세지를 채팅 내역에 추가시키는 기능을 한다.
    function appendMessage(msg) {
        
        // 메세지 입력창에 msg를 하고 줄바꿈 처리
        $("#chatMessageArea").append(msg);
        
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
    	
    	$('#message').keypress(function(event){								// 키보드 고유 번호 판별
    		var keycode = (event.keyCode ? event.keyCode : event.which);
    		
    		if (keycode == '13') {											// 고유 번호가 13이면 send() (=> 고유번호 13: enter key)
    			var msgChk = $('#message').val();
    			if(msgChk != "") {
	    			send();
    				
    			}
    			
    		}
    		event.stopPropagation();
    	});
    	
    	$('#sendBtn').click(function() {
    		var msgChk = $('#message').val();
			if(msgChk != "") {
    			send();
				
			}
    	})
    	
    	$('#exitBtn').click(function() {
    		disconnect();
    	})
    });
	
</script>
</head>
<body onresize="parent.resizeTo(400,600)" onload="parent.resizeTo(400,600)">
	<div id="chat_exit">
		<input type="button" id="exitBtn" value="나가기">
	</div>
	
	<div id="chat_header">
		<div id="chat_name">
			${chat.chat_name }
		</div>
		
	</div>

    <div id="chatArea">
    	<div id="chatMessageArea">
    		<c:choose>
    			<c:when test="${empty chatMessage }">
    				채팅방을 생성하였습니다.<br>
    			</c:when>
    			
    			<c:otherwise>
    				<c:forEach items="${chatMessage }" var="chatMessage">
    					보낸 시각 : ${chatMessage.message_time }<br>
    					${chatMessage.member_seq }님의 말 : ${chatMessage.message_content }
    					<br><br>
    				</c:forEach>
    			</c:otherwise>
    		</c:choose>
    	</div>
    </div>
    
    <div id="sendChat">
	    <input type="text" id="message">
		<input type="button" id="sendBtn" value="전송">
    </div>
</body>
</html>