@extends('layout')

@section('title','| Boutique')

@section('breadcrumb')
    @include('partials.breadcrumb',['page' => 'Boutique', 'lien' => 'voir_produits'])
@endsection

@section('extra-css')
    <style>
        .item.list-group-item
        {
            float: none;
            width: 100%;
            background-color: #fff;
            margin-bottom: 30px;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            padding: 0 1rem;
            border: 0;
        }
        .item.list-group-item .img-event {
            float: left;
            width: 30%;
        }

        .item.list-group-item .list-group-image
        {
            margin-right: 10px;
        }
        .item.list-group-item .thumbnail
        {
            margin-bottom: 0px;
            display: inline-block;
        }
        .item.list-group-item .caption
        {
            float: left;
            width: 70%;
            margin: 0;
        }

        .item.list-group-item:before, .item.list-group-item:after
        {
            display: table;
            content: " ";
        }

        .item.list-group-item:after
        {
            clear: both;
        }
    </style>
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
                            <h3 class="aside-title">Prix (DHS)
                                <button type="submit" class="unstyled-link" form="sortByPrice">OK</button>
                            </h3>

                            <form action="{{route('trier_par_prix')}}" method="POST" id="sortByPrice">
                                @csrf
                                <div class="price-filter">
                                    <div id="price-slider"></div>
                                    <div class="input-number price-min">
                                        <input id="price-min" name="price_min" type="number" >
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                    <span>-</span>
                                    <div class="input-number price-max">
                                        <input id="price-max" name="price_max" type="number">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                </div>
                            </form>
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
								<li class="active">
                                    <button class="unstyled-button" id="grid"><i class="fa fa-th"></i></button>
                                </li>
								<li>
                                    <button class="unstyled-button" id="list"><i class="fa fa-th-list"></i></button>
                                </li>
							</ul>
						</div>
						<!-- /store top filter -->
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
                        </div>
						<!-- store products -->
						<div class="row" id="products">
							<!-- products-->
                            @forelse($produits as $produit)
                                <div class="item col-md-4 col-xs-6">
                                    <a href="{{route('voir_produit',$produit->id)}}">
                                        <div class="product">
                                            <div class="product-img img-event">
                                                <img class="list-group-image" src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
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
                                                @endif
                                                <h3 class="product-name"><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></h3>
                                                    <h4 class="product-price">{{getProductPrice($produit)}} Dhs
                                                        @if(getProductDelPrice($produit))
                                                            <del class="product-old-price"> {{getProductDelPrice($produit)}} Dhs</del>
                                                        @endif
                                                    </h4>
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
                                                            <input type="hidden" name="prix_ht" value="{{$produit->prix_ht}}">
                                                            <button class="unstyled-button" type="submit"><i class="fa fa-heart-o"></i><span class="tooltipp">Ajouter à la wishlist</span></button>
                                                        </form>

                                                </div>
                                            </div>
                                            @if($produit->quantite > 0 )
                                                <div class="add-to-cart">
                                                    <form action="{{ route('ajouter_au_panier', $produit) }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="id" value="{{$produit->id}}">
                                                        <input type="hidden" name="nom" value="{{$produit->nom}}">
                                                        <input type="hidden" name="prix_ht" value="{{$produit->prix_ht}}">
                                                        <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>J'achète</button>
                                                    </form>
                                                </div>
                                            @endif
                                        </div>
                                    </a>
                                </div>
                            @empty
                                <div ><p>Aucun produit trouvé</p></div>
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

@section('extra-js')
    <script>
        $(document).ready(function() {
            $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
            $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
        });
    </script>
@endsection
