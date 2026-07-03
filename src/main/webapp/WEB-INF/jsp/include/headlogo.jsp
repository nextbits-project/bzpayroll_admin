
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

.horizontal { display: inline; border-left: 1px solid #999;; padding-left: 0.3em; }
.first { border-left: none; padding-left: 0; }
.payroll-header-shell {
	width: 100%;
	padding: 12px 16px 8px;
	box-sizing: border-box;
}

.payroll-header-row {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	gap: 24px;
	width: 100%;
}

.payroll-logo {
	display: flex;
	align-items: center;
	flex: 0 0 auto;
}

.payroll-logo img {
	display: block;
	max-width: 100%;
	height: auto;
}

.payroll-userbar {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	flex: 1 1 auto;
	min-width: 0;
	padding-top: 6px;
}

.payroll-userbar-content {
	color: #05A9C5;
	font-weight: bold;
	text-align: right;
	white-space: nowrap;
}

@media (max-width: 991.98px) {
	.payroll-header-row {
		flex-direction: column;
		align-items: flex-start;
	}

	.payroll-userbar {
		justify-content: flex-start;
		width: 100%;
	}

	.payroll-userbar-content {
		white-space: normal;
		text-align: left;
	}
}

</style>

<!-- for opening dialog these files added on 26-09-2019 -->
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />

<script type="text/javascript">
function logout()
{
	window.location = "/";
}
function showLocale()
{
	var lang = document.getElementById("locale").value;
	var locale = "<%= request.getAttribute("selectedLocale")%>";

	if(lang == "" && locale != "")
	{
		$('select[id="locale"]').find('option[value="'+locale+'"]').attr("selected",true);
		return showLanguageDialog();
	}
	else
	{
		window.location="./changeLocale?lang="+lang;
	}
}
function showLanguageDialog()
{
	event.preventDefault();
	$("#showLanguageDialog").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>
</head>
<body>
<div class="header-section payroll-header-shell">
<div class="payroll-header-row">
<div class="bzclogo payroll-logo">
	<a href="${pageContext.request.contextPath}/employee-list">
        <img src = "/images/bzpayroll-logo.jpg" width="250" height="65" alt="bzcomposer"/>
</a>
</div>
<div class="payroll-userbar">
<div class="payroll-userbar-content">
 <%-- commented on 12-06-2019
 user:<%=  (String)session.getAttribute("username") %> --%>
  <spring:message code="BzComposer.welcome"/> <span id="display-username">Loading User...</span>
 	<div class="horizontal">
	<spring:message code="BzComposer.common.companyname"/> <span id="display-companyname">Loading Company...</span>
	</div>
	<!-- <div class="horizontal">
		<select name="locale" id="locale" onchange="showLocale();">
			<option value=""><spring:message code="BzComposer.selectlanguage"/></option>
			<option value="en"><spring:message code="BzComposer.selectlanguage.english"/></option>
			<option value="zh"><spring:message code="BzComposer.selectlanguage.chinese"/></option>
			<option value="es"><spring:message code="BzComposer.selectlanguage.spanish"/></option>
		</select>
	</div> -->
	<div class="horizontal">
		<html:button styleId="btnLogout" property="Logout" title="logout" Class="formbutton" onclick="logout();">
			<spring:message code="BzComposer.Logout" />
		</html:button>
	</div>
	<input type="hidden" id="request_locale" name="request_locale" value=""/>
 <div class="clear"></div>
 </div>
 </div>
 </div>

</body>
</html>
<!-- dialog box that used in this page -->
<div id="showLanguageDialog" style="display:none;">
	<p><spring:message code="BzComposer.common.selectlanguagetochange"/></p>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const usernameEl = document.getElementById('display-username');
        const companynameEl = document.getElementById('display-companyname');

        // Use the fetch API to make the AJAX call
        $.ajax({
        url: '/api/user-details',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
			if(data == "Login"){
				window.location.href = "/login";	
			}
            // Update the HTML elements with the fetched data
            usernameEl.textContent = data.firstName || 'N/A';
            companynameEl.textContent = data.company || 'N/A';

            // Or using jQuery:
            // $('#username').text(data.firstName || 'N/A');
            // $('#companyname').text(data.company || 'N/A');
        },
        error: function (xhr, status, error) {
            console.error('AJAX error:', error);

            usernameEl.textContent = 'Error loading user';
            companynameEl.textContent = 'Error loading company';
        }
    });
    });
</script>
