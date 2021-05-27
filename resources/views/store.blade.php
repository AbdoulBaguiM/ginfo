@extends('layout')

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
					<!-- ASIDE -->
					<div id="aside" class="col-md-3">
						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Categories</h3>
							<div class="checkbox-filter">

                                @foreach( $categories as $categorie )
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="category-{{$categorie->id}}" {{request()->categorie == $categorie->slug ? 'checked' : ''}} onclick="return false;">
                                        <label for="category-{{$categorie->id}}">
                                            <span></span>
                                            <a href="{{route('voir_produits',['categorie' => $categorie->slug])}}">
                                                {{$categorie->nom}}</a>
                                            <small>({{$categorie->produits()->count()}})</small>
                                        </label>
                                    </div>
                                @endforeach

							</div>
						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Prix</h3>
							<div class="price-filter">
								<div id="price-slider"></div>
								<div class="input-number price-min">
									<input id="price-min" type="number">
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
								<span>-</span>
								<div class="input-number price-max">
									<input id="price-max" type="number">
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Marque</h3>
							<div class="checkbox-filter">

                                @foreach( $marques as $marque )
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="category-{{$marque->id}}" {{request()->marque == $marque->slug ? 'checked' : ''}} onclick="return false;">
                                        <label for="category-{{$marque->id}}">
                                            <span></span>
                                            <a href="{{route('voir_produits',['marque' => $marque->slug])}}">
                                                {{$marque->nom}}</a>
                                            <small>({{$marque->produits()->count()}})</small>
                                        </label>
                                    </div>
                                @endforeach

							</div>
						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Top ventes</h3>
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product01.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>

							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product02.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>

							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product03.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->
					</div>
					<!-- /ASIDE -->

					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							<div class="store-sort">
								<label>
									Sort By:
									<select class="input-select">
										<option value="0">Popular</option>
										<option value="1">Position</option>
									</select>
								</label>

								<label>
									Show:
									<select class="input-select">
										<option value="0">20</option>
										<option value="1">50</option>
									</select>
								</label>
							</div>
							<ul class="store-grid">
								<li class="active"><i class="fa fa-th"></i></li>
								<li><a href="#"><i class="fa fa-th-list"></i></a></li>
							</ul>
						</div>
						<!-- /store top filter -->
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
                        </div>
						<!-- store products -->
						<div class="row">
							<!-- products-->
                            @forelse($produits as $produit)
                                <div class="col-md-4 col-xs-6">
                                    <a href="{{route('voir_produit',$produit->id)}}">
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                                                <div class="product-label">
                                                    <span class="sale">-30%</span>
                                                    @if($produit->featured)
                                                        <span class='new'>NEW</span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                @if($produit->categories()->first())
                                                    <p class="product-category">{{$produit->categories()->first()->nom}}</p>
                                                @endif
                                                <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                <h4 class="product-price">{{number_format($produit->prix_ht,2)}}Dhs<del class="product-old-price">990.00Dhs</del></h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist">
                                                        <form action="{{ route('ajouter_a_la_wishlist', $produit) }}" method="POST">
                                                            @csrf
                                                            <input type="hidden" name="id" value="{{$produit->id}}">
                                                            <input type="hidden" name="nom" value="{{$produit->nom}}">
                                                            <input type="hidden" name="prix_ht" value="{{$produit->prix_ht}}">
                                                            <button type="submit"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        </form>
                                                    </button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <form action="{{ route('ajouter_au_panier', $produit) }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{$produit->id}}">
                                                    <input type="hidden" name="nom" value="{{$produit->nom}}">
                                                    <input type="hidden" name="prix_ht" value="{{$produit->prix_ht}}">
                                                    <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>J'achète</button>
                                                </form>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            @empty
                                <div >Aucun produit trouvé</div>
                            @endforelse
							<!-- /products-->
						</div>
						<!-- /store products -->
						<!-- store bottom filter -->

						<div class="store-filter clearfix" style="float: right">
							<span class="store-qty">Showing 20-100 products</span>
                            {{$produits->appends(request()->input())->links("pagination::bootstrap-4")}}
						</div>

						<!-- /store bottom filter -->
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
@endsection
