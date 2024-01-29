<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.helper.*,org.hibernate.*,com.entities.*"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page:Note-Taker</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link href="css/Style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<%@include file="Navbar.jsp"%>
		<br> <br> <br>
		<h1>Edit Your Note: </h1>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session sess = FactoryProvider.getFactory().openSession();
			
			Note note = sess.get(Note.class , noteId);
		%>
		
		<form action="UpdateServlet" method="post">
			<input value="<%=note.getId()%>" name="noteId" type="hidden" />
			<div class="form-group">
				<label for="title" class="form-label">Note Title</label> 
				<input
					type="text" required class="form-control" id="title"
					placeholder="Please add Note-Title here..." name="title" 
					value = "<%= note.getTitle() %> "	
				/>
			</div>
			<div class="form-group">
				<label for="content" class="form-label">Note Content...</label>
				<textarea class="form-control" name="content" required id="content"
					rows="5"><%= note.getContent() %></textarea>
			</div>
			<br>
			<button type="submit" class="btn btn-success text-center">Save Your Note</button>
		</form>
		
	</div> 
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>