<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="table-negotiations" style="width: 152px; padding: 0; overflow-x:auto; max-height: 850px; position: relative; margin: 0;">
    <table class="tabla-listados" cellspacing="0" style="border: 0; margin: 0; border-top: 0 !important; border-left: 0 !important; border-right: 0 !important;">
        <tbody id="divtoggle">
        <!-- Company Information  -->
        <tr>
            <td style="background-color: transparent !important; border-top: none !important; padding: 0; margin: 0;">
            <c:choose>
                <c:when test="${configActiveTab=='companyInfoTab'}">
                    <a href="${pageContext.request.contextPath}/settings/general">
                        <img id="imgCompanyActive" src='/ConfigurationImages/CompanyInformationY.png' style="width: 151px; height: 62px; display: block;" />
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/settings/general">
                        <img id="imgCompany" src='/ConfigurationImages/CompanyInformation.png' style="width: 151px; height: 62px; display: block;" />
                    </a>
                </c:otherwise>
            </c:choose>
            </td>
        </tr>
        <!-- Payment  -->
        <tr>
            <td style="border-top: none !important; border-bottom: 1px solid #ddd; height: 63px; padding: 0 !important; margin: 0; vertical-align: middle;">
            <c:choose>
                <c:when test="${configActiveTab=='paymentTab'}">
                    <a href="${pageContext.request.contextPath}/settings/payment">
                        <img id="img0040" src='/ConfigurationImages/paymentY.png' style="width: 151px;"/>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/settings/payment">
                        <img id="img0039" src='/ConfigurationImages/payment.png' style="width: 151px;"/>
                    </a>
                </c:otherwise>
            </c:choose>
            </td>
        </tr>
        <!-- Data Manager  -->
        <tr>
            <td style="border-top: none !important; border-bottom: 1px solid #ddd; height: 63px; padding: 0 !important; margin: 0; vertical-align: middle;">
            <c:choose>
                <c:when test="${configActiveTab=='dataManagerTab'}">
                    <a href="${pageContext.request.contextPath}/settings/datamanager">
                        <img id="img0040" src='/ConfigurationImages/data_managerY.png' />
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/settings/datamanager">
                        <img id="img0039" src='/ConfigurationImages/data_manager.png' />
                    </a>
                </c:otherwise>
            </c:choose>
            </td>
        </tr>

         <!-- Membership  -->
        <tr>
            <td>
            <c:choose>
                <c:when test="${configActiveTab=='membershipTab'}">
                    <a href="${pageContext.request.contextPath}/settings/membership">
                        <img id="img0042" src='/ConfigurationImages/MembershipActive.png' />
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/settings/membership">
                        <img id="img0041" src='/ConfigurationImages/Membership.png' />
                    </a>
                </c:otherwise>
            </c:choose>
            </td>
        </tr>

        <!-- Taxes -->
        <tr>
            <td>
        <c:choose>
            <c:when test="${configActiveTab=='federalTax'}">
                <a href="${pageContext.request.contextPath}/settings/taxes?type=federalTax">
                    <img id="img0040" src='/ConfigurationImages/FederalTaxActive.svg' />
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/settings/taxes?type=federalTax">
                    <img id="img0039" src='/ConfigurationImages/FederalTax.svg' />
                </a>
            </c:otherwise>
        </c:choose>
        </td>


        </tr>

        <tr>
            <td>
        <c:choose>
            <c:when test="${configActiveTab=='stateTax'}">
                <a href="${pageContext.request.contextPath}/settings/state-tax?type=stateTax">
                    <img id="img0040" src='/ConfigurationImages/StateTaxActive.svg' />
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/settings/state-tax?type=stateTax">
                    <img id="img0039" src='/ConfigurationImages/StateTax.svg' />
                </a>
            </c:otherwise>
        </c:choose>
        </td>


        </tr>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    function EnableDisableFields() {
        /* if(document.configurationForm.mailAuth.checked==true){
         document.configurationForm.mailUserName.disabled=false;
         document.configurationForm.mailPassword.disabled=false;
         }
         else{
         document.configurationForm.mailUserName.disabled=true;
         document.configurationForm.mailPassword.disabled=true;
         } */
    }

    function SetLabelName(lblid) {
        size = document.getElementById('lblsize').value;
        for (cnt = 0; cnt < size; cnt++) {
            lid = document.getElementById(cnt + 'lid').value;
            if (lblid == lid) {
                document.configurationForm.labelName.value = document.getElementById(cnt + 'lname').value;
                break;
            }
        }
    }

    function init() {

        var t = <%= request.getParameter("tab") %>
        var tabId = <%= request.getAttribute("tab")%>;
        if (t) {
            SetRow1(t);
            setLogo();
            <c:if test="${not empty EmpState}">
        refreshItemsNow(document.configurationForm.empCountryID.value,'${EmpState}');
            </c:if>
            EnableDisableFields();
        }
        if (tabId) {
            SetRow(tabId);
            setLogo();
            /* <c:if test="${not empty EmpState}">
             refreshItemsNow(document.configurationForm.empCountryID.value,'${EmpState}');
             </c:if> */
            EnableDisableFields();
        } else
        {
            SetRow('tr1');
            setLogo();
            <c:if test="${not empty EmpState}">
                  refreshItemsNow(document.configurationForm.empCountryID.value,'${EmpState}');
                </c:if>
            EnableDisableFields();
        }
    }

    function SetRow(rid) {
        setTableVisible(rid);
    }

    function SetRow1(t)
    {
        var t1 = '<%= request.getParameter("tab") %>';
        setTableVisible1(t1);
    }

    function setTableVisible(rid)
    {
        if (rid == "tr1") {
            document.getElementById('general').style.display = 'block';
        } else if (rid == "tr2") {
            document.getElementById('general').style.display = 'block';
        } else if (rid == "tr3") {
            document.getElementById('accountPayment').style.display = 'block';
        } else if (rid == "tr4") {
            document.getElementById('nw').style.display = 'block';
        } else if (rid == "tr5") {
            document.getElementById('moduleMenu').style.display = 'block';
        } else if (rid == "tr28") {
            document.getElementById("datamanager").style.display = 'block';
        } else if (rid == "tr6") {
            document.getElementById("customerInvoice").style.display = 'block';
        } else if (rid == "tr8") {
            document.getElementById('inventory').style.display = 'block';
        } else if (rid == "tr9") {
            document.getElementById('formCustomization').style.display = 'block';
        } else if (rid == "tr10") {
            document.getElementById('purchase').style.display = 'block';
        } else if (rid == "tr11") {
            document.getElementById('employee').style.display = 'block';
        } else if (rid == "tr12") {
            document.getElementById('tax').style.display = 'block';
        }

        else if (rid == "tr15")
        {
            document.getElementById('shipping').style.display = 'block';
        }

        else if (rid == "tr20") {
            document.getElementById('deviceManager').style.display = 'block';
        } else if (rid == "tr40") {
            document.getElementById('posConfiguration').style.display = 'block';
        } else if (rid == "tr21") {
            document.getElementById('paymentGateway').style.display = 'block';
        } else if (rid == "tr22") {
            document.getElementById('printerSetup').style.display = 'block';
        } else if (rid == "tr23") {
            document.getElementById('membership').style.display = 'block';
        }

    }

    function setTableVisible1(t1)
    {
        if (t1 == "tr1") {
            document.getElementById('general').style.display = 'block';
        } else if (t1 == "tr2") {
            document.getElementById('general').style.display = 'block';
        } else if (t1 == "tr3") {
            document.getElementById('accountPayment').style.display = 'block';
        } else if (t1 == "tr4") {
            document.getElementById('nw').style.display = 'block';
        } else if (t1 == "tr5") {
            document.getElementById('moduleMenu').style.display = 'block';
        } else if (t1 == "tr28") {
            document.getElementById("datamanager").style.display = 'block';
        } else if (t1 == "tr6") {
            document.getElementById("customerInvoice").style.display = 'block';
        }
        /*else if(t1=="tr7"){
         document.getElementById('estimation').style.display='block';
         }*/
        else if (t1 == "tr8") {
            document.getElementById('inventory').style.display = 'block';
        } else if (t1 == "tr9") {
            document.getElementById('formCustomization').style.display = 'block';
        } else if (t1 == "tr10") {
            document.getElementById('purchase').style.display = 'block';
        } else if (t1 == "tr11") {
            document.getElementById('employee').style.display = 'block';
        } else if (t1 == "tr12") {
            document.getElementById('tax').style.display = 'block';
        }

        else if (t1 == "tr15") {
            document.getElementById('shipping').style.display = 'block';
        }

        else if (t1 == "tr20") {
            document.getElementById('deviceManager').style.display = 'block';
        } else if (t1 == "tr40") {
            document.getElementById('deviceManager').style.display = 'block';
        } else if (t1 == "tr21") {
            document.getElementById('paymentGateway').style.display = 'block';
        } else if (t1 == "tr22") {
            document.getElementById('printerSetup').style.display = 'block';
        } else if (t1 == "tr23") {
            document.getElementById('membership').style.display = 'block';
        }

    }

    function SetRowColor(rid)
    {
        for (i = 1; i <= 12; i++)
        {
            var row1 = document.getElementById("tr" + i);
            if (row1.className == "draft")
                row1.className = "draft";
            else
                row1.style.background = '#FFFFFF';
        }
        var rd = document.getElementById(rid);
        rd.style.background = '#8798DE';
    }

    function SetRowColor(t)
    {
        for (i = 1; i <= 12; i++)
        {
            var row1 = document.getElementById(i);
            if (row1.className == "draft")
                row1.className = "draft";
            else
                row1.style.background = '#FFFFFF';
        }
        var rd = document.getElementById("tab");
        rd.style.background = '#8798DE';
    }

    function setImagePreview()
    {
        pathv = document.configurationForm.invoiceDefaultLogo.value;
        image = document.getElementById('previewIMG');
        if (window.event)
        {
            path = pathv.replace(/\\/, '/');
        } else
        {
            path = 'File:\/\/' + pathv;
        }
        image.src = path;
        image.style.display = 'block';
        image.style.width = "150px";
        image.style.height = "150px";
    }
    function setLogo()
    {
        image = document.getElementById('previewIMG');
        <c:if test="${not empty path}">
                <c:if test="${not empty Image}">
                        path = 'uploadedImages/${Image}';
                        path = path.replace(/\\/, '/');
                        image.src=path;
                        image.style.display = 'block';
                        image.style.width = "150px";
                        image.style.height = "150px";
                </c:if>
        </c:if>
}
</script>
