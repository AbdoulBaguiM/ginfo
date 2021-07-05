@extends('layout')

@section('content')
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
                    @if (session()->has('success_message'))
                        <div class="alert alert-success text-center">
                            {{ session()->get('success_message') }}
                        </div>
                    @endif

                    @if(count($errors) > 0)
                        <div class="alert alert-danger text-center">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                @endif
					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="./img/shop01.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Collection<br>Laptops</h3>
								<a href="{{route('voir_produits',['categorie' => 'laptops'])}}" class="cta-btn">Voir <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="./img/shop03.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Collection<br>Accessoires</h3>
								<a href="{{route('voir_produits',['categorie' => 'accessoires'])}}" class="cta-btn">Voir <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="./img/shop02.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Collection<br>Cameras</h3>
								<a href="{{route('voir_produits',['categorie' => 'cameras'])}}" class="cta-btn">Voir <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Nouveautés</h3>
							{{--<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>
									<li><a data-toggle="tab" href="#tab1">Smartphones</a></li>
									<li><a data-toggle="tab" href="#tab1">Cameras</a></li>
									<li><a data-toggle="tab" href="#tab1">Accessories</a></li>
								</ul>
							</div>--}}
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
										<!-- product -->
                                        @foreach($produits as $produit)
                                            <div class="product">
                                                <a href="{{route('voir_produit',$produit->id)}}">
                                                    <div class="product-img">
                                                        <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                                        <div class="product-label">
                                                            @if($produit->promotion)
                                                                <span class="sale">-{{getProductPromotion($produit)}}%</span>
                                                            @endif
                                                            @if($produit->featured)
                                                                <span class='new'>NEW</span>
                                                            @endif
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        @if($produit->categories()->first())
                                                            <p class="product-category">{{$produit->categories()->first()->nom}}</p>
                                                        @else
                                                            <p class="product-category" style="color: white">None</p>
                                                        @endif
                                                        <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                            <h4 class="product-price">{{getProductPrice($produit)}} Dhs
                                                                @if(getProductDelPrice($produit))
                                                                    <del class="product-old-price"> {{getProductDelPrice($produit)}} Dhs</del>
                                                                @endif
                                                            <div class="product-rating">
                                                            @foreach(range(1,5) as $star)
                                                                <i class="fa fa-star{{$produit->rating_cache >= $star ? '' : '-o empty'}}"></i>
                                                            @endforeach
                                                        </div>
                                                        <div class="product-btns">
                                                            <form action="{{ route('ajouter_a_la_wishlist', $produit) }}" method="POST">
                                                                @csrf
                                                                <input type="hidden" name="id" value="{{$produit->id}}">
                                                                <input type="hidden" name="nom" value="{{$produit->nom}}">
                                                                <input type="hidden" name="prix_ht" value="{{floatval(str_replace(',', '', getProductPrice($produit)))}}">
                                                                <button class="unstyled-button" type="submit"><i class="fa fa-heart-o"></i><span class="tooltipp">Ajouter à la wishlist</span></button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <form action="{{ route('ajouter_au_panier', $produit) }}" method="POST">
                                                            @csrf
                                                            <input type="hidden" name="id" value="{{$produit->id}}">
                                                            <input type="hidden" name="nom" value="{{$produit->nom}}">
                                                            <input type="hidden" name="prix_ht" value="{{floatval(str_replace(',', '', getProductPrice($produit)))}}">
                                                            <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>J'achète</button>
                                                        </form>
                                                    </div>
                                                </a>
                                            </div>
                                        @endforeach
                                    <!-- product -->
									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- HOT DEAL SECTION -->
		<div id="hot-deal" class="section">
            {{--<input type="hidden" id="days_val" value="{{}}">
            <input type="hidden" id="hours_val" value="{{}}">
            <input type="hidden" id="minutes_val" value="{{}}">
            <input type="hidden" id="secondes_val" value="{{}}">--}}

            <input type="hidden" id="date_promotion" value="{{setting('site.promotional_date')}}">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="hot-deal">
							<ul class="hot-deal-countdown">
								<li>
									<div>
										<h3 id="days"></h3>
										<span>Jours</span>
									</div>
								</li>
								<li>
									<div>
										<h3 id="hours"></h3>
										<span>Heures</span>
									</div>
								</li>
								<li>
									<div>
										<h3 id="minutes"></h3>
										<span>Mins</span>
									</div>
								</li>
								<li>
									<div>
										<h3 id="seconds"></h3>
										<span>Secs</span>
									</div>
								</li>
							</ul>
							<h2 class="text-uppercase">Offres promotionnelles</h2>
							<p>{{setting('site.label_promotions')}}</p>
							<a class="primary-btn cta-btn" href="{{route('voir_promotions')}}">Voir</a>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /HOT DEAL SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Meilleures Ventes</h3>
							{{--<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab2">Laptops</a></li>
									<li><a data-toggle="tab" href="#tab2">Smartphones</a></li>
									<li><a data-toggle="tab" href="#tab2">Cameras</a></li>
									<li><a data-toggle="tab" href="#tab2">Accessories</a></li>
								</ul>
							</div>--}}
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
										<!-- product -->
                                        @foreach($topventes as $produit)
                                                <div class="product">
                                                    <a href="{{route('voir_produit',$produit->id)}}">
                                                        <div class="product-img">
                                                            <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                                            <div class="product-label">
                                                                @if($produit->featured)
                                                                    <span class='new'>NEW</span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                        <div class="product-body">
        {{--                                                    @if($produit->categories()->first())--}}
        {{--                                                        <p class="product-category">{{$produit->categories()->first()->nom}}</p>--}}
        {{--                                                    @endif--}}
                                                            <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                            <h4 class="product-price">{{getProductPrice($produit)}} Dhs </h4>
                                                            <div class="product-rating">
                                                                @foreach(range(1,5) as $star)
                                                                    <i class="fa fa-star{{$produit->rating_cache >= $star ? '' : '-o empty'}}"></i>
                                                                @endforeach
                                                            </div>
                                                            <div class="product-btns">
                                                                <form action="{{ route('ajouter_a_la_wishlist', $produit->id) }}" method="POST">
                                                                    @csrf
                                                                    <input type="hidden" name="id" value="{{$produit->id}}">
                                                                    <input type="hidden" name="nom" value="{{$produit->nom}}">
                                                                    <input type="hidden" name="prix_ht" value="{{floatval(str_replace(',', '', getProductPrice($produit)))}}">
                                                                    <button class="unstyled-button" type="submit"><i class="fa fa-heart-o"></i><span class="tooltipp">Ajouter à la wishlist</span></button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="add-to-cart">
                                                            <form action="{{ route('ajouter_au_panier', $produit->id) }}" method="POST">
                                                                @csrf
                                                                <input type="hidden" name="id" value="{{$produit->id}}">
                                                                <input type="hidden" name="nom" value="{{$produit->nom}}">
                                                                <input type="hidden" name="prix_ht" value="{{floatval(str_replace(',', '', getProductPrice($produit)))}}">
                                                                <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>J'achète</button>
                                                            </form>
                                                        </div>
                                                    </a>
                                                </div>
                                        @endforeach
										<!-- /product -->

									</div>
									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- /Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">Meilleures Ventes</h4>
							<div class="section-nav">
								<div id="slick-nav-3" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-3">
							<div>
                                @foreach($topventes->take(3) as $produit)
                                    <!-- product widget -->
                                        <div class="product-widget">
                                            <a href="{{route('voir_produit',$produit->id)}}">
                                                <div class="product-img">
                                                    <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                    <h4 class="product-price">{{getProductPrice($produit)}} Dhs </h4>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- /product widget -->
                                @endforeach
							</div>
                            <div>
                                @foreach($topventes->skip(3)->take(3) as $produit)
                                    <!-- product widget -->
                                        <div class="product-widget">
                                            <a href="{{route('voir_produit',$produit->id)}}">
                                                <div class="product-img">
                                                    <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                    <h4 class="product-price">{{getProductPrice($produit)}} Dhs</h4>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- /product widget -->
                                    @endforeach
                            </div>
						</div>
					</div>

					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">Nouveautés</h4>
							<div class="section-nav">
								<div id="slick-nav-4" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-4">
							<div>
                                <!-- product widget -->
                                @foreach($produits->take(3) as $produit)
                                    <div class="product-widget">
                                        <a href="{{route('voir_produit',$produit->id)}}">
                                            <div class="product-img">
                                                <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                <h4 class="product-price">{{getProductPrice($produit)}} Dhs
                                                    @if(getProductDelPrice($produit))
                                                        <del class="product-old-price"> {{getProductDelPrice($produit)}} Dhs</del>
                                                    @endif
                                                </h4>
                                            </div>
                                        </a>
                                    </div>
                                @endforeach
                                <!-- /product widget -->
							</div>

                            <div>
                                <!-- product widget -->
                                @foreach($produits->skip(3)->take(3) as $produit)
                                    <div class="product-widget">
                                        <a href="{{route('voir_produit',$produit->id)}}">
                                            <div class="product-img">
                                                <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                <h4 class="product-price">{{getProductPrice($produit)}} Dhs
                                                    @if(getProductDelPrice($produit))
                                                        <del class="product-old-price"> {{getProductDelPrice($produit)}} Dhs</del>
                                                    @endif
                                                </h4>
                                            </div>
                                        </a>
                                    </div>
                                @endforeach
                                <!-- /product widget -->
                            </div>
						</div>
					</div>

					<div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Meilleures Ventes</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">
                            <div>
                            @foreach($topventes->skip(6)->take(3) as $produit)
                                <!-- product widget -->
                                    <div class="product-widget">
                                        <a href="{{route('voir_produit',$produit->id)}}">
                                            <div class="product-img">
                                                <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                <h4 class="product-price">{{getProductPrice($produit)}} Dhs</h4>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- /product widget -->
                                @endforeach
                            </div>
                            <div>
                            @foreach($topventes->skip(9)->take(3) as $produit)
                                <!-- product widget -->
                                    <div class="product-widget">
                                        <a href="{{route('voir_produit',$produit->id)}}">
                                            <div class="product-img">
                                                <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                <h4 class="product-price">{{getProductPrice($produit)}} Dhs </h4>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- /product widget -->
                                @endforeach
                            </div>
                        </div>
                    </div>

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
@endsection

