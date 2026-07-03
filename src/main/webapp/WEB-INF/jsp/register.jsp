<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<html>
    <head>
      <!-- jQuery (important) -->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

        <!-- Bootstrap CSS & JS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>BzPayroll - Registration</title>

<style>
body {
  margin: 0;
  padding: 0;
  font-family: 'Segoe UI', sans-serif;
  background: #f8f9fa;
}

/* Layout container */
.content-layout {
  display: flex;
  min-height: 100vh;
}

/* Main form area */
.content-area {
  flex: 1;
  background: #fff;
  padding: 50px;
  box-sizing: border-box;
}

/* Form styling */
.signup-container form {
  max-width: 600px;
  margin: 0 auto;
}

.swpm-username-label,
.swpm-username-input {
  display: inline-block;
  vertical-align: middle;
}

.swpm-username-label {
  width: 30%;
  text-align: right;
  padding-right: 15px;
  font-weight: 500;
}

.swpm-username-input {
  width: 65%;
  margin-bottom: 15px;
}

.swpm-username-input input,
.swpm-username-input select {
  width: 100%;
  padding: 8px 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 15px;
}

/* Submit button */
form button,
form input[type=submit],
form:button {
  display: block;
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 6px;
  margin-top: 20px;
  cursor: pointer;
}
form button:hover {
  background-color: #0056b3;
}

/* Aside styling */
aside {
  width: 35%;
  background: #f1f1f1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
  padding: 40px 0;
}

