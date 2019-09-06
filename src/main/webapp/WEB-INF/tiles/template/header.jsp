<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css"	rel="stylesheet">

		<div class="jumbotron">
			<h1>
				<tiles:insertAttribute name="heading" />
			</h1>
			<p>
				<tiles:insertAttribute name="tagline" />
			</p>
		</div>
