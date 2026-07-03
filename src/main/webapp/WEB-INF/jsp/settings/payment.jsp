<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <jsp:include page="/WEB-INF/jsp/include/headlogo.jsp" />
    <jsp:include page="/WEB-INF/jsp/include/header.jsp" />
    <jsp:include page="/WEB-INF/jsp/include/menu.jsp" />
    <title>
        <spring:message code="BzComposer.generaltitle" />
    </title>
    <script type="text/javascript"
        src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
    <link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
        rel="stylesheet" media="screen" />
    <script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
        rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <style>
        .custom-sidebar {
            width: 150px;
            background: #f1f6fb;
            padding: 10px;
        }

        .custom-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .custom-menu li {
            margin-bottom: 8px;
            text-align: center;
        }

        .custom-menu li a {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
            background: #eaf4fd;
            padding: 12px 5px;
            border-radius: 8px;
            color: #333;
            transition: background 0.3s;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
        }

        .custom-menu li a i {
            font-size: 30px;
            color: #06abc4;
            margin-bottom: 6px;
        }

        .custom-menu li a span {
            font-size: 14px;
            font-weight: 500;
        }

        .custom-menu li a:hover {
            background: #d7ecfc;
        }

        .custom-menu li.active a {
            background: #ffedb4;
            font-weight: bold;
            color: #333;
        }
    </style>
    <style>
        /* Data Manager Select Box Custom Styles */
        select[id^="dm-list-"]:focus,
        select[id^="dm-list-"]:active {
            background-color: #A0A0A0 !important;
            border-color: #66AFE9 !important;
            outline: none !important;
            box-shadow: 0 0 5px rgba(102, 175, 233, 1) !important;
        }

        select[id^="dm-list-"] option:checked {
            /* linear-gradient overrides some native OS dropdown drawing logic to force background color on options */
            background: linear-gradient(#DBC0DB, #DBC0DB) !important;
            background-color: #DBC0DB !important;
            color: #000 !important;
        }

        table th,
        table td {
            font-size: 14px !important;
        }

        .settings-page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            margin: 30px 0px 4px 0px;
            padding: 0;
        }

        .settings-page-title {
            font-size: 1.1em;
            font-weight: normal;
            color: #838383;
        }

        .settings-page-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 8px;
        }

        .settings-page-actions .formbutton[disabled] {
            opacity: 0.5;
            cursor: not-allowed;
        }
    </style>
    <style>
        .ui-tabs .ui-tabs-nav {
            border: none !important;
        }
        .ui-tabs .ui-tabs-nav li {
            border: 1px solid #ccc !important;
        }
        .ui-tabs .ui-tabs-nav {
            display: flex;
            justify-content: center;
            gap: 5px;
            padding: 0;
            margin: 0 auto;
            width: 100%;
        }

        .ui-tabs .ui-tabs-nav li {
            flex: 1;
            max-width: 200px;
            text-align: center;
            border: 1px solid #ccc !important;
        }
        .ui-tabs .ui-tabs-nav li.ui-tabs-active {
            background: white !important;
            border-bottom: 1px solid white !important;
            box-shadow: none !important;
        }
        .ui-tabs .ui-tabs-nav li.ui-tabs-active a {
            background: white !important;
            color: black !important;
            outline: none !important;
            box-shadow: none !important;
        }
        table.tabla-listados tbody tr td{
            padding: 7px 7px 7px 14px;
        }
    </style>
    <style>
        .payment-methods-container{
            display:flex;
            flex-wrap:wrap;
            gap:25px;
            padding:20px;
        }

        .payment-card,
        .add-payment-card{
            width:320px;
            min-height:260px;
            background:#fff;
            border:1px solid #dcdcdc;
            border-radius:4px;
            padding:25px;
            position:relative;
            box-sizing:border-box;
        }

        .payment-card:hover{
            box-shadow:0 3px 12px rgba(0,0,0,.10);
        }

        .menu-wrapper{
            position:absolute;
            top:15px;
            right:15px;
        }

        .menu-btn{
            border:none;
            background:none;
            cursor:pointer;
            font-size:24px;
            color:#555;
        }

        .menu-dropdown{
            display:none;
            position:absolute;
            right:0;
            top:35px;
            min-width:140px;
            background:white;
            border:1px solid #ddd;
            box-shadow:0 3px 10px rgba(0,0,0,.15);
            z-index:9999;
        }

        .menu-dropdown.show{
            display:block;
        }

        .menu-dropdown a{
            display:block;
            padding:10px 15px;
            text-decoration:none;
            color:#333;
        }

        .menu-dropdown a:hover{
            background:#f4f4f4;
        }

        .card-icon{
            font-size:36px;
            margin-bottom:20px;
        }

        .card-logo{
            display:inline-block;
            padding:6px 10px;
            border-radius:4px;
            color:#fff;
            font-size:12px;
            font-weight:bold;
            margin-bottom:20px;
        }

        .mastercard{
            background:#eb001b;
        }

        .visa{
            background:#1a1f71;
        }

        .payment-card h2{
            font-size:36px;
            margin:10px 0;
            color:#222;
            font-weight:400;
        }

        .exp{
            font-size:22px;
            margin-top:15px;
            color:#333;
        }

        .address{
            margin-top:15px;
            color:#555;
            line-height:1.5;
        }

        .last-used{
            margin-top:25px;
            font-size:11px;
            color:#666;
            text-transform:uppercase;
        }

        .balance{
            margin-top:20px;
            font-size:18px;
        }

        .badge{
            display:inline-block;
            margin-top:20px;
            background:#fff4c7;
            padding:6px 12px;
            border-radius:3px;
            font-size:12px;
            font-weight:bold;
        }

        .add-payment-card{
            border:2px dashed #cfcfcf;
            cursor:pointer;
            display:flex;
            justify-content:center;
            align-items:center;
            text-align:center;
            color:#00a4bd;
        }

        .add-payment-card:hover{
            background:#fafafa;
        }

        .plus{
            font-size:50px;
            margin-bottom:10px;
        }

        @media(max-width:1200px){
            .payment-card,
            .add-payment-card{
                width:100%;
            }
        }
    </style>
