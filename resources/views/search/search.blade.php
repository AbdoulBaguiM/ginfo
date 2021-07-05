@extends('layout')

@section('breadcrumb')
    @if(request()->input('query'))
        @include('partials.breadcrumb',['page' => 'Recherche', 'lien' => 'voir_produits'])
    @else
        @include('partials.breadcrumb',['page' => 'Promotions', 'lien' => 'voir_promotions'])
    @endif
@endsection

@section('content')
    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- ASIDE -->
                <!-- /ASIDE -->

                <!-- STORE -->
                <div id="store" class="col-md-12" >
                    <!-- store top filter -->
                    <div class="store-filter clearfix">
                        <div class="store-sort">
                            <label>
                                @if(request()->input('query'))
                                    <h4>
                                        {{request()->input('query')}} : {{$produits->count()}} Résultat(s)
                                    </h4>
                                @else
                                    <h4>
                                        {{$produits->count()}} Produits en Promotion
                                    </h4>
                                @endif
                            </label>
                        </div>
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
                    <div class="row">
                        <!-- products-->
                        @forelse($produits as $produit)
                            <div class="col-md-3 col-xs-6">
                                <a href="{{route('voir_produit',$produit->id)}}">
                                    <div class="product">
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
