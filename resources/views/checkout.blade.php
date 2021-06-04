@extends('layout')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
@endsection

@section('breadcrumb')
    @include('partials.breadcrumb')
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
                            <form action="{{route('passer_commande')}}" method="POST" id="checkout">
                                @csrf
                                <div class="form-group">
                                    <input class="input" type="text" id="nom" name="nom" value="{{auth()->user()->name}}">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="prenom" name="prenom" placeholder="Prenom">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" id="email" name="email" value="{{auth()->user()->email}}" readonly>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="adresse" name="adresse" placeholder="Addresse">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="ville" name="ville" placeholder="Ville">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="pays" name="pays" placeholder="Pays" value="Maroc">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="zip_code" name="zip_code" placeholder="Code Postal">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="tel" id="tel" name="tel" placeholder="Telephone" value="{{auth()->user()->telephone}}">
                                </div>
                            </form>

							{{--<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="create-account">
									<label for="create-account">
										<span></span>
										Create Account?
									</label>
									<div class="caption">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
										<input class="input" type="password" name="password" placeholder="Enter Your Password">
									</div>
								</div>
							</div>--}}
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
								<input type="radio" name="payment" id="payment-1">
								<label for="payment-1">
									<span></span>
									Direct Bank Transfer
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-2">
								<label for="payment-2">
									<span></span>
									Cheque Payment
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-3">
								<label for="payment-3">
									<span></span>
									Paypal System
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</div>

						<div class="input-checkbox">
							<input type="checkbox" id="terms">
							<label for="terms">
								<span></span>
								J'ai lu et j'accepte les <a href="#">termes et conditions</a>
							</label>
						</div>

                        <button class="primary-btn order-submit" type="submit" form="checkout" style="width: 100%">Passer la commande</button>

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
                                            <button type="submit" class="btn" style="height: 40px"></button>
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
