<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>
<title>Quantum Able Bootstrap 4 Admin Dashboard Template</title>
<!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description"
	content="Quantum Able Bootstrap 4 Admin Dashboard Template by codedthemes">
<meta name="keywords"
	content="appestia, Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="codedthemes">

<!-- Favicon icon -->
<link rel="shortcut icon" href="resources/assets/images/favicon.png"
	type="image/x-icon">
<link rel="icon" href="resources/assets/images/favicon.ico"
	type="image/x-icon">

<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700"
	rel="stylesheet">

<!-- themify -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/icon/themify-icons/themify-icons.css">

<!-- iconfont -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/icon/icofont/css/icofont.css">

<!-- simple line icon -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/icon/simple-line-icons/css/simple-line-icons.css">

<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/plugins/bootstrap/css/bootstrap.min.css">

<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/main.css">

<!-- Responsive.css-->
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/responsive.css">



</head>

<body class="sidebar-mini fixed">
	<div class="wrapper">
		<div class="content-wrapper">
			<!-- Container-fluid starts -->
			<div class="container-fluid">

				<!-- Header Starts -->
				<div class="row">
					<div class="col-sm-12 p-0">
						<div class="main-header">
							<h4>Table</h4>
							<ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
								<li class="breadcrumb-item"><a href="index.html"> <i
										class="icofont icofont-home"></i>
								</a></li>
								<li class="breadcrumb-item"><a href="#">Tables</a></li>
								<li class="breadcrumb-item"><a href="basic-table.html">Basic
										Table</a></li>
							</ol>
						</div>
					</div>
				</div>
				<!-- Header end -->

				<!-- Tables start -->
				<!-- Row start -->
				<div class="row">
					<div class="col-sm-12">
						<!-- Hover effect table starts -->
						<div class="card">
							<div class="card-block">
								<div class="row">
									<div class="col-sm-12 table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>First Name</th>
													<th>Last Name</th>
													<th>Username</th>
													<th>Nickname</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Mark</td>
													<td>Otto</td>
													<td>@mdo</td>
													<td>Ducky</td>
												</tr>
												<tr>
													<td id="paging" colspan="8">
														<!-- 플러그인 사용 -->
														<div class="container">
															<nav aria-label="pagenavigation"
																style="text-aglin: center">
																<ul class="pagination" id="pagination"></ul>
															</nav>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- Hover effect table ends -->
					</div>
				</div>
				<!-- Row end -->
				<!-- Tables end -->
			</div>

			<!-- Container-fluid ends -->
		</div>
	</div>

	<!-- Warning Section Starts -->
	<!-- Older IE warning message -->
	<!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="resources/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="resources/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="resources/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="resources/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="resources/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
	<!-- Warning Section Ends -->


	<!-- Required Jqurey -->
	<script src="resources/assets/plugins/jquery/dist/jquery.min.js"></script>
	<script src="resources/assets/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="resources/assets/plugins/tether/dist/js/tether.min.js"></script>

	<!-- Required Fremwork -->
	<script src="resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!-- waves effects.js -->
	<script src="resources/assets/plugins/Waves/waves.min.js"></script>

	<!-- Scrollbar JS-->
	<script
		src="resources/assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script
		src="resources/assets/plugins/jquery.nicescroll/jquery.nicescroll.min.js"></script>

	<!--classic JS-->
	<script src="resources/assets/plugins/classie/classie.js"></script>

	<!-- notification -->
	<script
		src="resources/assets/plugins/notification/js/bootstrap-growl.min.js"></script>

	<!-- custom js -->
	<script type="text/javascript" src="resources/assets/js/main.min.js"></script>
	<script type="text/javascript" src="resources/assets/pages/elements.js"></script>
	<script src="resources/assets/js/menu.min.js"></script>
</body>

</html>
