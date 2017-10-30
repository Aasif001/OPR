
<form action="https://www.sandbox.paypal.com/cgi-bin/webscr"
	method="post">

	<button name="submit" type="submit"
		class="waves-effect waves-light btn">Buy Now</button>



	<input type="hidden" name="business" value="payment@bookreader.ml" />

	<!-- Specify a Buy Now button. -->
	<input type="hidden" name="cmd" value="_xclick" />
	<!--<input type="hidden" name="cpp_header_image" value="http://bookreader.ml/admin/logo/book-logo.png">-->
	<!-- Specify details about the item that buyers will purchase. -->
	<input type="hidden" name="item_name" value="asdfghjk"> <input
		type="hidden" name="item_number" value="56789"> <input
		type="hidden" name="amount" value="1234"> <input type="hidden"
		name="currency_code" value="USD">

	<!-- Specify URLs -->
	<input type='hidden' name='cancel_return'
		value='http://localhost:8080/OPR_SYSTEM/can.jsp' /> <input
		type='hidden' name='return'
		value='http://localhost:8080/OPR_SYSTEM/succes.jsp' />
</form>



