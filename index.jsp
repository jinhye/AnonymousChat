<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP AJAX ANONYMOUSE CHAT</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	function submitFunction(){
		var chatName = $('#chatName').val();
		var chatContent = $('#chatContent').val();
		$.ajax({
			type: "POST",
			url: "./chatSubmitServlet",
			data: {
				chatName: chatName,
				chatContent: chatContent
			},
			success: function(result){
				if(result == 1){
					alert("success");
				}else if(result == 0){
					alert("type name and content correctly");
				}else{
					alert("Data base has errors");
				}
			}
		});
		$('#chatContent').val('');
	}
	
</script>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>Chat room</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget" style="overflow-y:auto; height:300px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">May 6th, 2017</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="images/sw.png">
											</a>
											<div class="media-body">
												<h4 class="media-heading">Patrick
													<span class="small pull-right">07:30 am</span>
												</h4>
											</div>
											<p>Hello, How are you?</p>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="images/sw.png">
											</a>
											<div class="media-body">
												<h4 class="media-heading">Cindy
													<span class="small pull-right">07:35 am</span>
												</h4>
											</div>
											<p>Fine, thank you and you?</p>
										</div>
									</div>
								</div>
							</div>
							<div class="portlet-footer">
		                    	<div class="row">
			                		<div class="form-group col-xs-4">
				            			<input style="height:40px;" type="text" id="chatName" class="form-control" placeholder="Name" maxlength="20">
									</div>
								</div>
								<div class="row" style="height:90px;">
									<div class="form-group col-xs-10">
										<textarea style="height:80px;" id="chatContent" class="form-control" placeholder="input message" maxlength="100"></textarea>
									</div>
									<div class="form-group col-xs-2">
										<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">Send</button>
										<div class="clearfix"></div>
									</div>									
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>