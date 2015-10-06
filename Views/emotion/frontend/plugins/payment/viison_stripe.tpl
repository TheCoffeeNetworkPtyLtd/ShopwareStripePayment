{if $Controller != "account" && $payment_mean.name == 'viison_stripe'}
	{* Additional styling for the stripe payment box *}
	<style type="text/css">
		#viison-stripe-error-box {
			padding: 10px;
			margin-bottom: 15px;
			color: #B94A48;
			font-weight: bold;
			background-color: #F2DEDE;
			border: 1px solid #DF7373;
		}
		#viison-stripe-form .form-group {
			clear: both;
			width: 600px;
			height: 38px;
		}
		#viison-stripe-form .form-group .form-input {
			float: left;
		}
		#viison-stripe-form .adjust-margin {
			margin-top: 5px;
		}
		#viison-stripe-form label {
			width: 150px !important;
		}
		#confirm .personal-information .payment_method .bankdata .form-group label.checkbox {
			width: auto !important;
			padding-left: 5px;
			padding-top: 2px !important;
		}
		#viison-stripe-form .help {
			cursor: pointer;
			width: 22px;
			height: 100%;
			float: left;
			padding-left: 10px;
			background-size: 22px;
			background-repeat: no-repeat;
			background-position: center;
			background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAYAAAAehFoBAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkJBN0MwQTc5REQ4RjExRTM5MzczRDk3QzQxRTkxOTIwIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkJBN0MwQTdBREQ4RjExRTM5MzczRDk3QzQxRTkxOTIwIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QkE3QzBBNzdERDhGMTFFMzkzNzNEOTdDNDFFOTE5MjAiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QkE3QzBBNzhERDhGMTFFMzkzNzNEOTdDNDFFOTE5MjAiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5xa1/RAAADy0lEQVR42tRZTUhUURS+M8xCMUMjGVAQYTAppF9EEGkW4kRoTjjRDwXmJokIF26shqKoaCtDim7SRU0gNlTI9OdCa+MmmRhbZG0ExTRQnLLZTeeb7lzfDPP37ntvZvzgg/fezDv347xzzz33XIvD4WAaUEJsJtqJB4j7iFbiLv77b+JP4jfiV+IM8SPxj+yAFol3TMQTxG7iKWJxmv/u4dxPdBJvEP8SXxOfEN8SI2oGN6sU20mcI/qJZzOITYVi/q6f2zpthGAb8R1xgniI6QfY8nHbNr0EnyN+JrYy49DKxzivRTBi9T7xOXE3Mx4Yw8vHNKkVjBc8xFss98CYQ6lEpxL8kHiN5Q89XENWghFH/Sz/gIYLmQRjpg6zwsFwYvZIXDiGZCdYS0sLq6mpYXa7Pe758vIyCwQCzO/3s42NDbVmS7kmsRybFEtzJ8+zqlBWVsZ6e3uZzZY5jY6NjbGpqSkZf7iIL5Qexoy8LRVo/f2ssrJSeNPn87HZ2dnofXV1NXM6nayhoSF639XVxVZWVtj8/LzaYe7wBSYSi2GHzArW0dERJxbiY2KBxcVF5vF42PT0tHjW1tYm45eDvH4Rk65bxkpTU5O4HhwcTPm/iYntSKuvr5edgJdjgkt4JaU6dpXehTdTAZNtfX1d3CNUJACNJWZezxapfbuqqkpcLy0t5SLFQWOzhRffqhEKhaKpClhdXc1cUxZvV6Kbm5uyou0QLBVUCIF0YZA4OYuK/n/EYDAok4/FFEBI1Br5HRGv7e3t4n5yclKLuVoIrjBSbF9fn/AuQkgiBytRYeHLnyFi3W53nFiv16vVbKnZCLFIeYme1UGsqNZCegt2uVysvLxcTDK9xEIrBK/p7d3GxsbodTgcZiMjI3qaX4PgBT0t1tXViVBAXaEhhSXDAgQH9bRotVrF9dbWlt7RFjTz9tFOwQwKeBQ/v2TqiRwjTNwLD6Mx93IHePcVtMZ2HKO8w6MZAwMDIqWhpMT2SSeMKgt4dBG/FLB3oe2NUjBanncLWPA9rjGuL4Fd6fsCFPtBuZs3JXTgsVefM6ogklmKiUeJ31N1fn4QrxSQd3uUYpMJBtBefVQAYqHBm6xaS4abxMd5FDvMNbBsBWNGXic+yINYjHmVpTisSVfA4wU38SI2ujkQijEu8TEj6Qr4THhGPMbTi5GpC2M8zWbHkQ0wU3FwckbnFTHAbbYmZgOtgmNAAj9MPEkc5xWUTNU1zm0cYSpbvDInoRG+roM4okWr6zhvyKDHkXh0i7YQjm6xv0cb8xN/LoV/AgwAANj+CFLxbboAAAAASUVORK5CYII=');
		}
		select[id^="stripe-card-expiry"] {
			width: 60px;
		}
		#stripe-card-cvc {
			width: 30px !important;
		}
		.viison-stripe-cvc-info-popup-overlay {
			display: none;
			z-index: 1000;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0,0,0,0.3);
		}
	</style>
	{* Include and set up the Stripe SDK *}
	<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
	<script type="text/javascript" src="{link file="frontend/viison_stripe_payment/_resources/javascript/jquery.payment.min.js"}"></script>
	<script type="text/javascript" src="{link file="frontend/viison_stripe_payment/_resources/javascript/viison_stripe_payment.js"}"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			// Stripe setup
			var viisonStripePaymentId = {$payment_mean.id};
			{include file="frontend/viison_stripe_payment/checkout/viison_stripe_header.js"}
		});
	</script>

	{* The main container for filling in the credit card information *}
	<div id="viison-stripe-form">
		{* An error box *}
		<div id="viison-stripe-error-box" style="display: none;">
			<div class="error-content">
			</div>
		</div >
		{* Credit card selection *}
		<div class="form-group">
			<label class="control-label" for="stripe-saved-cards">Gespeicherte Karten</label>
			<div class="form-input adjust-margin">
				<select id="stripe-saved-cards" style="width: 365px;">
					<option value="new"{if $viisonAllStripeCards|count == 0} selected{/if}>Neue Karte</option>
					{foreach from=$viisonAllStripeCards item=stripeCard}
						<option value="{$stripeCard.id}"{if $stripeCard.id == $viisonStripeCard.id} selected{/if}>{$stripeCard.name} | {$stripeCard.brand} | &bull;&bull;&bull;&bull;{$stripeCard.last4} | {$stripeCard.exp_month}/{$stripeCard.exp_year}</option>
					{/foreach}
				</select>
			</div>
		</div>
		{* Card holder *}
		<div class="form-group">
			<label class="control-label" for="stripe-card-holder">{s namespace="frontend/plugins/payment/viison_stripe" name="form/card/holder"}{/s} *</label>
			<div class="form-input">
				{* Try to use the name of a previously created Stripe card *}
				<input id="stripe-card-holder" type="text" size="20" class="text" value="{if $viisonStripeCard}{$viisonStripeCard.name}{else}{$sUserData.billingaddress.firstname} {$sUserData.billingaddress.lastname}{/if}">
			</div>
		</div>
		{* Card number *}
		<div class="form-group">
			<label class="control-label" for="stripe-card-number">{s namespace="frontend/plugins/payment/viison_stripe" name="form/card/number"}{/s} *</label>
			<div class="form-input">
				{* Try to use the last 4 digits of a previously created Stripe card *}
				<input id="stripe-card-number" type="text" size="20" class="text" value="{if $viisonStripeCard}XXXXXXXXXXXX{$viisonStripeCard.last4}{/if}">
			</div>
		</div>
		{* CVC *}
		<div class="form-group">
			<label class="control-label" for="stripe-card-cvc">{s namespace="frontend/plugins/payment/viison_stripe" name="form/card/cvc"}{/s} *</label>
			<div class="form-input">
				{* Set a placeholder, if a previously created card is set *}
				<input id="stripe-card-cvc" type="text" size="5" class="text" value="{if $viisonStripeCard}***{/if}">
			</div>
			<div class="help" id="viison-stripe-cvc-info-button">
			</div>
		</div>
		{* Expiry date *}
		<div class="form-group">
			<label class="control-label" for="stripe-card-expiry-month">{s namespace="frontend/plugins/payment/viison_stripe" name="form/card/expiry"}{/s} *</label>
			<div class="form-input adjust-margin">
				<select id="stripe-card-expiry-month"></select>
				<span> / </span>
				<select id="stripe-card-expiry-year"></select>
			</div>
		</div>
		{if $customerAccountMode == 0}
			{* Save data *}
			<div class="form-group adjust-margin">
				<div class="form-input">
					<input id="stripe-save-card" type="checkbox" checked="checked">
				</div>
				<label class="control-label checkbox" for="stripe-save-card">{s namespace="frontend/plugins/payment/viison_stripe" name="form/save_card"}{/s}</label>
			</div>
		{/if}
		{* Info *}
		<div class="form-group adjust-margin">
			<p>
				{s namespace="frontend/plugins/payment/viison_stripe" name="form/description"}{/s}
			</p>
		</div>

		{* An initially hidden CVC info popup window *}
		<div class="viison-stripe-cvc-info-popup-overlay">
			{include file="frontend/viison_stripe_payment/checkout/viison_stripe_cvc_info_popup.tpl"}
		</div>
	</div>
{/if}