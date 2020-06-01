<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-164964981-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-164964981-1');
</script>
<meta charset="UTF-8">
<title>정치로</title>
<style type="text/css">
	*{
		padding: 0;
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
	    z-index: 1;
	    line-height: 50px;
	    color: white;
	}
	
	#sendChat {
		position: fixed;
		bottom: 0;
 		width: 100%;
		line-height: 50px;
		border-top: 1px solid #2c2c2c;
		background-color: white;
	}
	
	#chatMessageArea{
		height: 430px;
		overflow: auto;
	}
	
	#chatMessageArea {
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		font-size: 0.8em;
		line-height: 1.3em;
		list-style-type: none;
		margin: 0 auto;
		padding: 8px;
	}
	
	#chatMessageArea .message_id_mine {
		align-self: flex-end;
		font-weight: bold;
	}
	
	#chatMessageArea .message_content_mine {
		align-self: flex-end;
	}
	
	#chatMessageArea .message_content_mine .contents_mine {
		background: #007eff;
	 	color: white;
  		border-radius: 8px;
 		padding: 8px;
 		margin: 2px 8px 2px 0;
	}
	
	#chatMessageArea .message_id {
		font-weight: bold;
	}
	
	#chatMessageArea .message_content .contents {
		background: #eee;
  		border-radius: 8px;
 		padding: 8px;
 		margin: 2px 8px 2px 0;
	}
	
	.notice {
		margin: 0 auto;
		color: #999;
		line-height: 2.5em;
		font-weight: bold;
	}
	
	#sendChat #message {
		width: 80%;
		height: 48px;
		border: none;
 		padding-left: 5px;
	}
	
	#sendChat #sendBtn {
		background-color: #007eff;
		border: none;
		color: white;
		width: 66px;
		height: 50px;
	}
	
	#exitBtn{
		background-color: #2c2c2c;
		color: white;
		border: none;
	}
	
	.modal {
        display: none;
        position: fixed;
        z-index: 5;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto; 
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }
    
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 50%;                     
    }
    
    .isExit {
    	background-color: #007eff;
		border: none;
		color: white;
		width: 60px;
		height: 30px;
 		border-radius: 5px 5px 5px 5px; 
    }

	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script type="text/javascript">

	var wsocket;
	//52.231.155.109:8080
	var uri = "ws://52.231.155.109:8080/poli/chatws.do?chat_seq="+${chat.chat_seq};
	
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
        
        if (messageToJSON.message_id == '${chat.member_id}') {
        	appendMessage("<li class='message_id_mine'>" + messageToJSON.message_id + "</li><br>");
            appendMessage("<div class='message_content_mine'>" + "<span class='contents_mine'>" + messageToJSON.message_content + "</span></div><br>");
        	
        } else {
        	appendMessage("<li class='message_id'>" + messageToJSON.message_id + "</li><br>");
        	appendMessage("<div class='message_content'><span class='contents'>" + messageToJSON.message_content + "</span></div><br>");
        	
        }

    }
    
    function onClose(evt) {}
    
	function send() {
		var today = new Date();

        var msg = $("#message").val();
        wsocket.send("${chat.chat_seq}&nbsp;&nbsp;${chat.member_id}&nbsp;&nbsp;"+today+"<br>" + msg + "&nbsp;&nbsp;${chat.member_seq}");
        $("#message").val("");
    }
	

    // onMessage()에 내장된 함수로 받은 메세지를 채팅 내역에 추가시키는 기능을 한다.
    function appendMessage(msg) {
        
        // 메세지 입력창에 msg를 하고 줄바꿈 처리
        $("#chatMessageArea").append(msg);
        
        var scrollHeight = $("#chatMessageArea").prop('scrollHeight'); 
   	    $('#chatMessageArea').animate({scrollTop: scrollHeight}, 250);

    }
    

    $(document).ready(function() {
    	$('#exitModal').hide();
    	
    	var scrollHeight = $("#chatMessageArea").prop('scrollHeight'); 
    	 $("#chatMessageArea").scrollTop(scrollHeight); 
    	 
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
    		$('#exitModal').show();

    	})
    	
    	$('.isExit').click(function() {
    		var chk = $(this).val();
    		
    		if(chk == '아니요') {
    			$('#exitModal').hide();
    			
    		} else {
    			location.href='/poli/exitroom.do?chat_seq=${chat.chat_seq}&member_seq=${member_seq}';
    			
   				disconnect();
   				self.close();
    		}

    	});
    	
    });

	
</script>
</head>
<body onresize="parent.resizeTo(400,600)" onload="parent.resizeTo(400,600)">
	<div id="chat_exit">
		<input type="button" id="exitBtn" value="&nbsp;나가기&nbsp;">
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
    				<li class="notice">채팅방을 생성하였습니다.</li>
    				<br>
    			</c:when>
    			<c:otherwise>
    				<c:forEach items="${chatMessage }" var="chatMessage">
						<c:choose>
							<c:when test="${chatMessage.member_seq eq member_seq }">
								<li class='message_id_mine'>${chatMessage.member_id }</li><br>
								<div class='message_content_mine'>
									<%-- ${chatMessage.message_time }&nbsp;&nbsp; 나중에 시간 생기면 time 고치기 --%>
									<span class='contents_mine'>
										${chatMessage.message_content }
									</span>
								</div><br>
							</c:when>
							<c:otherwise>
								<li class='message_id'>${chatMessage.member_id }</li><br>
								<div class='message_content'>
									<span class='contents'>
										${chatMessage.message_content }
									</span>
									<%-- ${chatMessage.message_time }&nbsp;&nbsp; 나중에 시간 생기면 time 고치기 --%>
								</div><br>
							</c:otherwise>
						</c:choose>
    					
    				</c:forEach>
    			</c:otherwise>
    		</c:choose>
    	</div>
    </div>
    
    <div id="sendChat">	
	    <input type="text" id="message" maxlength="18" placeholder="메시지를 입력해 주세요">
		<input type="button" id="sendBtn" value="전송">
    </div>
    
     <div id="exitModal" class="modal">
	     <!-- Modal content -->
	     <div class="modal-content" style="text-align: center">
		   	 <b>${chat.chat_name }</b><br>
		   	 이 채팅방에서<br>
		     정말 나가시겠습니까?<br><br>
		     <input type="button" class="isExit" value="예">
		     <input type="button" class="isExit" value="아니요">
	     </div>
     </div>

</body>
</html>