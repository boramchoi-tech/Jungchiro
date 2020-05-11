<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
<script type="text/javascript" src = "/poli/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	
	<h1>메인 화면</h1>
	
        <form enctype="multipart/form-data">
            <textarea name="editor1" id="editor1" rows="10" cols="80">
                This is my textarea to be replaced with CKEditor.
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1',{
                filebrowserUploadUrl : "poli/imageUpload.do"
                });
            </script>
        </form>
	
	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
</body>
</html>