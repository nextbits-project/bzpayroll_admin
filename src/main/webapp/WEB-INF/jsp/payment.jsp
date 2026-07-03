<h3>Membership Payment</h3>

<p>Plan: ${registerDto.membershipLevel}</p>
<p>Amount: $49.99</p>

<form action="/process-payment" method="post">

    <label>Card Number</label>
    <input type="text" name="cardNumber">

    <label>Expiry</label>
    <input type="text" name="expiry">

    <label>CVV</label>
    <input type="password" name="cvv">

    <button type="submit">
        Pay Now
    </button>

</form>