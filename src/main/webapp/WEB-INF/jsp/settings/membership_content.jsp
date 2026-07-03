<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.plan-amount-details{
  height: 80px;background-color: #05A9C5 ;padding-top: 20px;
  padding-bottom: 20px;
 font-weight: bold;
}
.plan-amount-details h2{
    color: #fff !important;
}
.plan-details{
  display: flex;flex-direction: column;width: 100%;align-items: center;
}

.items-listing-info{
  height: 150px;
}
.items-listing-info li{
  line-height: 2.0em !important;
}
.paypal-btn{
  background-color: unset !important;
  background-image: url('/images/subscibe-btn.png') !important;
  width: 200px !important;
  height: 75px !important;
  box-shadow: unset !important;
  cursor: pointer;
  border: 0;
}
img {
    height: auto;
    max-width: 100%;
}
</style>
<script type="text/javascript">
function subscribePlan(plan){
    window.location = "/paypal-payment-process/"+plan;
}
</script>

<div id="membershipPlansOnly" style="height:auto; padding: 20px;">
    <!-- Membership Plans Starts -->
    <div class="membership-header">
      <div class="row text-center">
        <div class="col-12">
          <h2><spring:message code="BzComposer.membership.chooseYourPricing"/></h2>
          <p><spring:message code="BzComposer.membership.chooseYourPricingMsg"/></p>
        </div>
      </div>
    </div>
    <div class="membership-content">
        <div class="row text-center">
          <c:forEach items="${membershipPlans}" var="mp">
            <div class="col-sm-3 mb-3">
                <div class="card">
                    <div class="plan-amount-details">
                      <h2>$${mp.amount}<span style="color: #fff !important;font-weight: 100 !important;">/month</span></h2>
                    </div>
                    <div class="plan-details text-center">
                      <h3 style="color: #337ab7;font-size: 1.3rem;font-weight: bold;">
                        ${mp.planName}
                      </h3>
                      <ul class="items-listing-info">
                        <c:if test="${mp.planCode == 'FREE_TRIAL'}">
                          <li><spring:message code="BzComposer.membership.for5Listing"/></li>
                          <li><spring:message code="BzComposer.membership.allowUpto5Listings"/></li>
                          <li><spring:message code="BzComposer.membership.allowUpto5Images"/></li>
                        </c:if>
                        <c:if test="${mp.planCode == 'STANDARD'}">
                          <li><spring:message code="BzComposer.membership.for10Listing"/></li>
                          <li><spring:message code="BzComposer.membership.allowUpto10Listings"/></li>
                          <li><spring:message code="BzComposer.membership.allowUpto10Images"/></li>
                        </c:if>
                        <c:if test="${mp.planCode == 'SILVER'}">
                          <li><spring:message code="BzComposer.membership.for100Listing"/></li>
                          <li><spring:message code="BzComposer.membership.allowUpto100Listings"/></li>
                          <li><spring:message code="BzComposer.membership.allowUpto100Images"/></li>
                        </c:if>
                        <c:if test="${mp.planCode == 'GOLD'}">
                          <li><spring:message code="BzComposer.membership.forUnlimitedListing"/></li>
                          <li><spring:message code="BzComposer.membership.allowUptoUnlimitedListings"/></li>
                          <li><spring:message code="BzComposer.membership.allowUptoUnlimitedImages"/></li>
                        </c:if>
                      </ul>
                      <c:choose>
                          <c:when test="${mp.id == subscription.plan.id}">
                              <h4 style="color:#337ab7;font-weight:bold;">
                                  Current Plan
                                  <br>Renews ${RenewDate}
                              </h4>
                          </c:when>
                          <c:otherwise>
                              <div class="pricing-btn" ><button type="button" class="paypal-btn" onclick="upgradePlan(${mp.id})"></button></div>
                          </c:otherwise>
                      </c:choose>
                    </div>
                </div>
            </div>
          </c:forEach>
        </div>
    </div>
    <!-- Membership Plans Ends -->
</div>

<script>
  function upgradePlan(planId){
    $.ajax({
        url: '/payment/upgrade-plan/'+planId,
        type: 'GET',
        success: function (data) {
          if(data == "Login"){
            window.location.href = "/login";	
          }
          window.location.href = data;	
        },
        error: function (xhr, status, error) {
            console.error('AJAX error:', error);
        }
    });
  }
</script>