<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>

<style>
.error
{
	color: #f00;
    font-size: 1em;
    font-weight: normal;
}

.contact-us-section {
	padding: 60px 20px;
	background-color: #f5f5f5;
	max-width: 100%;
	box-sizing: border-box;
}

.contact-us-section .container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 20px;
}

.contact-cards-container {
	display: flex;
	gap: 30px;
	margin-bottom: 60px;
	flex-wrap: wrap;
	justify-content: center;
}

.contact-card {
	background: white;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	flex: 1;
	min-width: 280px;
	max-width: 350px;
	text-align: center;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.contact-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

.contact-card-icon {
	width: 60px;
	height: 60px;
	margin: 0 auto 20px;
	background-color: #1976d2;
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 28px;
	color: white;
}

.contact-card-title {
	font-size: 1.4em;
	font-weight: 600;
	color: #333;
	margin-bottom: 15px;
}

.contact-card-info {
	font-size: 1.05em;
	color: #666;
	line-height: 1.8;
	margin-bottom: 8px;
}

.contact-card-info a {
	color: #1976d2;
	text-decoration: none;
}

.contact-card-info a:hover {
	text-decoration: underline;
}

.live-chat-btn {
	background-color: #4caf50;
	color: white;
	border: none;
	padding: 12px 30px;
	border-radius: 6px;
	font-size: 1.05em;
	font-weight: 600;
	cursor: pointer;
	margin-top: 15px;
	transition: background-color 0.3s ease;
}

.live-chat-btn:hover {
	background-color: #45a049;
}

.contact-form-section {
	display: flex;
	gap: 40px;
	align-items: flex-start;
	flex-wrap: wrap;
}

.contact-us-section .container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 20px;
}