aside img {
  max-width: 70%;
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

/* Footer styling */
.bottom-footer {
  background: #222;
  color: #fff;
  padding: 30px 0;
  text-align: center;
}
.copy-right-wrapper {
  margin-top: 20px;
  font-size: 14px;
  color: #bbb;
}

/* Responsive layout */
@media (max-width: 992px) {
  .content-layout {
    flex-direction: column;
  }
  aside {
    width: 100%;
    flex-direction: row;
    justify-content: space-evenly;
    padding: 20px;
  }
  aside img {
    max-width: 30%;
  }
}
</style>
<style>
  body {
      font-family: 'Inter', sans-serif;
      background-color: #f3f4f6;
    }
    .section-title {
      font-weight: 600;
      font-size: 1.2rem;
      margin-bottom: 10px;
    }
    .partners img,
    .products img {
      max-height: 60px;
      margin: 0 15px;
    }
    footer {
      background: #000;
      color: #fff;
      padding: 40px 0;
    }
    .testimonial-box {
      background: #f9f9f6;
      padding: 20px;
      border-radius: 10px;
    }
    .card-title {
      font-weight: bold;
    }
    .navbar-brand small {
      display: block;
      font-size: 0.65rem;
      color: #666;
      margin-top: -4px;
    }
    .search-box input {
      border-top-left-radius: 50px;
      border-bottom-left-radius: 50px;
    }
    .search-box button {
      border-top-right-radius: 50px;
      border-bottom-right-radius: 50px;
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
      .top-links {
        flex-direction: column;
        align-items: flex-end;
      }
      /* Mobile-specific footer centering */
      .footer-col {
        text-align: center;
      }
      .footer-col .list-unstyled {
        display: inline-block;
        text-align: left;
      }
      .footer-col img {
        margin: 0 auto;
      }
    }
    .bottom-nav a {
      text-decoration: none;
      font-weight: 600;
      color: #000;
      padding: 0 12px;
    }
    .bottom-nav a:hover {
      color: #3e9aca;
    }
    .bottom-nav a {
      font-weight: 600;
      padding: 0 10px;
    }
    .dropdown-menu {
      font-size: 1rem;
      line-height: 1.4;
      padding: 0.5rem 1rem;
      border-radius: 0;
    }
    .dropdown-item {
      white-space: normal;
      padding: 0.5rem 1rem;
      font-family: 'Segoe UI', sans-serif;
    }
    .dropdown-item:hover {
      background-color: #f8f9fa;
    }
        .bg-purple { background-color: #6a0dad; }
        .bg-orange { background-color: #ff8c00; }
        .bg-pink { background-color: #ff69b4; }
        .bg-primary { background-color: #005bbb !important; }

  </style>
  <script>
  		$(document)
  				.ready(
  						function() {

  							$('#sellectCountry')
  									.on(
  											'change',
  											function() {
  											console.log("pppppppp");
  												var id = $(this).val();
  												console
  														.log("Selected Country ID: "
  																+ id);

  												$
  														.ajax({
  															type : 'GET',
  															url : '/api/states',
  															data : {
  																id : id
  															},
  															dataType : 'json', //  Important: Expecting JSON
  															success : function(result) {

  																var s;
  																 for (var i = 0; i < result.length; i++) { // use .length
                                                                          s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                                                                      }
                                                                      $('#sellectState').html(s);
  															},
  															error : function(
  																	xhr,
  																	status,
  																	error) {
  																console
  																		.error(
  																				"AJAX Error:",
  																				error);
  																console
  																		.log(
  																				"Response Text:",
  																				xhr.responseText);
  															}
  														});
  											});

  							$('#sellectState')
  									.on(
  											'change',
  											function() {
  												var id = $(this).val();
  												console
  														.log("Selected State ID: "
  																+ id);

  												$
  														.ajax({
  															type : 'GET',
  															url : '/api/cities',
  															data : {
  																id : id
  															}, // send as query param ?id=...
  															dataType : 'json', // expecting JSON from server
  															success : function(
  																	result) {
  																var s;
  																for (var i = 0; i < result.length; i++) {
  																	console
  																			.log("Loop ID: "
  																					+ i);
  																	s += '<option value="' + result[i].id + '">'
  																			+ result[i].name
  																			+ '</option>';
  																}
  																$(
  																		'#sellectDistrict')
  																		.html(s);
  															},
  															error : function(
  																	xhr,
  																	status,
  																	error) {
  																console
  																		.error(
  																				"AJAX Error:",
  																				error);
  																console
  																		.log(
  																				"Response Text:",
  																				xhr.responseText);
  															}
  														});

  											});
  						});
  	</script>
<body onload="loadPageDate();" data-rsssl=1 itemtype='https://schema.org/WebPage' itemscope='itemscope'  class="bp-legacy page-template page-template-page-templates page-template-user_registration page-template-page-templatesuser_registration-php page page-id-5112 wp-custom-logo theme-codify woocommerce-no-js codify-full-width global_layout-right_sidebar elementor-default elementor-kit-6191 no-js">
<!-- Header Top: Logo + Search + Login/Register -->
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom py-3">
      <div class="container d-flex flex-wrap align-items-center justify-content-between">
        <!-- Logo Container to center the logo on mobile -->
        <div class="d-flex flex-grow-1 justify-content-center d-lg-block">
          <a class="navbar-brand fw-bold" href="/">
            <img src="/images/bzpayroll-logo.jpg" alt="BZPayroll Logo" class="img-fluid" style="max-height: 50px;">
          </a>
        </div>

        <!-- Search Bar (Visible on desktop only) -->
        <form class="d-none d-lg-flex search-box ms-auto me-3 flex-grow-1" role="search" style="max-width: 600px;">
          <input class="form-control px-4" type="search" placeholder="Search..." aria-label="Search">
          <button class="btn btn-primary px-4" type="submit">Go</button>
        </form>

        <!-- Hamburger Button (Right-aligned on mobile) -->
        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#topLinksMenu"
                            aria-controls="topLinksMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Collapsible Links -->
        <div class="collapse navbar-collapse" id="topLinksMenu">
          <ul class="navbar-nav ms-auto top-links">
            <li class="nav-item">
              <a href="/contact" class="nav-link text-dark px-2">CONTACT US</a>
            </li>
            <li class="nav-item">
              <a href="/register" class="nav-link text-dark px-2">REGISTER</a>
            </li>
            <li class="nav-item">
              <a href="/login" class="nav-link text-dark px-2">LOGIN</a>
            </li>
          </ul>
        </div>
      </div>
</nav>
<div class="bg-white border-bottom py-2">
      <div class="container d-flex flex-wrap justify-content-center bottom-nav align-items-center gap-3">
        <a href="/">Home</a>
        <a href="/about">About Us</a>
        <div class="dropdown">
          <a class="dropdown-toggle" href="#" id="bzcomposerDropdown" data-bs-toggle="dropdown" aria-expanded="false">
            BzPayroll
          </a>
          <ul class="dropdown-menu" aria-labelledby="bzcomposerDropdown" style="min-width: 320px;">
            <li><a class="dropdown-item" href="#">Full-featured Accounting System</a></li>
            <li><a class="dropdown-item" href="#">Order Management System with POS support</a></li>
            <li><a class="dropdown-item" href="#">Warehouse Integration System</a></li>
            <li><a class="dropdown-item" href="#">Accounting System with full-featured account receivable and payable</a></li>
            <li><a class="dropdown-item" href="#">Billing System with group billing and emails support</a></li>
            <li><a class="dropdown-item" href="#">eCommerce System</a></li>
          </ul>
        </div>
        <a href="/free-payroll">Free Payroll</a>
        <a href="/services">Our Service</a>
      </div>
</div>

<div class="content-layout">

  <!-- Left: Registration Form -->
  <div id="primary" class="content-area">

    <main id="main" class="site-main">

      <div class="signup-container"   style="box-shadow: box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); padding:5px;"
>

       <form
           method="post"
           action="/addUserMember"
           autocomplete="off"
           name="swpm-registration-form"
           class="swpm-validate-form"
           style="box-shadow: 4px 4px 17px 1px rgba(64,64,64,0.75);
                  -webkit-box-shadow: 4px 4px 17px 1px rgba(64,64,64,0.75);
                  -moz-box-shadow: 4px 4px 17px 1px rgba(64,64,64,0.75);
                  padding-top: 1.5rem;
                  padding-bottom: 1.5rem;
                  border-radius: 5px;">

           <!-- Error Message -->
           <div style="text-align:center;">
           <c:if test="${not empty message}">
               <div style="color: red;">
                   ${message}
               </div>
           </c:if>
          </div>
           <!-- Membership Level -->
           <div class="swpm-username-label">
               <label for="membershipLevel">Membership Levels</label>
           </div>
           <div class="swpm-username-input">
               <select id="membershipLevel" name="membershipLevel">
                <option value="">-- Select Membership --</option>
                  <c:if test="${not empty membershipPlans}">
                      <c:forEach items="${membershipPlans}" var="objList1">
                          <option value="${objList1.planCode}">${objList1.planName} ($${objList1.amount}/month)</option>
                      </c:forEach>
                  </c:if>
              </select>
           </div>

           <!-- Prefix -->
           <div class="swpm-username-label">
               <label for="prefix">Prefix</label>
           </div>
           <div class="swpm-username-input">
               <select name="prefix" id="prefix">
                   <option value="Mr">Mr.</option>
                   <option value="Mrs">Mrs.</option>
                   <option value="Miss">Miss.</option>
               </select>
           </div>

           <!-- First Name -->
           <div class="swpm-username-label">
               <label for="firstName">First Name <font color="#FF0000">*</font></label>
           </div>
           <div class="swpm-username-input">
               <input type="text" name="firstName" id="firstName" size="50" required>
           </div>

           <!-- Last Name -->
           <div class="swpm-username-label">
               <label for="lastName">Last Name <font color="#FF0000">*</font></label>
           </div>
           <div class="swpm-username-input">
               <input type="text" name="lastName" id="lastName" size="50" required>
           </div>

           <!-- Email -->
           <div class="swpm-username-label">
               <label for="emailAddress">Email <font color="#FF0000">*</font></label>
           </div>
           <div class="swpm-username-input">
               <input type="email" name="emailAddress" id="emailAddress" size="50" required>
           </div>

           <!-- Position -->
           <div class="swpm-username-label">
               <label for="position">Position</label>
           </div>
           <div class="swpm-username-input">
               <select name="position" id="position">
                   <option value="">-- Select Position --</option>
                   <option value="President">President</option>
                   <option value="VP">VP</option>
                   <option value="Manager">Manager</option>
                   <option value="IT Manager">IT Manager</option>
                   <option value="Programmer">Programmer</option>
               </select>
           </div>

           <!-- City -->
           <div class="swpm-username-label">
               <label for="sellectDistrict">City <font color="#FF0000">*</font></label>
           </div>
           <div class="swpm-username-input">
               <select name="cityId" id="sellectDistrict" class="form-select" required>
                   <option value="42865">California City</option>
               </select>
           </div>

           <!-- State -->
           <div class="swpm-username-label">
               <label for="sellectState">State <font color="#FF0000">*</font></label>
           </div>
           <div class="swpm-username-input">
               <select name="stateId" id="sellectState" required>
                   <option value="3924">California</option>
               </select>
           </div>

           <!-- Country -->
           <div class="swpm-username-label">
               <label for="sellectCountry">Country <font color="#FF0000">*</font></label>
           </div>
           <div class="swpm-username-input">
               <select id="sellectCountry" name="countryId" class="form-select" required>
                   <option value="231">United States</option>
                   <c:forEach var="bcpcountries" items="${countries}">
                       <option value="${bcpcountries.id}">${bcpcountries.name}</option>
                   </c:forEach>
               </select>
           </div>
           <script>
               function countryChanged() {
                   console.log("hellow how are u");
                   alert("hellow how are u"); // optional, shows a popup
               }
           </script>

           <!-- Password -->
           <div class="swpm-username-label">
               <label for="password">Password <font color="#FF0000">*</font></label>
           </div>
           <div class="swpm-username-input">
               <input type="password" name="password" id="password" size="50" required>
           </div>

           <!-- Confirm Password -->
           <div class="swpm-username-label">
               <label for="confirmPassword">Repeat Password <font color="#FF0000">*</font></label>
           </div>
           <div class="swpm-username-input">
               <input type="password" name="confirmPassword" id="confirmPassword" size="50" required>
           </div>

           <!-- Submit Button -->
           <div style="display: flex; align-items: center; justify-content: center;">
               <button type="submit" class="btn btn-primary" style="width: 45%; background-color: #4054b2;">
                   Register
               </button>
           </div>

           <hr style="margin-top:20px">
           <div style="max-width: fit-content; margin-left: auto; margin-right: auto;">
               Already have an account? <a href="/login" class="forgot-password">Login</a>
           </div>

       </form>


      </div>
    </main>
  </div>

  <!-- Right: Aside Image Column -->
  <aside>
    <img src="/images/login/payroll.jpeg" style="background-size:cover; background-repeat:none;" alt="Payroll Image 1"/>
  </aside>

</div>

<!-- Footer -->
<footer class="bg-dark text-white pt-5">
      <div class="container">
        <div class="row text-center text-md-start">
          <!-- Company Logo & Description -->
          <div class="col-md-3 mb-4">
            <img src="/images/bzcweb.jpg" alt="BZPayroll Logo" style="max-width: 150px;" class="mb-2">
            <p class="small">BZPayroll is your trusted employee & payroll service provider for all business types.</p>
          </div>
          <!-- About -->
          <div class="col-md-2 mb-4 footer-col">
            <h6 class="text-uppercase fw-bold mb-3">About Us</h6>
            <ul class="list-unstyled">
              <li><a href="#" class="text-white-50 text-decoration-none">About Nextbits</a></li>
              <li><a href="#" class="text-white-50 text-decoration-none">SupportSupport</a></li>
              <li><a href="/contact" class="text-white-50 text-decoration-none">Contact Us</a></li>
              <li><a href="#" class="text-white-50 text-decoration-none">Site Map</a></li>
            </ul>
          </div>
          <!-- Business -->
          <div class="col-md-2 mb-4 footer-col">
            <h6 class="fw-bold mb-3">Business Submission</h6>
            <ul class="list-unstyled">
              <li><a href="#" class="text-white-50 text-decoration-none">Membership</a></li>
              <li><a href="#" class="text-white-50 text-decoration-none">Submit Your Business</a></li>
              <li><a href="#" class="text-white-50 text-decoration-none">Claim Your Business</a></li>
            </ul>
          </div>
          <!-- Selling -->
          <div class="col-md-2 mb-4 footer-col">
            <h6 class="fw-bold mb-3">Selling on Nextbits</h6>
            <ul class="list-unstyled">
              <li><a href="#" class="text-white-50 text-decoration-none">How To Sell</a></li>
              <li><a href="#" class="text-white-50 text-decoration-none">Manage Products</a></li>
            </ul>
          </div>
          <!-- Help -->
          <div class="col-md-3 mb-4 footer-col">
            <h6 class="fw-bold mb-3">Safety & Support</h6>
            <ul class="list-unstyled">
              <li><a href="#" class="text-white-50 text-decoration-none">Help Center</a></li>
              <li><a href="#" class="text-white-50 text-decoration-none">Blog</a></li>
              <li><a href="#" class="text-white-50 text-decoration-none">Privacy Policy</a></li>
              <li><a href="#" class="text-white-50 text-decoration-none">Disclaimer</a></li>
            </ul>
          </div>
        </div>
        <!-- Footer Bottom -->
        <div class="text-center border-top border-secondary pt-3 pb-2 mt-4">
          <p class="mb-0 small text-white-50">&copy; 2025 BZPayroll. All rights reserved.</p>
        </div>
      </div>
</footer>
</body>

</html>
