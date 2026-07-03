const contentMap = {
overview: `
<h1 style="color: #0000ff;"><span style="color: #000080;"><font color=navy >Welcome to BizComposer</font></span></h1>

<h1 style="color: #0000ff; font-size: 12pt;">Overview</h1>

<p class="hcp1">BizComposer has been created to assist you 
 in your bookkeeping and accounting needs so that you may manage your business 
 more easily and productively.</p>

<p class="hcp1">This program will allow you to perform functions 
 that will support your business needs:</p>

<ul style="list-style: disc;"
	type=disc>
	
	<li class="kadov-p"><p class="hcp1">Invoice - Keep track 
 of how many items you have sold in one transaction.</p></li>
	
	<li class="kadov-p"><p class="hcp1">Purchase Order - See 
 how many products you bought from individual vendors.</p></li>
	
	<li class="kadov-p"><p class="hcp1">Sales Report - Glimpse 
 at your current sales.</p></li>
	
	<li class="kadov-p"><p class="hcp1">Product - Look at your 
 current inventory. </p></li>
	
	<li class="kadov-p"><p class="hcp1">Customer and Vendor - 
 Save contact and billing information.</p></li>
	
	<li class="kadov-p"><p class="hcp1">Payroll - Manage and 
 plan your own payroll processing.</p></li>
</ul>

<p style="font-style: italic; font-size: 10pt;">plus more...</p>
`,
setupBiz: `
<h1 style="color: #000080; font-size: 12pt;">Setting up BizComposer</h1>
<p class="hcp1">When starting up BizComposer, a window will 
 appear displaying options to use the program.</p>

 <img src="images/help/BizOpen.jpg"/>

</br>
</br>
<p class="hcp1">At this window you may:</p>
<ul type="disc" class="hcp2">
	<ul type="disc" class="hcp2">
		<li class="kadov-p"><p class="hcp1"><span class="hcp3"><font color=navy ><B>Create 
 a new company</B></font></span>: &nbsp;Select 
 this option to begin the process of creating a company file.</p></li>
	</ul>
</ul>
<ul type="disc" class="hcp2">
	<ul type="disc" class="hcp2">
		
		<li class="kadov-p"><p class="hcp1"><span class="hcp3"><font color=navy ><B>Open 
 an existing company</B></font></span>: &nbsp;Select 
 this option if you have already created your company information and would 
 like to continue with that file.</p></li>
	</ul>
</ul>
<ul type="disc" class="hcp2">
	
	<ul type="disc" class="hcp2">
		
		<li class="kadov-p"><p class="hcp1"><span class="hcp3"><font color=navy ><B>Delete 
 an existing company</B></font></span>: &nbsp;Select 
 this option if you would like to discard any existing file you have already 
 created</p></li>
	</ul>
</ul>

<p class="hcp1">&nbsp;</p>

<p class="hcp1">When you are ready to continue press &quot;OK.&quot;</p>`,
CreatingNewCompanyFile: `
<h1 style="color: #000080; font-size: 12pt;">Creating a new company file</h1>

<p class="hcp1">This is where you store all your company's 
 information that is to be printed when printing an Invoice, Estimate, 
 Purchase Order, and other forms.</p>


<p class="hcp1">To create a new company file, input your company 
 name into the field. &nbsp;You 
 may also choose to set your file to &quot;Connect as a Network Client&quot; 
 which allows you to log onto a company profile on a remote server.</p>


<p class="hcp1">Choose your &quot;Connection Mode.&quot;</p>


<p class="hcp1">When you are ready to continue press &quot;Next,&quot; 
 or you may &quot;Cancel&quot; your progress at any time.</p>
`,
SettingUpYourCompanyInformation: `
<h1 style="color: #000080; font-size: 12pt;">Setting up your Company Information</h1>

<p style="font-size: 10pt;">To set up your company information, fill out 
 all the fields in the following window. &nbsp;Be 
 accurate with your information, this is where you store all your company�s 
 information that is to be shown when printing an Invoice, Estimate, Purchase 
 Order, or other forms.</p>

<p>&nbsp;</p>

<img src="images/help/bizcompinfo.jpg" />

<p>&nbsp;</p>

<p style="font-weight: bold;">Company Information:</p>

<ul style="list-style: disc;"
	type=disc>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><I>Company Name:</I></span> &nbsp;This 
 field will already be filled out for you, if you had input a company name 
 prior to this page.</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><I>Description</I></span>: In this field you may 
 enter any information describing your business or business type which 
 can be seen by your clients or vendors. </p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><I>Address:</I></span> &nbsp;Input<span class="hcp2"> <I></I></span>your business address here, including 
 any suite numbers, room numbers, etc. (e.g. 111 Market St Suite # 469)</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><I>City, State, Province, Zip/Postal Code, Country:</I></span> 
 &nbsp;Input the 
 city which your business is located. &nbsp;Use 
 the drop down box to choose which State you are in, unless your business 
 is outside of the U.S. fill in the Province which your business is located 
 and choose the Country in the drop down box.</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><I>Phone/Fax Number: &nbsp;</I></span>You 
 may include all available phone/fax numbers for your business that you 
 wish to be contacted at.</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><I>Email: &nbsp;</I></span>Include 
 your email address which you can be reached at.</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><I>Homepage: &nbsp;</I></span>If 
 you or your company has a website, include it into this field, so that 
 it may be viewable by your clients. &nbsp;</p></li>
	
	<li class="kadov-p"><p class="hcp1"> <span class="hcp2"><I>Federal Employer ID, State Employer ID: &nbsp;</I></span>In 
 this field you must include your Federal and State Employer ID.</p></li>
</ul>

<p class="hcp1">When you are ready to 
 continue press &quot;Next,&quot; or you may &quot;Cancel&quot; your progress 
 at any time.</p>

<p class="hcp1">You can always edit any 
 prior information by clicking the &quot;Back&quot; button.</p>
`,
SettingUpYourAccountInformation: `
<h1 style="font-size: 12pt; color: #000080;">Setting up Your Company's 
 Account Information</h1>

<p class="hcp2">Setting up your company's account information 
 is quite simple. &nbsp;This 
 will allow you to manage your business and personal finances more accurately. 
 &nbsp;</p>
<img src="images/help/account.jpg" />
<ol style="list-style: decimal;"
	type=1>
	<li style="/*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp2">Select the type of account 
 from either the left box or the drop down menu under category. &nbsp;</p></li>
	
	<li style="/*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp2">Input the name of the 
 account so that you may recognize your accounts easily.</p></li>
	
	<li style="/*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp2">Input the starting balance 
 for each account.</p></li>
	
	<li style="/*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp2">To save the information 
 click on the &quot;Save&quot; button. &nbsp;You 
 should notice a folder appear next to the account type which you have 
 select and the specific name on the account in that subcategory.</p></li>
</ol>
<p style="text-align: right; font-size: 10pt;" Align="right">&nbsp;</p>
<p class="hcp2">Please note that by pushing the &quot;New&quot; 
 button, all fields will be cleared. &nbsp;You 
 may enter as many accounts as you would prefer. &nbsp;When 
 you are ready to continue press &quot;Next,&quot; or you may &quot;Cancel&quot; 
 your progress at any time. &nbsp;You 
 can always edit any prior information by clicking the &quot;Back&quot; 
 button.</p>`,
 CreatingCompanyPreferences: `
 <h1 style="font-size: 12pt; color: #000080;">Preferences</h1>

<p class="hcp1">This part of the set-up process allows you 
 to create preferences for your business account by establishing features 
 you will want to use in BizComposer. &nbsp;You 
 will be able to select between these preferences as you create your customer 
 list. &nbsp;You 
 are also able to &quot;Add&quot; or &quot;Remove&quot; any sub-preference 
 under each Preference folder. &nbsp;</p>

<p class="hcp1">To &quot;Add&quot; a sub-preference: &nbsp;Select 
 a Preference category in the left pane to highlight, and then input the 
 Category name in the field on the right and click the &quot;Add&quot; 
 button to add it into the sub-preference field. &nbsp;</p>

<p class="hcp1">To &quot;Remove&quot; a sub-preference: &nbsp;Select 
 a subcategory under any Preference folder in the left pane to highlight, 
 and then click on the &quot;Remove&quot; button to remove it from your 
 Preference window. &nbsp;In 
 order to reobtain a sub-preference you have removed, you will have to 
 create a new sub-preference with the same name, and add it to the appropriate 
 field.</p>

<p>&nbsp;</p>

<img src="images/help/Preferences.jpg"/>
   <p> <span style="font-size: 10pt; font-weight: bold;"><font size="2" class="hcp2"><B>Term:</B></font></span><span 
 style="font-size: 10pt;"> <font size="2" class="hcp2">&nbsp;Here 
 you may set defined payment terms, or define a new one.</font></span></p>

<p class="hcp1"><span class="hcp3"><B>Sales Rep:</B></span> 
 &nbsp;Specify 
 a list of Sales Reps to track any type of commission or to connect a person 
 to a customer.</p>

<p class="hcp1"><span class="hcp3"><B>Currency:</B></span> 
 &nbsp;Specify 
 the type(s) of currency used in your business.</p>

<p class="hcp1"><span class="hcp3"><B>Item Category:</B></span> 
 &nbsp;This is 
 to place the different types of items, services, products, etc. which 
 you are selling.</p>

<p class="hcp1"><span class="hcp3"><B>Credit Card 
 Type:</B></span> &nbsp;Specify 
 the types of credit cards you will be using, or accepting, in your business, 
 if any.</p>

<p class="hcp1"><span class="hcp3"><B>Payment Type: 
 &nbsp;</B></span>Specify 
 the types of payments you will be using, or accepting, in your business.</p>

<p class="hcp1"><span class="hcp3"><B>Ship Carrier:</B></span> 
 &nbsp;If your 
 company ships out its products to your clients, you may use this preference 
 to set the different shipping couriers you will be using.</p>

<p class="hcp1"><span class="hcp3"><B>Customer/Vendor 
 Category:</B></span> &nbsp;Here 
 you may specify the different types of customer/vendors you will be providing 
 your products/services to. (i.e. Wholesalers, Retailers, etc.)</p>

<p class="hcp1"><span class="hcp3"><B>Invoice Status:</B></span> 
 &nbsp;This will 
 list the status of your sales or orders which you will be able to mark 
 as paid,shipped, pending, etc. &nbsp;</p>

<p class="hcp1"><span class="hcp3"><B>Tax:</B></span> 
 &nbsp;Here you 
 will be able to specify whether or not there will be a sales tax involved 
 during purchases.</p>

<p class="hcp1">&nbsp;</p>

<p class="hcp4"><span style="font-weight: normal; font-size: 10pt;"><font size="2" class="hcp2">When 
 you are ready to continue press &quot;Next,&quot; or you may &quot;Cancel&quot; 
 your progress at any time.</font></span></p>

<p class="hcp4">You can always edit any 
 prior information by clicking the &quot;Back&quot; button.</p>
 `,
CreatingYourCustomerList: `
<h1 style="font-size: 12pt; color: #000080;">Creating your Customer List</h1>

<p class="hcp1">A Customer List is created in order for your 
 business to obtain easy access to customer and consumer information, also 
 allowing your business to keep track of any information needed to productively 
 process orders and sales, as well as your bookkeeping. &nbsp;When 
 creating your customer list, all the information filled out in the &quot;General&quot; 
 field will be used as the company's default information. &nbsp;Editing 
 the information will be available after you have filled out the customer's 
 information. &nbsp;</p>

<p class="hcp1">After completing a Customer List, you will 
 have the option to sort the list by Company or by Name. &nbsp;To 
 do so check the appropriate box which you wish the list to be sorted by. 
 &nbsp;Note that 
 if you choose to sort by name, the list will be sorted by the Last Name. 
 &nbsp;</p>

<p class="hcp1">You may also make a side note for each customer 
 by either restraining their account on hold, or noting whether each customer 
 is a vendor or not(by checking this option this listing will also be included 
 in the Vendor list). &nbsp;To 
 do so, check either box in the upper right corner or the dialog box. &nbsp;</p>

<p class="hcp1">Other fields you will be able to Input/Edit:</p>

<ul style="list-style: disc;"
	type=disc>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B><a 
 href="Customer_List_general.htm">General</a></B></span> - Contact information 
 </p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B><a 
 href="Customer_list_Sales_Account.htm">Sales/Account</a></B></span> - Default 
 Settings, Credit Card Information, Account Transfer Information</p></li>
	
	<li class="kadov-p"><p class="hcp3"><a 
 href="_Customer_List_Billing_Shipping_Address.htm">Billing Address</a><span class="hcp4"> - The address you wish to bill to</span></p></li>
	
	<li class="kadov-p"><p class="hcp3"><a 
 href="_Customer_List_Billing_Shipping_Address.htm">Shipping Address</a><span class="hcp4"> - The address you wish to ship to</span></p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B><a 
 href="Customer_List_Memo.htm">Memo</a></B></span> - Any other information 
 you wish to include on a customer.</p></li>
</ul>

<p class="hcp1">(all fields denoted with a * are required to 
 be filled out.)</p>

<p class="hcp1">Each one of these fields will be attributed 
 to a single customer. &nbsp;After 
 completing all fields you may click &quot;Save&quot; to save the listing 
 to your Customer List. &nbsp;If 
 you have more than one customer you may click &quot;New&quot; after saving 
 your information and continue creating another listing.</p>

<p class="hcp1">After you have finished compiling your Customer 
 List and you are ready to continue press &quot;Next,&quot; or you may 
 &quot;Cancel&quot; your progress at any time. <span style="font-weight: normal; font-size: 10pt;"><font size=2 style="font-size:10pt;">You 
 can always edit any prior information by clicking the &quot;Back&quot; 
 button.</font></span></p>
`,
CreatingYourVendorList: `
<h1 style="font-size: 12pt; color: #000080;">Creating your Vendor List</h1>

<p class="hcp1"><span style="font-size: 10pt;"><font size="2" class="hcp2">A Vendor List 
 is much like the Customer List and is created in order for your business 
 to obtain easy access to vendor information, also allowing your business 
 to keep track of any information needed to productively process orders 
 and sales, as well as your bookkeeping. &nbsp;When 
 creating your vendor list, all the information filled out in the &quot;General&quot; 
 field will be used as the company's default information. &nbsp;Editing 
 the information will be available after you have filled out the vendor's 
 information. &nbsp;</font></span></p>

<p class="hcp1">After completing a Vendor List, you will have 
 the option to sort the list by Company or by Name. &nbsp;To 
 do so check the appropriate box which you wish the list to be sorted by. 
 &nbsp;Note that 
 if you choose to sort by name, the list will be sorted by the Last Name. 
 &nbsp;</p>

<p class="hcp1">You may also make a side note for each vendor 
 by either restraining their account on hold, or noting whether each vendor 
 is a customer as well(by checking this option this listing will also be 
 included in the Customer List). &nbsp;To 
 do so, check either box in the upper right corner or the dialog box. &nbsp;</p>

<p class="hcp1">Other fields you will be able to Input/Edit:</p>

<ul style="list-style: disc;"
	type=disc>
	<li class="kadov-p"><p class="hcp1"><span class="hcp3"><B><a 
 href="Vendor_List_General.htm">General</a></B></span> - Contact information.</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp3"><B><a 
 href="Vendor_List_Sales_Account.htm">Sales/Account</a></B></span> - Default 
 Settings, Account Transfer Information, Memo.</p></li>
</ul>

<p class="hcp1">(all fields denoted with a * are required to 
 be filled out.)</p>

<p class="hcp1">Each one of these fields will be attributed 
 to a single vendor. &nbsp;After 
 completing all fields you may click &quot;Save&quot; to save the listing 
 to your Vendor List. &nbsp;If 
 you have more than one vendor you may click &quot;New&quot; after saving 
 your information and continue creating another listing.</p>

<p class="hcp1">After you have finished compiling your Vendor 
 List and you are ready to continue press &quot;Next,&quot; or you may 
 &quot;Cancel&quot; your progress at any time. <span style="font-weight: normal; font-size: 10pt;"><font size="2" class="hcp2">You 
 can always edit any prior information by clicking the &quot;Back&quot; 
 button.</font></span></p>
`,
GeneralInformation: `
 <h1 style="font-size: 12pt; color: #000080;">General Information (Customer List)</h1>

<img src="images/help/customer-list_general.jpg" />
<p class="hcp1">&nbsp;</p>
<p style="font-weight: bold;"><span><B>Contact Information:</B></span></p>

<ul style="list-style: disc;"
	type=disc>
	
	<li class="kadov-p"><p class="hcp2"><span class="hcp3"><B>Company Name</B></span><span class="hcp4"><I>:</I></span> 
 &nbsp;Input the 
 company name of your customer, if any.</p></li>
	
	<li class="kadov-p"><p class="hcp2"><span class="hcp3"><B>First Name, Last Name: &nbsp;</B></span><span>Specify 
 the First and Last name of your Customer.</span> </p></li>
	
	<li class="kadov-p"><p class="hcp2"><span class="hcp3"><B>Address</B></span><span class="hcp4"><I>:</I></span> 
 &nbsp;Input<span class="hcp4"> <I></I></span>your customer's address here, including 
 any suite numbers, room numbers, etc. (e.g. 111 Market St Suite # 469)</p></li>
	
	<li class="kadov-p"><p class="hcp2"><span class="hcp3"><B>City, State, Province, Zip/Postal Code, Country</B></span><span class="hcp4"><I>:</I></span> &nbsp;Specify 
 the city which your customer, or customer's business, is located. &nbsp;Use 
 the drop down box to choose the State; unless the business is outside 
 of the U.S., fill in the Province which the business is located and choose 
 the Country in the drop down box.</p></li>
	
	<li class="kadov-p"><p class="hcp2"><span class="hcp3"><B>Phone/Fax Number</B></span><span class="hcp4"><I>: 
 &nbsp;</I></span><span>Specify 
 any phone/fax numbers you may want to include for your customer.</span></p></li>
	
	<li class="kadov-p"><p class="hcp2"><span class="hcp3"><B>Email</B></span><span class="hcp4"><I>: 
 &nbsp;</I></span>Include 
 the customer's email address which they can be contacted.</p></li>
	
	<li class="kadov-p"><p class="hcp2"><span class="hcp3"><B>Homepage</B></span><span class="hcp4"><I>: 
 &nbsp;</I></span>If 
 the customer has a website, include it into this field.</p></li>
	
	<li class="kadov-p"> <p class="hcp2"> <span class="hcp3"><B>Tax ID</B></span><span class="hcp4"><I>: 
 &nbsp;</I></span>Specify the Tax ID for the customer.</span></p></li>
	
	<li class="kadov-p"><p class="hcp2"><span class="hcp3"><B>Taxable</B></span><span>:</span><span class="hcp3"> 
 <B>&nbsp;&nbsp;</B></span>Check 
 the box if this customer is taxable, leave it unchecked if they are not.</p></li>
</ul>

<p class="hcp2">&nbsp;</p>

<p class="hcp2">The information used in 
 this window will be used as the company's default information.</p>

<p class="hcp2">&nbsp;</p>
`,
Sales_Account: `
<h1 style="font-size: 12pt; color: #000080;">Sales/Account (Customer List)</h1>

<p class="hcp1">The Sales/Account information allows you to 
 create particular account settings to be used while processing sales and 
 purchases when dealing with specific customers from your Customer list. 
 &nbsp;Many of 
 the settings will have options available to you in drop-down menus which 
 were created earlier in the Preferences
 set up.</p>

<p class="hcp1">&nbsp;</p>

<img src="images/help/salesaccount-cust-list.jpg" />

<ul type="disc" class="hcp2">
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp3"><B>Default 
 Settings</B></span>: &nbsp;</p></li>
	
	<ul type="disc" class="hcp2">
		
		<li class="kadov-p"><p class="hcp1">Term: &nbsp;Set 
 defined payment terms.</p></li>
		
		<li class="kadov-p"><p class="hcp1">Sales Rep: &nbsp;Select 
 a Sales Reps to track any type of commission or to connect a person to 
 a customer.</p></li>
		
		<li class="kadov-p"><p class="hcp1">Payment Method:<span class="hcp3"> <B>&nbsp;</B></span>Select 
 the type of payment you will be using, or accepting, from your customer.</p></li>
		
		<li class="kadov-p"><p class="hcp1">Ship Carrier: &nbsp;Set 
 the shipping courier you will be using.</p></li>
	</ul>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp3"><B>Credit 
 Card Information</B></span>:</p></li>
	
	<ul type="disc" class="hcp2">
		
		<li class="kadov-p"><p class="hcp1">Credit Card Type: 
 &nbsp;Select 
 credit card your company will be accepting.</p></li>
		
		<li class="kadov-p"><p class="hcp1">Card Holder Name, 
 Card Number, Exp. Date: &nbsp;Input 
 all the credit card information.</p></li>
	</ul>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp3"><B>Account 
 Transfer Information</B></span>:</p></li>
	
	<ul type="disc" class="hcp2">
		
		<li class="kadov-p"><p class="hcp1">In this field you 
 will be able to keep track of expenses unpaid or credited with the customer.</p></li>
	</ul>
</ul>

<p class="hcp1">&nbsp;</p>

<p style="font-weight: normal; font-size: 10pt;">&nbsp;</p>
`,
BillingShippingAddress: `
<h1 style="font-size: 12pt; color: #000080;">Billing/Shipping Address (Customer List)</h1>


<p class="hcp2">Sometimes a customer, or business, will have 
 separate shipping and billing addresses. &nbsp;A 
 shipping address is the location which all packages and items will be 
 sent to, whereas the billing address is usually the address which is directly 
 connected to a credit card or any other payment type. &nbsp;</p>

<img src="images/help/customer-list-billing-shipp.jpg" />
<p class="hcp2">&nbsp;</p>
<p class="hcp2">If the Billing and Shipping 
 Address are the same as the default address(the address used in the general 
 information of your customer list), you do not have to complete these 
 fields. &nbsp;They 
 will be automatically filled for you by <span class="hcp3"><I>checking</I></span> 
 the &quot;Use default address&quot; box at the top of the dialog box. 
 &nbsp;</p>

<p class="hcp2">&nbsp;</p>

<p class="hcp2">If the Billing or Shipping Address differ 
 from the default address <span class="hcp3"><I>uncheck</I></span> 
 the &quot;Use default address&quot; box and fill in the required information.</p>
`,
Memo: `
<h1 style="font-size: 12pt; color: #000080;">Memo (Customer List)</h1>

<p class="hcp1">The Memo portion of your Customer List is not 
 mandatory. &nbsp;It 
 is simply used for any other information that you may want to be included 
 with the description of your customer. &nbsp;If 
 you do use a Memo for your Customer List, it will be viewable to you when 
 you select that specific customer. &nbsp;</p>


<p class="hcp1"><span style="font-size: 10pt;"><font size="2" class="hcp2">After completing 
 all fields you may click &quot;Save&quot; to save the listing to your 
 Customer List. &nbsp;If 
 you wish to list another customer you may click &quot;New&quot; after 
 saving your information and continue creating another listing.</font></span></p>


<p class="hcp1">When you have finished compiling your Customer 
 List and you are ready to continue press &quot;Next,&quot; or you may 
 &quot;Cancel&quot; your progress at any time. <span style="font-weight: normal; font-size: 10pt;"><font size="2" class="hcp2">You 
 can always edit any prior information by clicking the &quot;Back&quot; 
 button.</font></span></p>
`,
GeneralInformationVendorList: `
<h1 style="font-size: 12pt; color: #000080;">General Information (Vendor 
 List)</h1>

<p style="font-weight: bold;">Contact Information:</p>
<img src="images/help/vendorlistgeneral.jpg"/>
<p class="hcp2">&nbsp;</p>
<ul style="list-style: disc;"
	type=disc>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B>Company Name</B></span><span class="hcp3"><I>:</I></span> 
 &nbsp;Input the 
 company name of your vendor.</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B>First Name, Last Name: &nbsp;</B></span><span>Specify 
 the First and Last name of your vendor.</span> </p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B>Address</B></span><span class="hcp3"><I>:</I></span> 
 &nbsp;Input<span class="hcp3"> <I></I></span>your vendor's address here, including 
 any suite numbers, room numbers, etc. (e.g. 111 Market St Suite # 469)</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B>City, State, Province, Zip/Postal Code, Country</B></span><span class="hcp3"><I>:</I></span> &nbsp;Specify 
 the city which your vendor is located. &nbsp;Use 
 the drop down box to choose the State; unless the business is outside 
 of the U.S., fill in the Province which the business is located and choose 
 the Country in the drop down box.</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B>Phone/Fax Number</B></span><span class="hcp3"><I>: 
 &nbsp;</I></span><span>Specify 
 any phone/fax numbers you may want to include for your vendor.</span></p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B>Email</B></span><span class="hcp3"><I>: 
 &nbsp;</I></span>Include 
 the vendor's email address which they can be contacted.</p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B>Homepage</B></span><span class="hcp3"><I>: 
 &nbsp;</I></span>If 
 the vendor has a website, include it into this field.</p></li>
	
	<li class="kadov-p">
       <p class="hcp1"><span class="hcp2"><B>Tax ID</B></span><span class="hcp3"><I>: 
 &nbsp;</I></span>
        Specify the Tax ID for the vendor.</span></p></li>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp2"><B>Taxable</B></span><span>:</span><span class="hcp2"> 
 <B>&nbsp;&nbsp;</B></span>Check 
 the box if this vendor is taxable, leave it unchecked if they are not.</p></li>
</ul>

<p class="hcp1">&nbsp;</p>

<p class="hcp1">The information used in 
 this window will be used as the company's default information.</p>
`,
SalesAccountVendorList: `
<h1 style="font-size: 12pt; color: #000080;">Sales/Account (Vendor List)</h1>

<p class="hcp1">The Sales/Account information allows you to 
 create particular account settings to be used while processing sales and 
 purchases when dealing with specific vendors from your Vendor List. &nbsp;Many 
 of the settings will have options available to you in drop-down menus 
 which were created earlier in the Preferences 
 set up.</p>


<img src="images/help/vendorsales.jpg"/>
<p class="hcp1">&nbsp;</p>

<ul type="disc" class="hcp2">
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp3"><B>Default 
 Settings</B></span>: </p></li>
	
	<ul type="disc" class="hcp2">
		
		<li class="kadov-p"><p class="hcp1">Term: &nbsp;Set 
 defined payment terms.</p></li>
		
		<li class="kadov-p"><p class="hcp1">Sales Rep: &nbsp;Select 
 a Sales Reps to track any type of commission or to connect a person to 
 a customer.</p></li>
		
		<li class="kadov-p"><p class="hcp1">Payment Method:<span class="hcp3"> <B>&nbsp;</B></span>Select 
 the type of payment you will be using, or accepting, from your vendor.</p></li>
		
		<li class="kadov-p"><p class="hcp1">Ship Carrier: &nbsp;Set 
 the shipping courier you will be using.</p></li>
	</ul>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp3"><B>Account 
 Transfer Information</B></span>:</p></li>
	
	<ul type="disc" class="hcp2">
		
		<li class="kadov-p"><p class="hcp1">In this field you 
 will be able to keep track of expenses unpaid or credited with the vendor</p></li>
	</ul>
	
	<li class="kadov-p"><p class="hcp1"><span class="hcp3"><B>Memo</B></span>:</p></li>
	
	<ul type="disc" class="hcp2">
		
		<li class="kadov-p"><p class="hcp1">The Memo portion 
 of your Vendor List is not mandatory. &nbsp;It 
 is simply used for any other information that you may want to be included 
 with the description of your vendor. &nbsp;If 
 you do use a Memo for your Vendor List, it will be viewable to you when 
 you select that specific vendor.</p></li>
	</ul>
</ul>


<p class="hcp1"><span style="font-size: 10pt;"><font size="2" class="hcp4">After completing 
 all fields you may click &quot;Save&quot; to save the listing to your 
 Vendor List. &nbsp;If 
 you wish to list another vendor you may click &quot;New&quot; after saving 
 your information and continue creating another listing.</font></span></p>

<p class="hcp1">When you have finished compiling your Vendor 
 List and you are ready to continue press &quot;Next,&quot; or you may 
 &quot;Cancel&quot; your progress at any time. <span style="font-weight: normal; font-size: 10pt;"><font size="2" class="hcp4">You 
 can always edit any prior information by clicking the &quot;Back&quot; 
 button.</font></span></p>
`,
Setting_up_Product_Information: `
<h1 style="color: #000080; font-size: 12pt;">Setting up Product Information</h1>

<p><span style="font-size: 10pt;"><font size="2" class="hcp1">The Product Information page is a list 
 of all the items, services, etc, you which to sell. &nbsp;This 
 list will keep track of the products, their weight, quantity, as well 
 as total value. &nbsp;This 
 is one of the many ways BizComposer allows you to manage your business 
 and bookkeeping more efficiently and productively. </font></span></p>

<img src="images/help/productinfo.jpg" />
<p class="hcp5">&nbsp;</p>
<ul style="list-style: disc;"
	type=disc>
	
	<li class="kadov-p"><p class="hcp2">Product Category: &nbsp;Select 
 the category of the item you wish to list on the product information page.</p></li>
	
	<li class="kadov-p"><p class="hcp2">Sub-Category: Select 
 the sub-category of the item you wish to list.</p></li>
	
	<li class="kadov-p"><p class="hcp2">Description: &nbsp;A 
 brief description of the item, or you may also put the name of the product 
 in this line.</p></li>
	
	<li class="kadov-p"><p class="hcp2">Item Code: A series of 
 characters which help you recognize each item.</p></li>
	
	<li class="kadov-p"><p class="hcp3">Taxable: 
 Check this box if the item is taxable.</p></li>
	
	<li class="kadov-p"><p style="font-size: 10pt; margin-right: -175px;">Serial 
 #: The serial number of the product you are listing.</p></li>
	
	<li class="kadov-p"><p class="hcp3">Purchase 
 Price: The amount you purchased the item for.</p></li>
	
	<li class="kadov-p"><p class="hcp4">Weight: 
 The weight of the item in pounds.</p></li>
	
	<li class="kadov-p"><p style="font-size: 10pt; margin-right: -187px;">Sales 
 Price: The amount you will be selling the item for.</p></li>
	
	<li class="kadov-p"><p class="hcp4">Qty 
 in Hand: &nbsp;The 
 amount of the particular product you have in stock.</p></li>
	
	<li class="kadov-p"><p class="hcp3">Location: 
 &nbsp;The location 
 of your product.</p></li>
</ul>

<p class="hcp3">After you have finished 
 including all your information about the product press &quot;Save&quot; 
 to keep the item in your Inventory List. &nbsp;You 
 may always &quot;Delete&quot; an item from your Inventory. &nbsp;Please 
 note that by pressing &quot;New&quot; it will just clear all the fields. 
 To save the information you must press &quot;Save.&quot;</p>

<p class="hcp3">At the bottom half of 
 the box you will see your Inventory List. &nbsp;After 
 you create a new listing, each item you have created will be shown in 
 this list.</p>

<p class="hcp5"><span style="font-weight: normal; font-size: 10pt;"><font size="2" class="hcp1">When 
 you are ready to continue press &quot;Next,&quot; or you may &quot;Cancel&quot; 
 your progress at any time.</font></span></p>

<p class="hcp5">You can always edit any 
 prior information by clicking the &quot;Back&quot; button.</p>


<p class="hcp5">This will be the end of 
 the Set-Up Process. &nbsp;In 
 the next screen press &quot;Finish&quot; to complete the wizard or &quot;Cancel&quot; 
 to exit.</p>
`,
salesBoard: `
<h1 style="font-size: 12pt; color: #000080;">Sales Board</h1>

<p class="hcp1">By using the Sales Board, you can easily manage 
 and track orders and sales made through your business. &nbsp;The 
 Sales Board allows you to sort through a sales list so you may either 
 look up past orders and sales, or view current customer purchases. &nbsp;</p>

<p class="hcp1">There are a few ways you may limit your search: 
 </p>

<ul style="list-style: disc;"
	type=disc>
	
	<li class="kadov-p"><p class="hcp1">Filter Options</p></li>
	
	<li class="kadov-p"><p class="hcp1">Sort Options</p></li>
	
	<li class="kadov-p"><p class="hcp1">Search</p></li>
</ul>

<img src="images/help/sales-board.jpg" />
<p class="hcp1">&nbsp;</p>

<p class="hcp1"><span class="hcp2"><B>Filter 
 Options</B></span>: Under these options you may filter out any listings you 
 may not be interested in searching for. &nbsp;Therefore 
 you may specify particular dates which the item was either ordered, or 
 sold. &nbsp;You 
 may also specify which market place the item was ordered from (i.e. Amazon, 
 Ebay, etc.). &nbsp;This 
 will eliminate listings you wont be needing at the given time allowing 
 for a quicker search.</p>


<p class="hcp1"><span class="hcp2"><B>Sort Options</B></span>: 
 &nbsp;Sort options 
 are pretty basic. &nbsp;Under 
 the drop-down menu you can select a priority list which you would like 
 the current sales list to be sorted. &nbsp;Note 
 that there are two lists that you may choose from. &nbsp;By 
 choosing a second sort option, this will sort the current 1st sorted list 
 by the particular specifications. For example, if you sort the &quot;1st&quot; 
 by last name, it will sort the Sales List by last name only. &nbsp;And 
 then if you select a 2nd sort option with product name, this will only 
 sort the product names of those purchased by persons with the same name, 
 or the same person. &nbsp;The 
 &quot;2nd&quot; sort will be very limited in many cases. &nbsp;</p>


<p class="hcp1"><span class="hcp2"><B>Search</B></span><span>: 
 &nbsp;You may 
 also choose to use the Search function if you know the exact information 
 of one or more fields. &nbsp;This 
 will be the most reliable source for finding a specific listing if you 
 know the given information. &nbsp;Simply 
 choose a field from the drop-down menu, one of which you know the information 
 for, and then fill in the required field for the search. &nbsp;If 
 input correctly, your listing should be listed in the Sales List.</span></p>
`,
Invoices: `
<h1 style="font-size: 12pt; color: #000080;">Invoices</h1>
<p class="hcp2">There are 3 parts of the 
 invoice you should know. </p>

<p class="hcp2">First there is the Header: 
 &nbsp;The header 
 consists of Customer/Invoice Style/Date/Invoice Number</p>

<p class="hcp2">&nbsp;</p>

<img src="images/help/heading.jpg"/>

<p class="hcp2">...the Middle: &nbsp;&nbsp;Bill 
 to/Ship to/P.O. Number/Ship Date/Via/Rep/Term/Payment Method</p>
<img src="images/help/middle.jpg" />

<p class="hcp2">&nbsp;</p>

<p class="hcp2">...and the Bottom: &nbsp;ItemID/Qty/Description/UnitPrice/Amount/Weight/Tax/SerialNo./Message</p>

<img src="images/help/foot.jpg"/>

`,
HeadingInformation:`
<h1 style="font-size: 14pt; color: #000080;">Invoice Header</h1>

<p class="hcp1">To create an invoice, click on the Sales icon 
 and then click on the Invoice tab. &nbsp;This 
 will bring up a blank Invoice form. &nbsp;</p>

<img src="images/help/heading2.jpg"/>

<p class="hcp1">&nbsp;</p>

<p class="hcp1">There are several invoice styles built into 
 Bizcomposer. &nbsp;You 
 may want to first decide which template suits you and your company. &nbsp;You 
 should look at the other styles first before settling on the one you want 
 to use. &nbsp;To 
 do so, click on the drop-down menu under &quot;Invoice Style&quot; and 
 select another invoice style you wish to view. </p>


<p class="hcp1">The default invoice will be the &quot;product&quot; 
 layout. &nbsp;This 
 will be the template used here because it is the most complicated. &nbsp;If 
 you use another template, you will still be able to follow even though 
 your invoice will lack some fields related to products. If you wish to 
 use a different Invoice style, simply click on the arrow to the right 
 of the Invoice field and select the invoice style you would like to use.</p>
<p class="hcp1">Beginning with the customer, click on the arrow 
 to the right of the Customer field to see a list of all your customers. 
 &nbsp;Select 
 the customer for this invoice. &nbsp;</p>

<p class="hcp1">In the Date field, the current date should 
 already be showing. &nbsp;If 
 you want to change the date, you can either type in a new date or use 
 the calendar to choose the date you wish to use. </p>

<p class="hcp1">The Invoice number should already be labeled 
 on the blank invoice. &nbsp;To 
 go to a previous invoice input the invoice number and it will ask you 
 if you would like to view it. &nbsp;Click 
 &quot;Okay&quot; to view. </p>
`,
InvoiceMiddle: `
<h1 style="font-size: 14pt; color: #000080;">Invoice (Middle)</h1>
<p style="color: #000000; font-size: 10pt;">For the most part, this section 
 of the invoice will be filled out for you if you choose a customer from 
 the Customer List which was created when setting up the program. &nbsp;If 
 you are making an invoice for a new customer, you will have to fill in 
 each field manually. &nbsp;</p>
<img src="images/help/middle2.jpg"/>
<p class="hcp2">&nbsp;</p>
<p class="hcp2">Bill To:<span style="font-weight: normal;"> 
 &nbsp;You will 
 need to input the address the customer's payment method is billed to. 
 &nbsp;Generally 
 this will be used when the customer purchases items/services through credit 
 or a payment system between you and the client. </span></p>

<p class="hcp3"><span class="hcp4"><B>Ship 
 To:</B></span> &nbsp;Here 
 you will input the address of which you are shipping the items/service 
 to. &nbsp;Please 
 note that the Shipping address and the Billing address will not always 
 be the same. &nbsp;A 
 customer may purchase an item but ship the item to someone else. &nbsp;</p>

<p class="hcp3"><span class="hcp4"><B>P.O. Number:</B></span> &nbsp;
 If the customer has a Purchase Order Number, this is where you will fill it in.</p>

<p class="hcp3"><span class="hcp4"><B>VIA:</B></span> 
 Via is the shipping method you wish to use for the delivery services. 
 </p>

<p class="hcp3"><span class="hcp4"><B>Rep:</B></span><span> 
 &nbsp;The representative 
 who helped with the customer's purchases. &nbsp;Usually 
 used on a commission based environment.</span></p>

<p class="hcp3"><span class="hcp4"><B>Term:</B></span> 
 &nbsp;The terms 
 of which you and your customer have established for the purchase.</p>

<p class="hcp3"><span class="hcp4"><B>Pay 
 Method: &nbsp;</B></span><span>The 
 payment method your customer wishes to use for this order. &nbsp;</span></p>
`,
InvoiceBottom: `
<p style="font-size: 14pt;
			font-weight: bold;
			color: #000080;">Invoice (Bottom)</p>

<p class="hcp1">The bottom of the invoice deals with products 
 and specifics of the purchase. &nbsp;</p>

<img src="images/help/foot2.jpg"/>

<p class="hcp1">&nbsp;</p>
<p class="hcp1"><span class="hcp2"><B>Item ID: 
 &nbsp;</B></span>If 
 you click on the Item ID field an arrow will appear on the right side 
 of the box. &nbsp;Clicking 
 this box will pull up a drop down menu which you can select from items 
 in your Items List. &nbsp;By 
 selecting an item from the Items List, the other fields will be filled 
 out already. &nbsp;</p>

<p class="hcp1"><span class="hcp2"><B>QTY:</B></span> 
 &nbsp;The quantity, 
 or number of units, the customer wishes to purchase. &nbsp;</p>

<p class="hcp1"><span class="hcp2"><B>Description: 
 &nbsp;</B></span>Any 
 description of the product can be used in this field. &nbsp;The 
 name of the item is usually placed in this field as well.</p>

<p class="hcp1"><span class="hcp2"><B>Unit Price: 
 </B></span>&nbsp;The 
 price for a quantity of one unit.</p>

<p class="hcp1"><span class="hcp2"><B>Amount:</B></span> 
 &nbsp;The total 
 amount given the quantity of units purchased. &nbsp;</p>

<p class="hcp1"><span class="hcp2"><B>Weight: </B></span>&nbsp;The 
 total weight of the items, including the quantity of units.</p>

<p class="hcp1"><span class="hcp2"><B>Tax:</B></span> 
 &nbsp;Yes/No 
 if the item is taxable.</p>

<p class="hcp1"><span class="hcp2"><B>Serial No.</B></span><span>: 
 If applicable, provide the serial number for the unit(s).</span></p>

<p class="hcp1"><span class="hcp2"><B>Message:</B></span><span> 
 &nbsp;You may 
 include a personal, or business, message to your clients when they order 
 from you.</span></p>
`,
EstimationForm: `
<h1 style="font-size: 14pt; color: #000080;">Estimation</h1>

<p style="font-size: 10pt;">This form is similar to the Invoice form. &nbsp;Please 
 see <a style=" color: #000080;" onclick="showContent('HeadingInformation')">Invoices</a>.</p>
`,
Sales_Customer: `
<p style="font-weight: bold;
			color: #000080;
			font-size: 12pt;">Sales - Customer List</p>

<p class="hcp1">By opening the Customer field in the Sales 
 section, you will bring up a list of all your customers you had recorded 
 when setting up your profile. &nbsp;There 
 are three tabs in the Customer field:</p>

<ul style="list-style: disc;"
	type=disc>
	
	<li class="kadov-p"><p class="hcp1">Customers</p></li>
	
	<li class="kadov-p"><p class="hcp1">Add New Customers</p></li>
	
	<li class="kadov-p"><p class="hcp1">Print Labels.</p></li>
</ul>

<p class="hcp1"><span class="hcp2"><B>Customers:</B></span> 
 &nbsp;Is a list 
 of your customer profiles.</p>

<p class="hcp1"><span class="hcp2"><B>Add New Customers:</B></span> 
 &nbsp;Where you 
 may add new customer profiles to your list.</p>

<p class="hcp1"><span class="hcp2"><B>Print Labels:</B></span><span> 
 &nbsp;You may 
 set up a list of labels to print. &nbsp;</span></p>
`,
Sales_CustomerList: `
<h1 style="font-size: 14pt; color: #000080;">Sales - Customer List</h1>

<p style="font-size: 10pt;">A list of customers will be brought up in rows. 
 &nbsp;However 
 if you did not input any profiles during the set up process, your list 
 will be blank. &nbsp;</p>

<p class="hcp1">&nbsp;</p>

<ol style="list-style: decimal;"
	type=1>
	
	<li style="font-size: 10pt; /*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp1">You 
 may sort the list in a variety of ways by click on the topic of any field. 
 &nbsp;Clicking 
 the topic once will sort the field in Descending order, clicking it twice 
 will sort the field in Ascending order, in alphabetical or numerical order 
 depending on the field. &nbsp;(Note: 
 Like in most cases, numerics are sorted before alphabetical order.)</p></li>
	
	<li style="font-size: 10pt; /*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp1">In 
 order to edit a listing you can click to select a profile in the customer 
 list, and click the &quot;edit&quot; button along the bottom of the window. 
 &nbsp;You may 
 also double click any listing to open up the edit window.</p></li>
	
	<li style="font-size: 10pt; /*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp1">To 
 delete a customer from your list, click to select the customer profile 
 you wish to delete and click the &quot;Delete Selected Customer&quot; 
 button.</p></li>
	
	<li style="font-size: 10pt; /*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp1">You 
 may also print your customer list.</p></li>
</ol>
`,
AddNewCustomer: `
<h1 style="font-size: 14pt; color: #000080;">Add New Customer</h1>
<p class="hcp2">1. &nbsp;To 
 add a new customer open the new customer tab.</p>

<p class="hcp2">2. &nbsp;Fill 
 in all the appropriate fields. &nbsp;Please 
 note that there are several tabs when creating a customer profile.</p>

<p class="hcp2">3. &nbsp;To 
 add a client profile to the list, click on Add New Customer at the bottom 
 of the window. </p>

<p class="hcp2">&quot;Clear&quot; will 
 not delete any listing, it will simply clear all fields in the add new 
 customer window. &nbsp;To 
 <span style="font-weight: bold;"><B>Delete</B></span><span> a profile, go to 
 the Customer list. </span></p>
`,
PrintLabels: `
<h1 style="font-size: 14pt; color: #000080;">Print Labels</h1>
<p class="hcp1">This section is used to create a list of labels 
 you with to print used for shipping purposes. </p>
<p class="hcp1">To create a list:</p>

<p class="hcp1">1. &nbsp;Click 
 to select any name you wish from your customer list and click on &quot;Send 
 to&quot; after you have selected a customer to print. &nbsp;(Double 
 clicking a name will also &quot;send to&quot; the print list.)</p>

<p class="hcp1">2. &nbsp;Select 
 an Address Label Type from the drop down menu. &nbsp;If 
 your label differs from the listed ones, you can &quot;Set up your own 
 label&quot; to use when printing.</p>

<p class="hcp1">3. &nbsp;&quot;Print 
 Label&quot; will print the labels selected in your list. &nbsp;&quot;Clear 
 All&quot; will remove all the profiles in the print list.</p>
`,
DataManager: `
<h1 style="font-size: 12pt; color: #000080;">Sales - Data Manager</h1>
<img src="images/help/biz-datamanager.jpg"/>
<p class="hcp1">&nbsp;</p>
<p class="hcp1">1. &nbsp;To 
 <span class="hcp2"><B>add</B></span> items onto the <span class="hcp2"><B>data 
 manager</B></span>, click on the appropriate field title at the bottom of 
 each topic window. &nbsp;At 
 the bottom right side of the program is a <span class="hcp2"><B>description</B></span> 
 box. &nbsp;Fill 
 in the name of the item you wish to add and click <span class="hcp2"><B>save</B></span> 
 to add it into the field. &nbsp;</p>

<p class="hcp1">2. &nbsp;To 
 <span class="hcp2"><B>delete</B></span> an item from any field, 
 click on the appropriate item within the field and click on <span class="hcp2"><B>delete</B></span>.</p>


<p class="hcp1">You may also <span class="hcp2"><B>edit</B></span> 
 any item by click on the item and changing the <span class="hcp2"><B>description</B></span> 
 in the description field, and then clicking <span class="hcp2"><B>save</B></span>.</p>
`,
PurchaseOrders: `
<h1 style="font-size: 12pt; color: #000080;">Purchase - Purchase Orders</h1>

<p class="hcp1">The Purchase Order forms are similar to the 
 <a href="Invoice.htm">Invoice</a> forms and <a href="Estimation.htm">Estimate</a> 
 forms. The difference is instead of having a customer purchasing item(s) 
 from your company, your company is purchasing item(s) from another vendor. 
 &nbsp;Depending 
 on which form you use, generally there will be only be 
 Via, Terms, Pay Method in the Middle section of the form.</p>

<p class="hcp1">1. &nbsp;Fill 
 in the appropriate information for the form.</p>

<p class="hcp1">2. &nbsp;To 
 Save the Purchase Order click on the Save icon in the field above the 
 form. &nbsp;You 
 may also Delete the form by clicking on the Delete icon.</p>

<p class="hcp1">3. &nbsp;To 
 clear the form or start a new form, click on the New page icon in the 
 field above the form. &nbsp;</p>
`,
VendorList: `
<h1 style="font-size: 12pt; color: #000080;">Vendor</h1>

<p class="hcp1">The Vendor List is similar to the <a >Customer 
 List</a>, except that it is a list of vendors your company purchases from 
 rather than clients who purchase from your company.</p>

<p class="hcp1">&nbsp;</p>

<p class="hcp1">Similarly to the Customer List, you may add, 
 edit, or delete any of your vendors from the list. &nbsp;</p>

<p class="hcp1">&nbsp;</p>

<ol style="list-style: decimal;"
	type=1>
	
	<li style="font-size: 10pt; /*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp2">You 
 may sort the list in a variety of ways by click on the topic of any field. 
 &nbsp;Clicking 
 the topic once will sort the field in Descending order, clicking it twice 
 will sort the field in Ascending order, in alphabetical or numerical order 
 depending on the field. &nbsp;(Note: 
 Like in most cases, numerics are sorted before alphabetical order.)</p></li>
	
	<li style="font-size: 10pt; /*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp2">In 
 order to edit a listing you can click to select a profile in the vendor 
 list, and click the &quot;edit&quot; button along the bottom of the window. 
 &nbsp;You may 
 also double click any listing to open up the edit window.</p></li>
	
	<li style="font-size: 10pt; /*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp2">To 
 delete a vendor from your list, click to select the vendor profile you 
 wish to delete and click the &quot;Delete Selected Customer&quot; button.</p></li>
	
	<li style="font-size: 10pt; /*begin!kadov{{*/ font-size: 10pt; /*}}end!kadov*/ " class="kadov-p"><p class="hcp2">You 
 may also print your vendor list.</p></li>
</ol>
`,
AddNewVendor: `
<h1 style="font-size: 12pt; color: #000080;">Add New Vendor</h1>
<p class="hcp2">The Vendor List is similar 
 to the Add Customer List </p>

<p class="hcp3"><span style="font-weight: normal; font-size: 10pt;"><font size=2 style="font-size:10pt;">1. 
 &nbsp;To add 
 a new vendor open the new vendor tab.</font></span></p>

<p class="hcp3">2. &nbsp;Fill 
 in all the appropriate fields. &nbsp;Please 
 note that there are several tabs when creating a vendor profile.</p>
<p class="hcp3">3. &nbsp;To 
 add a vendor profile to the list, click on Add New Vendor at the bottom 
 of the window. </p>

<p class="hcp3">&quot;Clear&quot; will 
 not delete any listing, it will simply clear all fields in the add new 
 vendor window. &nbsp;To 
 <span class="hcp1"><B>Delete</B></span><span> a profile, go to 
 the Vendor list. </span></p>
`,
PrintLabelVendor : `
<h1 style="font-size: 12pt; color: #000080;">Print Label (Vendor)</h1>

<p class="hcp1"><span style="font-size: 10pt;"><font size=2 style="font-size:10pt;">This section 
 is used to create a list of labels you with to print used for shipping 
 purposes. </font></span></p>

<p class="hcp1">To create a list:</p>
<p class="hcp1">1. &nbsp;Click 
 to select any name you wish from your vendor list and click on &quot;Send 
 to&quot; after you have selected a vendor to print. &nbsp;(Double 
 clicking a name will also &quot;send to&quot; the print list.)</p>

<p class="hcp1">2. &nbsp;Select 
 an Address Label Type from the drop down menu. &nbsp;If 
 your label differs from the listed ones, you can &quot;Set up your own 
 label&quot; to use when printing.</p>
<p class="hcp1">3. &nbsp;&quot;Print 
 Label&quot; will print the labels selected in your list. &nbsp;&quot;Clear 
 All&quot; will remove all the profiles in the print list.</p>


`,
};

function showContent(key) {
    const content = contentMap[key] || '<h3>Content not found</h3>';
    document.getElementById('mainContent').innerHTML = content;
}

function activateItem(element) {
    // Remove active-item from all
    document.querySelectorAll('.item-span').forEach(el => el.classList.remove('active-item'));
    // Add to the clicked one
    element.classList.add('active-item');
}