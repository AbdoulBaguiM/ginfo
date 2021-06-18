@extends('layout')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
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

					<div class="col-md-7 order-details">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Vos Informations</h3>
							</div>
                            <form action="{{route('passer_commande')}}" method="POST" id="demoForm" data-toggle="validator">
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
                                    <input class="input" type="text" id="ville" name="ville" value="{{auth()->user()->ville}}" placeholder="Ville" required>
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
					<div class="col-md-5 order-details">
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
                                    <div>{{number_format($discount,2)}} Dhs</div>
                                </div>
                            @endif

							<div class="order-col">
								<div><strong>TOTAL</strong></div>
								<div style="display: inline"><strong class="order-total" style="float: right">{{number_format($newTotal,2)}} Dhs</strong></div>
							</div>
						</div>

						<div class="payment-method">
							<div class="input-radio">
								<input type="radio" name="payement" id="payment-1" value=0 form="demoForm" required>
								<label for="payment-1">
									<span></span>
									Paiement cash à la livraison
								</label>
								<div class="caption">
									<p>Payez en espèces dès que vous recevez votre commande</p>
								</div>
							</div>

							<div class="input-radio">
								<input type="radio" name="payement" id="payment-2" value=1 form="demoForm" required>
								<label for="payment-2">
									<span></span>
                                    Paiement par carte bancaire
								</label>
								<div class="caption">
									<p>C'est une option prépayée sécurisée et rapide.
                                        Pour garantir le bon déroulement de votre paiement, prière de vous assurer que vous disposez des fonds nécessaires sur votre carte.</p>
								</div>
							</div>
						</div>

						<div class="input-checkbox">
							<input type="checkbox" id="terms" name="terms" form="demoForm" required>
							<label for="terms">
								<span></span>
								J'ai lu et j'accepte les <a href="#">termes et conditions</a>
							</label>
						</div>

                        <button class="primary-btn order-submit" type="submit" form="demoForm" style="width: 100%">Passer la commande</button>

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