.contact-form-wrapper {
	flex: 1;
	min-width: 400px;
	background: white;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.contact-form-row {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
}

.contact-form-group {
	flex: 1;
}

.contact-form-group.full-width {
	flex: 1 1 100%;
}

.contact-form-group label {
	display: block;
	font-size: 1.05em;
	font-weight: 600;
	color: #333;
	margin-bottom: 8px;
}

.contact-form-group label .required {
	color: #f00;
	margin-left: 3px;
}

.contact-form-group input,
.contact-form-group select,
.contact-form-group textarea {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ddd;
	border-radius: 6px;
	font-size: 1.05em;
	font-family: inherit;
	transition: border-color 0.3s ease;
	box-sizing: border-box;
}

.contact-form-group input:focus,
.contact-form-group select:focus,
.contact-form-group textarea:focus {
	outline: none;
	border-color: #1976d2;
	box-shadow: 0 0 0 2px rgba(25, 118, 210, 0.1);
}

.contact-form-group textarea {
	resize: vertical;
	min-height: 120px;
}

.recaptcha-wrapper {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 25px;
	padding: 15px;
	background-color: #f9f9f9;
	border-radius: 6px;
	border: 1px solid #ddd;
}

.recaptcha-checkbox {
	width: 20px;
	height: 20px;
	cursor: pointer;
}

.recaptcha-text {
	font-size: 0.9em;
	color: #666;
	display: flex;
	align-items: center;
	gap: 5px;
}

.recaptcha-links {
	font-size: 0.85em;
	color: #1976d2;
	margin-left: 5px;
}

.recaptcha-links a {
	color: #1976d2;
	text-decoration: none;
}

.recaptcha-links a:hover {
	text-decoration: underline;
}

.submit-btn {
	background-color: #1976d2;
	color: white;
	border: none;
	padding: 14px 40px;
	border-radius: 6px;
	font-size: 1.1em;
	font-weight: 600;
	cursor: pointer;
	transition: background-color 0.3s ease;
	width: 100%;
}

.submit-btn:hover {
	background-color: #1565c0;
}

.contact-image-wrapper {
	flex: 1;
	min-width: 400px;
	max-width: 500px;
}

.contact-image-wrapper img {
	width: 100%;
	height: auto;
	border-radius: 12px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

@media (max-width: 768px) {
	.contact-cards-container {
		flex-direction: column;
		align-items: center;
	}
	
	.contact-card {
		max-width: 100%;
	}
	
	.contact-form-section {
		flex-direction: column;
	}
	
	.contact-form-wrapper,
	.contact-image-wrapper {
		min-width: 100%;
	}
	
	.contact-form-row {
		flex-direction: column;
	}
}

/* Header Styles - Matching index.html */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	font-size: 16px;
	line-height: 1.6;
	color: #333;
}

.top-nav-menu {
	display: flex;
	align-items: center;
	gap: 20px;
}

.top-nav-menu a {
	text-decoration: none;
	font-weight: 600;
	font-size: 1rem;
	color: #000;
	padding: 0 8px;
}

.top-nav-menu a:hover {
	color: #3e9aca;
}

.free-trial-btn {
	background-color: #28a745;
	color: white;
	padding: 8px 20px;
	border-radius: 5px;
	text-decoration: none;
	font-weight: 600;
	font-size: 1rem;
	border: none;
	cursor: pointer;
	display: inline-block;
}

.free-trial-btn:hover {
	background-color: #218838;
	color: white;
}

.nav-link {
	font-size: 1rem !important;
	font-weight: 600 !important;
}

.search-box input {
	border-top-left-radius: 50px;
	border-bottom-left-radius: 50px;
	font-size: 0.9rem;
}

.search-box button {
	border-top-right-radius: 50px;
	border-bottom-right-radius: 50px;
	font-size: 0.9rem;
}

.navbar {
	font-size: 1rem;
}

.navbar-brand {
	font-size: 1.25rem;
}

@media (max-width: 991px) {
	.search-box {
		flex-direction: column;
		width: 100%;
	}
	.search-box input,
	.search-box button {
		width: 100% !important;
		border-radius: 50px !important;
		margin: 4px 0;
	}
	.top-nav-menu {
		flex-direction: column;
		align-items: flex-start;
		gap: 10px;
	}
}
</style>
<script type="text/javascript ">
function redirectToLogin()
{
	window.location = "/login";
}
function openRegisterPage()
{
	window.location = "/register";
}
function searchText() {
	// Search functionality - can be implemented as needed
	var searchTerm = document.getElementById('searchBox') ? document.getElementById('searchBox').value : 
	                 (document.getElementById('searchBox-sm') ? document.getElementById('searchBox-sm').value : '');
	if (searchTerm && searchTerm.trim() !== '') {
		// Implement search functionality
		console.log('Searching for: ' + searchTerm);
	}
	return false; // Prevent form submission
}
function checkform(theform)
{
	var theform = document.getElementById('frmContactUs');
	var isValid = true;
	
	// Clear previous errors
	document.getElementById('errorMessageName').innerHTML = "";
	document.getElementById('errorMessageEmail').innerHTML = "";
	document.getElementById('errorMessageComments').innerHTML = "";
	document.getElementById('errorMessageCaptcha').innerHTML = "";
	
	// Validate Name
	if(theform.txtName.value == "" || theform.txtName.value.trim() == "")
	{
		document.getElementById('errorMessageName').innerHTML="<spring:message code='BzComposer.contactus.formerrormessage'/>";
		isValid = false;
	}
	
	// Validate Email
	if(theform.txtEmail.value == "" || theform.txtEmail.value.trim() == "")
	{
		document.getElementById('errorMessageEmail').innerHTML="<spring:message code='BzComposer.contactus.formerrormessage'/>";
		isValid = false;
	}
	else if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(theform.txtEmail.value))
	{
		document.getElementById('errorMessageEmail').innerHTML="Please enter a valid email address";
		isValid = false;
	}
	
	// Validate Subject
	if(theform.subject.value == "" || theform.subject.value.trim() == "")
	{
		isValid = false;
	}
	
	// Validate Message/Comments
	if(theform.comments.value == "" || theform.comments.value.trim() == "")
	{
		document.getElementById('errorMessageComments').innerHTML="<spring:message code='BzComposer.contactus.formerrormessage'/>";
		isValid = false;
	}
	
	if(isValid)
	{
		var UserName = theform.txtName.value;
		var email = theform.txtEmail.value;
		var subject = theform.subject.value;
		var category = theform.category ? theform.category.value : '';
		var comments = theform.comments.value;
		
		document.forms['frmContactUs'].action = "Login?tabid=contactUs&hiddenName="+encodeURIComponent(UserName)+"&hiddenEmail="+encodeURIComponent(email)+"&hiddenSubject="+encodeURIComponent(subject)+"&hiddenCategory="+encodeURIComponent(category)+"&hiddenComments="+encodeURIComponent(comments);
		document.forms['frmContactUs'].submit();
	}
	
	return false;
}
function openSampleCompany2()
{
	window.location.href="Login?tabid=selectedCompanyHome&selectedCompanyId=2&companyName=ABC Retails Company";
}

