

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes : Note-Taker</title>
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
		<h1 class="text-uppercase">All Notes:</h1>

		<div class="row">

			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card mt-3 " >
					<img class="card-img-top m-4 mx-auto" style="max-width: 100px;"
						src="img/notepad.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">
							<%=note.getContent()%>
						</p>
						<p>
							<b class="text-primary"><%=note.getAddedDate()%></b>
						</p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger" style="margin-left:0px;"
							>
							Delete
							</a> 
							<a
								href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary"
							>
							Update
							</a>
						</div>
					</div>
				</div>
				
				<%
				}
				s.close();
				%>
			</div>

		</div>


	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
		
	</script>

</body>
</html>