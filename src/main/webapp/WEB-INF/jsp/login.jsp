<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
    <head>
      <!-- jQuery (important) -->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

        <!-- Bootstrap CSS & JS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>BzPayroll - Login</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
/* ===== Global Styles ===== */
body {
  margin: 0;
  padding: 0;
  font-family: 'Inter', 'Segoe UI', sans-serif;
  background: #f3f4f6;
  color: #333;
}

/* ===== Layout Container ===== */
.content-layout {
  display: flex;
  min-height: 100vh;
}

/* ===== Main Content Area ===== */
.content-area {
  flex: 1;
  background: #fff;
  padding: 50px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

/* ===== Form Container ===== */
.signup-container form {
  max-width: 400px;
  margin: 0 auto;
  background: #ffffff;
  padding: 40px 35px;
  border-radius: 10px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
  transition: 0.3s ease;
}

.signup-container form:hover {
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
}

/* ===== Form Fields ===== */
.swpm-username-label,
.swpm-username-input {
  display: inline-block;
  vertical-align: middle;
}

.swpm-username-label {
  width: 30%;
  text-align: right;
  padding-right: 15px;
  font-weight: 600;
  color: #444;
}

.swpm-username-input {
  width: 65%;
  margin-bottom: 18px;
}

.swpm-username-input input,
.swpm-username-input select {
  width: 100%;
  padding: 10px 12px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 15px;
  transition: all 0.2s ease-in-out;
}

.swpm-username-input input:focus,
.swpm-username-input select:focus {
  border-color: #007bff;
  box-shadow: 0 0 4px rgba(0, 123, 255, 0.4);
  outline: none;
}

/* ===== Submit Button ===== */
form button,
form input[type=submit],
form:button {
  display: block;
  width: 100%;
  padding: 12px 0;
  font-size: 16px;
  font-weight: 600;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 8px;
  margin-top: 25px;
  cursor: pointer;
  transition: background 0.3s ease;
}

form button:hover {
  background-color: #0056b3;
}

/* ===== Aside Section ===== */
aside {
  width: 35%;
  background: #f1f1f1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
  padding: 40px 20px;
  text-align: center;
}

aside h3 {
  font-weight: 600;
  color: #222;
  margin-bottom: 15px;
}

aside p {
  font-size: 15px;
  color: #555;
  line-height: 1.6;
  max-width: 80%;
}

aside img {
  max-width: 70%;
  border-radius: 10px;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
  transition: transform 0.3s ease;
}

aside img:hover {
  transform: scale(1.05);
}

/* ===== Footer ===== */
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

/* ===== Extra Components (Optional for Header/Footer) ===== */
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

/* ===== Search Box ===== */
.search-box input {
  border-top-left-radius: 50px;
  border-bottom-left-radius: 50px;
}

.search-box button {
  border-top-right-radius: 50px;
  border-bottom-right-radius: 50px;
}

/* ===== Bottom Navigation ===== */
.bottom-nav a {
  text-decoration: none;
  font-weight: 600;
  color: #000;
  padding: 0 12px;
  transition: color 0.2s;
}

.bottom-nav a:hover {
  color: #3e9aca;
}

/* ===== Dropdown ===== */
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

/* ===== Utility Backgrounds ===== */
.bg-purple { background-color: #6a0dad !important; }
.bg-orange { background-color: #ff8c00 !important; }
.bg-pink { background-color: #ff69b4 !important; }
.bg-primary { background-color: #005bbb !important; }

/* ===== Responsive Adjustments ===== */
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
  .swpm-username-label {
    width: 100%;
    text-align: left;
    margin-bottom: 6px;
  }
  .swpm-username-input {
    width: 100%;
  }
}

/* ===== Mobile Footer & Navigation ===== */
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
</style>
<style>
.form-group {
  position: relative;
}

.password-eye-icon {
  position: absolute;
  right: 15px;
  top: 70%;
  transform: translateY(-50%);
  cursor: pointer;
  color: #6c757d;
}

.password-eye-icon:hover {
  color: #000;
}

</style>

<body onload="loadPageDate();" data-rsssl=1 itemtype='https://schema.org/WebPage' itemscope='itemscope'  class="bp-legacy page-template page-template-page-templates page-template-user_registration page-template-page-templatesuser_registration-php page page-id-5112 wp-custom-logo theme-codify woocommerce-no-js codify-full-width global_layout-right_sidebar elementor-default elementor-kit-6191 no-js">
 <script>
        // Global function referenced in the HTML to toggle password visibility
        function togglePasswordVisibility() {
            const passwordField = document.getElementById('swpm_password');
            const eyeIcon = document.getElementById('password-eye');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                eyeIcon.classList.remove('fa-eye-slash');
                eyeIcon.classList.add('fa-eye');
            } else {
                passwordField.type = 'password';
                eyeIcon.classList.remove('fa-eye');
                eyeIcon.classList.add('fa-eye-slash');
            }
        }

        // --- NEW: Data Saving Functions using localStorage ---

        function saveUsername() {
            const rememberMeCheckbox = document.getElementById('rememberMe');
            const usernameField = document.getElementById('swpm_user_name');

            if (rememberMeCheckbox.checked) {
                // Save the username and the state of the checkbox
                localStorage.setItem('savedUsername', usernameField.value);
                localStorage.setItem('rememberMeChecked', 'true');
                console.log('Username saved locally.');
            } else {
                // Clear saved data if user unchecked the box
                localStorage.removeItem('savedUsername');
                localStorage.removeItem('rememberMeChecked');
                console.log('Username cleared from local storage.');
            }
        }

        function loadUsername() {
            const savedUsername = localStorage.getItem('savedUsername');
            const rememberMeChecked = localStorage.getItem('rememberMeChecked');
            const usernameField = document.getElementById('swpm_user_name');
            const rememberMeCheckbox = document.getElementById('rememberMe');

            if (savedUsername) {
                usernameField.value = savedUsername;
                console.log('Username loaded from local storage.');
            }
            if (rememberMeChecked === 'true') {
                rememberMeCheckbox.checked = true;
            }
        }

        // --- END: Data Saving Functions ---


        function validateCaptchaAndSubmit(event) {
            // Step 1: Prevent the form from submitting immediately (we take control)
            event.preventDefault();



            // event.currentTarget refers to the form element
            event.currentTarget.submit();

            // We return false because we already handled the submission manually
            return false;
        }
    </script>
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
<header style="text-align: center; margin-top: 2%;">
    <h4>Welcome to BzPayroll</h4>
</header>
      <div class="signup-container"   style="box-shadow: box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); padding:5px;">
     <c:if test="${not empty message}">
         <div style="color: green; text-align: center; margin-bottom: 10px;">
             ${message}
         </div>
     </c:if>

     <c:if test="${not empty errorMessage}">
         <div style="color: red; text-align: center; margin-bottom: 10px;">
             ${errorMessage}
         </div>
     </c:if>

       <form id="loginForm" method="post" action="/loginSubmit" onsubmit="return validateCaptchaAndSubmit(event)"

           class="swpm-validate-form"
           style="box-shadow: 4px 4px 17px 1px rgba(64,64,64,0.75);
                  -webkit-box-shadow: 4px 4px 17px 1px rgba(64,64,64,0.75);
                  -moz-box-shadow: 4px 4px 17px 1px rgba(64,64,64,0.75);
                  padding-top: 1.5rem;
                  padding-bottom: 1.5rem;
                  border-radius: 5px;">

           <!-- Error Message -->
            <div class="form-group">
                                                           <label for="swpm_user_name">Username / Email</label>
                                                           <input type="text" class="form-control w-100" id="swpm_user_name"
                                                               name="username" required placeholder="Enter your username or email">
                                                       </div>

                                                       <div class="form-group position-relative">
                                                           <label for="swpm_password">Password</label>
                                                           <input type="password" class="form-control w-100" id="swpm_password"
                                                               name="password" required placeholder="Enter your password">
                                                           <i class="fa fa-eye-slash password-eye-icon" id="password-eye"
                                                               onclick="togglePasswordVisibility()"></i>
                                                       </div>

                                                       <div class="form-group remember-forgot">
                                                           <label style="margin-top:9px">
                                                               <input type="checkbox" name="rememberme" id="rememberMe"
                                                                   value="checked='checked'">
                                                               Remember Me
                                                           </label>
                                                           <a href="/forgotPassword" class="forgot-password">Forgot Password?</a>
                                                       </div>
                                                          <div>
                                                       <button type="submit" class="btn btn-primary" id="wp-submit"
                                                               name="swpm-login" style="width: 100%; font-weight: 600; padding: 5px; margin-top:15px;">
                                                           Log in
                                                       </button>
                                                       </div>
                                                       <hr style="margin-top:20px">
                                                       <div style="max-width: fit-content;margin-left: auto;margin-right: auto;">
                                                           Don't have an account? <a href="/register" class="forgot-password">Sign
                                                               up</a>
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