function openSampleCompany3()
{
	window.location.href="Login?tabid=selectedCompanyHome&selectedCompanyId=3&companyName=ABC Wholesale Company";
}

function openSampleCompany4()
{
	window.location.href="Login?tabid=selectedCompanyHome&selectedCompanyId=4&companyName=ABC eSales Company";
}
</script>
<%-- <html:html lang="en"> --%>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><spring:message code="BzComposer.contactustitle"/></title>
	<%@ include file="templateHeader.jsp"%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- Header Top: Logo + Top Menu + Search + Contact/Login/Free Trial -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom py-3">
		<div class="container">
			<!-- Logo -->
			<a class="navbar-brand fw-bold me-4" href="/">
				<img src="/images/bzpayroll-logo.jpg" alt="BZPayroll Logo" class="img-fluid" style="max-height: 50px;">
			</a>

			<!-- Hamburger Button (Mobile) -->
			<button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
					aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Collapsible Content -->
			<div class="collapse navbar-collapse" id="navbarContent">
				<!-- Top Navigation Menu - Left Aligned -->
				<div class="top-nav-menu me-auto mb-2 mb-lg-0">
					<a href="/about">About Us</a>
					<a href="/services">Our Services</a>
					<a href="/what-is-bzpayroll">What is BzPayroll?</a>
				</div>

				<!-- Right Side: Search + Contact/Login/Free Trial -->
				<div class="d-flex flex-column flex-lg-row align-items-start align-items-lg-center gap-2 gap-lg-3">
					<!-- Search Bar (Visible on desktop only) -->
					<form class="d-none d-lg-flex search-box mb-0" role="search" style="max-width: 300px;" onsubmit="searchText(); return false;">
						<input class="form-control px-3" type="search" id="searchBox" name="searchBox" placeholder="Search..." aria-label="Search" style="font-size: 0.9rem;">
						<button class="btn btn-primary px-3" type="submit" style="font-size: 0.9rem;">Go</button>
					</form>

					<!-- Contact Us, Login, Free Trial -->
					<div class="d-flex flex-column flex-lg-row align-items-start align-items-lg-center gap-2">
						<a href="/contact" class="nav-link text-dark px-2" style="font-weight: 600;">CONTACT US</a>
						<a href="/login" class="nav-link text-dark px-2" style="font-weight: 600;">LOGIN</a>
						<a href="/register" class="free-trial-btn">30 Days Free Trial</a>
					</div>

					<!-- Search Bar (Mobile) -->
					<form class="d-lg-none search-box w-100" role="search" onsubmit="searchText(); return false;">
						<input class="form-control px-3" type="search" id="searchBox-sm" name="searchBox-sm" placeholder="Search..." aria-label="Search">
						<button class="btn btn-primary px-3 w-100 mt-2" type="submit">Go</button>
					</form>
				</div>
			</div>
		</div>
	</nav> 
	<div class="contact-us-section" id="ContactForm">
		<div class="container">
			<!-- Contact Option Cards -->
			<div class="contact-cards-container">
				<!-- Card 1: Contact Sales -->
				<div class="contact-card">
					<div class="contact-card-icon">
						<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width: 32px; height: 32px;">
							<circle cx="9" cy="21" r="1"></circle>
							<circle cx="20" cy="21" r="1"></circle>
							<path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
						</svg>
					</div>
					<div class="contact-card-title">Contact Sales</div>
					<div class="contact-card-info">
						<a href="mailto:sales@rikadahelp.co.uk">sales@rikadahelp.co.uk</a>
					</div>
					<div class="contact-card-info">
						<a href="tel:+12152456258">+1(215)245-6258</a>
					</div>
				</div>
				
				<!-- Card 2: Contact Sales -->
				<div class="contact-card">
					<div class="contact-card-icon">
						<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width: 32px; height: 32px;">
							<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
							<circle cx="12" cy="7" r="4"></circle>
						</svg>
					</div>
					<div class="contact-card-title">Contact Sales</div>
					<div class="contact-card-info">
						<a href="mailto:sales@rikadahelp.co.uk">sales@rikadahelp.co.uk</a>
					</div>
					<div class="contact-card-info">
						<a href="tel:+12152456258">+1(215)245-6258</a>
					</div>
				</div>
				
				<!-- Card 3: Start Live Chat -->
				<div class="contact-card">
					<div class="contact-card-icon">
						<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width: 32px; height: 32px;">
							<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
						</svg>
					</div>
					<div class="contact-card-title">Start Live Chat</div>
					<div class="contact-card-info">
						<a href="tel:+12152456258">+1(215)245-6258</a>
					</div>
					<button class="live-chat-btn" onclick="alert('Live Chat feature will be implemented here')">Live Chat</button>
				</div>
			</div>
			
			<!-- Contact Form and Image Section -->
			<div class="contact-form-section">
				<!-- Contact Form -->
				<div class="contact-form-wrapper">
					<form id="frmContactUs" name="frmContactUs" onsubmit="checkform(this.form); return false;" action="/Login" method="post">
						<div class="contact-form-row">
							<div class="contact-form-group">
								<label>Name <span class="required">*</span></label>
								<input type="text" id="txtName" name="txtName" placeholder="Your Name" autocomplete="off"/>
								<label id="errorMessageName" class="error"></label>
							</div>
							<div class="contact-form-group">
								<label>Email <span class="required">*</span></label>
								<input type="email" id="txtEmail" name="txtEmail" placeholder="Your Email" autocomplete="off"/>
								<label id="errorMessageEmail" class="error"></label>
							</div>
						</div>
						
						<div class="contact-form-row">
							<div class="contact-form-group">
								<label>Subject <span class="required">*</span></label>
								<input type="text" id="subject" name="subject" placeholder="Subject" autocomplete="off"/>
							</div>
							<div class="contact-form-group">
								<label>Category</label>
								<select id="category" name="category">
									<option value="Membership">Membership</option>
									<option value="Support">Support</option>
									<option value="Sales">Sales</option>
									<option value="General">General Inquiry</option>
								</select>
							</div>
						</div>
						
						<div class="contact-form-row">
							<div class="contact-form-group full-width">
								<label>Message</label>
								<textarea id="comments" name="comments" placeholder="Description" rows="5"></textarea>
								<label id="errorMessageComments" class="error"></label>
							</div>
						</div>
						
						<div class="contact-form-row">
							<div class="contact-form-group full-width">
								<button type="submit" class="submit-btn">Submit Request</button>
							</div>
						</div>
					</form>
				</div>
				
				<!-- Contact Image -->
				<div class="contact-image-wrapper">
					<img src="${pageContext.request.contextPath}/dist/template/images/contact-woman.jpg" alt="Contact Us" onerror="this.style.display='none'; this.nextElementSibling.style.display='block';"/>
					<div style="display:none; width:100%; height:500px; background:linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius:12px; display:flex; align-items:center; justify-content:center; color:white; font-size:1.2em;">
						Contact Image
					</div>
				</div>
			</div>
		</div>
	</div>
     <%@ include file="templateFooter.jsp"%>
     <%@ include file="templateScript.jsp"%>
	</body>
</html>
