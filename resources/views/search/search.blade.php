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
                <!-- /ASIDE -->

                <!-- STORE -->
                <div id="store" class="col-md-12" >
                    <!-- store top filter -->
                    <div class="store-filter clearfix">
                        <div class="store-sort">
                            <label>
                                <h4>
                                    {{request()->input('query')}} : {{$produits->count()}} Résultat(s)
                                </h4>
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
