package com.payroll.super_admin.controller;

import com.payroll.super_admin.entity.PaymentGatewayConfig;
import com.payroll.super_admin.service.PaymentGatewayConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/payment_gateway")

public class PaymentGatewayController {

	@Autowired
	private PaymentGatewayConfigService service;

	@GetMapping
	public String showPaymentGateway(@RequestParam(value = "updated", required = false) String updated,Model model) {

		PaymentGatewayConfig config = service.getConfig();
		
		// Don’t expose sensitive info
		model.addAttribute("config", config);


          // Handle success message based on 'updated' query param
    if ("stripe".equalsIgnoreCase(updated)) {
        model.addAttribute("message", "Stripe configuration saved successfully!");
        model.addAttribute("savedType", "stripe");
    } else if ("paypal".equalsIgnoreCase(updated)) {
        model.addAttribute("message", "PayPal configuration saved successfully!");
        model.addAttribute("savedType", "paypal");
    }

		return "th/paymentGateway/payment_gateway";
	}



@PostMapping("/saveStripe")
public String saveStripe(@ModelAttribute PaymentGatewayConfig formData,
                         RedirectAttributes redirectAttributes) {

    PaymentGatewayConfig config = service.getConfig();
    config.setStripeStatus(formData.getStripeStatus());
    config.setPublishedKey(formData.getPublishedKey());
    config.setApiKey(formData.getApiKey());
    service.saveOrUpdate(config);

    return "redirect:/payment_gateway?updated=stripe";
}

@PostMapping("/savePaypal")
public String savePaypal(@ModelAttribute PaymentGatewayConfig formData,
                         RedirectAttributes redirectAttributes) {

    PaymentGatewayConfig config = service.getConfig();
    config.setPaypalStatus(formData.getPaypalStatus());
    config.setPaypalClientId(formData.getPaypalClientId());
    config.setPaypalSecret(formData.getPaypalSecret());
    service.saveOrUpdate(config);

    return "redirect:/payment_gateway?updated=paypal";
}


	

}