@section('extra-js')
    <script>
        // Set the date we're counting down to (M d, Y)
        var datePromotion = document.getElementById('date_promotion');
        var countDownDate = new Date(datePromotion.value).getTime();

        // Update the count down every 1 second
        var x = setInterval(function() {

            // Get today's date and time
            var now = new Date().getTime();

            // Find the distance between now and the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Output the result in an element with id="demo"
            document.getElementById("days").innerHTML = days;
            document.getElementById("hours").innerHTML = hours;
            document.getElementById("minutes").innerHTML = minutes;
            document.getElementById("seconds").innerHTML = seconds;

            // If the count down is over, write some text
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("days").innerHTML = "00";
                document.getElementById("hours").innerHTML = "00";
                document.getElementById("minutes").innerHTML = "00";
                document.getElementById("seconds").innerHTML = "00";
            }
        }, 1000);

        function getDate(d)
        {
            var day, month, year;

            result = d.match("[0-9]{2}([\-/ \.])[0-9]{2}[\-/ \.][0-9]{4}");
            if(null != result) {
                dateSplitted = result[0].split(result[1]);
                day = dateSplitted[0];
                month = dateSplitted[1];
                year = dateSplitted[2];
            }
            result = d.match("[0-9]{4}([\-/ \.])[0-9]{2}[\-/ \.][0-9]{2}");
            if(null != result) {
                dateSplitted = result[0].split(result[1]);
                day = dateSplitted[2];
                month = dateSplitted[1];
                year = dateSplitted[0];
            }

            if(month>12) {
                aux = day;
                day = month;
                month = aux;
            }

            return month+" "+day+", "+year;
        }
    </script>
@endsection