</head>

<body onload="init();">
    <form:form name="configurationForm" enctype="MULTIPART/FORM-DATA" method="post"
        modelAttribute="configDto">
        <div id="ddcolortabsline">&nbsp;</div>
        <div id="cos">
            <div class="statusquo ok">
                <div id="hoja">
                    <div id="blanquito">
                        <div id="padding">
                            <div class="settings-page-header">
                                <span class="settings-page-title">SETTINGS</span>
                                <div class="settings-page-actions">
                                    <input class="formbutton" type="button"
                                        value="<spring:message code='BzComposer.global.save'/>"
                                        onclick="handleGeneralTopSave()">
                                    <input class="formbutton" type="button"
                                        value="<spring:message code='BzComposer.global.cancel'/>"
                                        onclick="handleGeneralTopCancel()">
                                </div>
                            </div>
                            <div>
                                <div>
                                    <c:if test="${not empty Labels}">
                                        <input type="hidden" name="lsize" id="lblsize"
                                            value='${Labels.size()}' />
                                        <c:forEach items="${Labels}" var="lbl" varStatus="loop">
                                            <input type="hidden" id='${loop.index}lid'
                                                name='${loop.index}lidname' value='${lbl.value}' />
                                            <input type="hidden" id='${loop.index}lname'
                                                name='${loop.index}lnm' value='${lbl.label}' />
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <div id="table-negotiations"
                                    style="padding: 0; border: 1px solid #ccc; margin-top: 15px;">
                                    <table cellspacing="0"
                                        style="border: 0; padding: 0; width: 100%;overflow-y:scroll;"
                                        class="">
                                        <tr>
                                            <td id="leftMenu"
                                                style="position: relative; width: 165px; vertical-align: top;">
                                                <div
                                                    style="display: flex; justify-content: flex-start; align-items: flex-start; width: 165px;">
                                                    <table>
                                                        <tr>
                                                            <td style="vertical-align: top;">
                                                                <div>
                                                                    <jsp:include
                                                                        page="menuPage.jsp" />
                                                                </div>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                            <td valign="top">
                                                <!-- general page content starts -->
                                                <div id="general"
                                                    style="padding: 0; position: relative; left: 0;">
                                                    <div id="tabs"
                                                        style="height: auto; border: none; padding: 0;">
                                                        <div id="Membership">
                                                            <div id="tabs" style="height: auto;">
                                                                <ul style=" padding: .2em .2em 2px; justify-content: start;background-color: #cccccc;">
                                                                    <li>
                                                                        <a href="#subscriptionsTab" style="width: 100%;">
                                                                            Subscriptions
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#orderHistoryTab" style="width: 100%;">
                                                                            Order History
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#paymentMethodsTab" style="width: 100%;">
                                                                            Payment Methods
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                                <div id="subscriptionsTab">
                                                                    <div id="table-negotiations">
                                                                        <table class="tabla-listados" cellspacing="0" style="margin: 0px 0px 0px 0px;">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>Plan</th>
                                                                                    <th>Monthly Price</th>
                                                                                    <th>Next Billing Date</th>
                                                                                    <th>Payment Method</th>
                                                                                    <th>Status</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <c:forEach items="${subscriptionList}" var="sub" varStatus="loop">
                                                                                    <tr>
                                                                                        <td>${sub.plan.planName}</td>
                                                                                        <td>$${sub.amount}</td>
                                                                                        <td>${sub.currentPeriodEnd}</td>
                                                                                        <td>Card</td>
                                                                                        <td>${sub.status}</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                       </table>
                                                                    </div>
                                                                </div>
                                                                <div id="orderHistoryTab">
                                                                    <div id="table-negotiations">
                                                                       <table class="tabla-listados" cellspacing="0" style="margin: 0px 0px 0px 0px;">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>Invoice #</th>
                                                                                    <th>Billing Date</th>
                                                                                    <th>Plan</th>
                                                                                    <th>Amount</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <c:forEach items="${invoiceList}" var="inv" varStatus="loop">
                                                                                    <tr>
                                                                                        <td>${inv.invoiceNumber}</td>
                                                                                        <td>${inv.invoiceDate}</td>
                                                                                        <td>${inv.bcaSubscription.plan.planName}</td>
                                                                                        <td>$${inv.amountPaid}</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                       </table>
                                                                    </div>
                                                                </div>
                                                                <div id="paymentMethodsTab">
                                                                    <div class="payment-methods-container">
                                                                        <!-- In Store Credit -->
                                                                        <!-- <div class="payment-card">
                                                                            <div class="menu-wrapper">
                                                                                <a class="menu-btn" onclick="toggleMenu(this)">&#8942;</a>

                                                                                <div class="menu-dropdown">
                                                                                    <a href="#">View</a>
                                                                                </div>
                                                                            </div>

                                                                            <div class="card-icon">🏦</div>

                                                                            <h2>In-Store Credit</h2>

                                                                            <div class="balance">
                                                                                Balance (USD): $0.00
                                                                            </div>

                                                                            <span class="badge">NON-RECURRING</span>
                                                                        </div> -->
                                                                        <c:forEach items="${paymentMethods}" var="pm" varStatus="loop">
                                                                            <div class="payment-card">
                                                                                <div class="menu-wrapper">
                                                                                    <a class="menu-btn" onclick="toggleMenu(this)">&#8942;</a>

                                                                                    <div class="menu-dropdown">
                                                                                        <a href="#">Edit</a>
                                                                                        <a href="#">Set Default</a>
                                                                                        <a href="#">Delete</a>
                                                                                    </div>
                                                                                </div>
                                                                                <c:if test="${pm.cardBrand == 'visa'}">
                                                                                    <div class="card-logo visa">VISA</div>
                                                                                </c:if>
                                                                                <c:if test="${pm.cardBrand == 'mastercard'}">
                                                                                    <div class="card-logo mastercard">MasterCard</div>
                                                                                </c:if>
                                                                                

                                                                                <h2>•••• ${pm.last4}</h2>

                                                                                <div class="exp">
                                                                                    Exp ${pm.expMonth}/${pm.expYear}
                                                                                </div>
                                                                                <div class="last-used">
                                                                                    LAST USED ${pm.createdAt}
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>

                                                                        <!-- Add Card -->
                                                                        <div class="add-payment-card"
                                                                            onclick="addPaymentMethod();">
                                                                            <div>
                                                                                <div class="plus">+</div>
                                                                                <div>Add Payment Method</div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- general page content ends -->
                                            </td>

                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
    <jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>

<script>
  $(function() {
    $("#tabs").tabs({ active: 0 });
  });

  function toggleMenu(btn) {

    var menu = btn.nextElementSibling;

    document.querySelectorAll('.menu-dropdown').forEach(function(item){
        if(item !== menu){
            item.classList.remove('show');
        }
    });

    menu.classList.toggle('show');
}

document.addEventListener('click', function(e){

    if(!e.target.closest('.menu-wrapper')){
        document.querySelectorAll('.menu-dropdown').forEach(function(item){
            item.classList.remove('show');
        });
    }
});

function addPaymentMethod(){
    alert('Open Add Payment Method Popup');
}
</script>
</html>