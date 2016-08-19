
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<!--  /.page  -->
	<div class="container">
		<jsp:include page="succes.jsp"></jsp:include>

		<div class="row">

			<div class="col-md-3">
				<p class="lead">Kategorie</p>
				<div class="list-group">
					<a href="categoryList.html?id=14" " class="list-group-item">Kosmetyki
						<img style="float: right; width: 30px; height: 30px;
						src=""></img>
					</a> <a href="categoryList.html?id=13" class="list-group-item">Suplementy
						<img style="float: right; width: 30px; height: 30px;"
						src=""></img>
					</a> <a href="categoryList.html?id=1" 
						class="list-group-item">
						Leki <img style="float: right; width: 30px; height: 30px;
						src=""></img>
					</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="row carousel-holder">
					<div class="col-md-3">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<div class="thumbnail">
								<img class="slide-image"
									src="http://www.meltingpot.org/IMG/cache-200x300/arton15743-200x300.jpg" /></img>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
