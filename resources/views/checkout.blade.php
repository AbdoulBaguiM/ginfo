@extends('layout')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
    <script src="https://js.stripe.com/v3/"></script>
@endsection


@section('content')
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
                    @if (session()->has('success_message'))
                        <div class="alert alert-success">
                            {{ session()->get('success_message') }}
                        </div>
                    @endif

                    @if(count($errors) > 0)
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                        <div class="spacer"></div>
					<div class="col-md-6 order-details">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Vos Informations</h3>
							</div>
                            <form action="{{route('passer_commande_hors_ligne')}}" method="POST" id="payment-form" data-toggle="validator">
                                @csrf
                                <div class="form-group">
                                    <input class="input" type="text" id="nom" name="nom" value="{{auth()->user()->name}}" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="prenom" name="prenom" value="{{auth()->user()->last_name}}" placeholder="Prenom" >
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" id="email" name="email" value="{{auth()->user()->email}}" readonly>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="adresse" name="adresse" value="{{auth()->user()->adresse}}" placeholder="Addresse" required>
                                </div>


                                <div class="form-group">
                                    <select class="input" id="ville" name="ville" required>
                                        @foreach(preg_split("/[\s,]+/", setting('site.cities')) as $item)
                                            <option {{$item == auth()->user()->ville ? 'selected' : ''}}>{{$item}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <input class="input" type="text" id="pays" name="pays" placeholder="Pays" value="Maroc" readonly>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="zip_code" name="zip_code" value="{{auth()->user()->zipcode}}" placeholder="Code Postal" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="tel" id="tel" name="tel" placeholder="Telephone" value="{{auth()->user()->telephone}}" required>
                                </div>
                            </form>
						</div>
						<!-- /Billing Details -->

						<!-- Order notes -->
{{--						<div class="order-notes">
							<textarea class="input" placeholder="Order Notes"></textarea>
						</div>--}}
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
					<div class="col-md-5  col-md-offset-1 order-details" >
						<div class="section-title text-center">
							<h3 class="title">Votre Commande</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>PRODUIT(S)</strong></div>
								<div><strong>TOTAL</strong></div>
							</div>

							<div class="order-products">
                                @foreach(Cart::content() as $item)
                                    <div class="order-col">
                                        <div>{{$item->name}}</div>
                                        <div>{{$item->qty}}x {{number_format($item->price,2)}} Dhs</div>
                                    </div>
                                @endforeach
							</div>

                            <div class="order-col">
                                <div>Frais de Livraison</div>
                                <div>{{getLivraisonPrice()}} Dhs</div>
                            </div>

							<div class="order-col">
								<div>Taxe</div>
								<div>{{number_format($newTax,2)}} Dhs</div>
							</div>

                            @if(session()->has('coupon'))
                                <div class="order-col">
                                    <div>
                                        Coupon ({{session()->get('coupon')['name']}})
                                        <form action="{{route('supprimer_coupon')}}" method="POST" style="display: inline">
                                            @csrf
                                            {{method_field('DELETE')}}

                                            <button class="remove" type="submit"><i class="fa fa-trash"></i></button>

                                        </form>
                                    </div>
                                    <div>- {{number_format($discount,2)}} Dhs</div>
                                </div>
                            @endif

							<div class="order-col">
								<div><strong>TOTAL</strong></div>
								<div style="display: inline"><strong class="order-total" style="float: right">{{number_format($newTotal,2)}} Dhs</strong></div>
							</div>
						</div>

						<div class="payment-method">
							<div class="input-radio">
								<input type="radio" name="payement" id="payment-1" value=0 form="payment-form" required>
								<label for="payment-1">
									<span></span>
									Paiement cash à la livraison
								</label>
								<div class="caption">
									<p>Payez en espèces dès que vous recevez votre commande. Assurez vous d'avoir la somme exacte afin de faciliter la transaction</p>
								</div>
							</div>

							<div class="input-radio">
								<input type="radio" name="payement" id="payment-2" value=1 form="payment-form" required>
								<label for="payment-2">
									<span></span>
                                    Paiement par carte bancaire
								</label>
								<div class="caption">
									<p>C'est une option prépayée sécurisée et rapide.
                                        Pour garantir le bon déroulement de votre paiement, prière de vous assurer que vous disposez des fonds nécessaires sur votre carte.</p>

{{--                                    <section>
                                        <div class="bt-drop-in-wrapper">
                                            <div id="bt-dropin"></div>
                                        </div>
                                    </section>

                                    <input id="nonce" name="payment_method_nonce" type="hidden" form="payment-form"/>--}}
                                    <div class="form-group">
                                        <input type="text" class="input" id="name_on_card" name="name_on_card" placeholder="Nom du propriétaire">
                                    </div>

                                    <div class="form-group">
                                        <div id="card-element">
                                            <!-- a Stripe Element will be inserted here. -->
                                        </div>
                                        <!-- Used to display form errors -->
                                        <div id="card-errors" role="alert"></div>
                                    </div>
								</div>
							</div>
						</div>

						<div class="input-checkbox">
							<input type="checkbox" id="terms" name="terms" form="payment-form" required>
							<label for="terms">
								<span></span>
								J'ai lu et j'accepte les <a href="{{route('voir_termes_et_conditions')}}">termes et conditions</a>
							</label>
						</div>

                        <button class="primary-btn order-submit" type="submit" form="payment-form" id="complete-order" style="width: 100%">Passer la commande</button>

                        @if(!session()->has('coupon'))
                            <hr>
                            <div class="order-col">
                                <div class="section-title text-center">
                                    <h4 class="title">Coupon de reduction</h4>
                                </div>
                            </div>
                            <div class="order-col">
                                    <form action="{{route('ajouter_coupon')}}" method="POST">
                                        @csrf
                                        <div class="form-group">
                                            <input class="input" type="text" name="coupon_code" id="coupon_code" placeholder="Entrer le Code" style="width: 88%"/>
                                            <button type="submit" class="btn-local continue" style="height: 40px"></button>
                                        </div>
                                    </form>
                            </div>
                        @endif
                    </div>
                        <!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>

			<!-- /container -->
		</div>
		<!-- /SECTION -->
@endsection

@section('extra-js')
{{--    <script src="https://js.braintreegateway.com/web/dropin/1.13.0/js/dropin.min.js"></script>
    <script>
        $(document).ready(function(){
            $('input[type=radio]').click(function(){
                if (this.value == 1){
                    document.getElementById('payment-form').action = "{{route("passer_commande_en_ligne")}}";

                    var form = document.querySelector('#payment-form');
                    var client_token = "{{ $token }}";

                    braintree.dropin.create({
                        authorization: client_token,
                        selector: '#bt-dropin',
                        locale: 'fr_FR',
                        paypal: {
                            flow: 'vault'
                        }
                    }, function (createErr, instance) {
                        if (createErr) {
                            console.log('Create Error', createErr);
                            return;
                        }
                        form.addEventListener('submit', function (event) {
                            event.preventDefault();

                            instance.requestPaymentMethod(function (err, payload) {
                                if (err) {
                                    console.log('Request Payment Method Error', err);
                                    return;
                                }

                                // Add the nonce to the form and submit
                                document.querySelector('#nonce').value = payload.nonce;
                                form.submit();
                            });
                        });
                    });
                }
                else{
                    document.getElementById('payment-form').action = "{{route("passer_commande_hors_ligne")}}";
                }
            });
        });
    </script>--}}
    <script>
        (function(){
            $(document).ready(function(){
                $('input[type=radio]').click(function(){
                    if (this.value == 1){
                        document.getElementById('payment-form').action = "{{route("passer_commande_en_ligne")}}";
                // Create a Stripe client
                var stripe = Stripe('{{config('services.stripe.key')}}');

                // Create an instance of Elements
                var elements = stripe.elements();

                // Custom styling can be passed to options when creating an Element.
                // (Note that this demo uses a wider set of styles than the guide below.)
                var style = {
                    base: {
                        color: '#32325d',
                        lineHeight: '18px',
                        fontFamily: 'Montserrat, sans-serif',
                        fontSmoothing: 'antialiased',
                        fontWeight: 400,
                        '::placeholder': {
                            color: '#aab7c4'
                        }
                    },
                    invalid: {
                        color: '#fa755a',
                        iconColor: '#fa755a'
                    }
                };

                // Create an instance of the card Element
                var card = elements.create('card', {
                    style: style,
                    hidePostalCode: true
                });

                // Add an instance of the card Element into the `card-element` <div>
                card.mount('#card-element');

                // Handle real-time validation errors from the card Element.
                card.addEventListener('change', function(event) {
                    var displayError = document.getElementById('card-errors');
                    if (event.error) {
                        displayError.textContent = event.error.message;
                    } else {
                        displayError.textContent = '';
                    }
                });

                // Handle form submission
                var form = document.getElementById('payment-form');
                form.addEventListener('submit', function(event) {
                    event.preventDefault();

                    // Disable the submit button to prevent repeated clicks
                    document.getElementById('complete-order').disabled = true;

                    var options = {
                        name: document.getElementById('name_on_card').value,
                        address_line1: document.getElementById('adresse').value,
                        address_city: document.getElementById('ville').value,
                        address_state: document.getElementById('pays').value,
                        address_zip: document.getElementById('zip_code').value
                    }

                    stripe.createToken(card, options).then(function(result) {
                        if (result.error) {
                            // Inform the user if there was an error
                            var errorElement = document.getElementById('card-errors');
                            errorElement.textContent = result.error.message;

                            // Enable the submit button
                            document.getElementById('complete-order').disabled = false;
                        } else {
                            // Send the token to your server
                            stripeTokenHandler(result.token);
                        }
                    });
                });

                function stripeTokenHandler(token) {
                    // Insert the token ID into the form so it gets submitted to the server
                    var form = document.getElementById('payment-form');
                    var hiddenInput = document.createElement('input');
                    hiddenInput.setAttribute('type', 'hidden');
                    hiddenInput.setAttribute('name', 'stripeToken');
                    hiddenInput.setAttribute('value', token.id);
                    form.appendChild(hiddenInput);

                    // Submit the form
                    form.submit();
                }
                }
                else{
                    document.getElementById('payment-form').action = "{{route("passer_commande_hors_ligne")}}";
                }
            });
    });

    })();
    </script>
@endsection
