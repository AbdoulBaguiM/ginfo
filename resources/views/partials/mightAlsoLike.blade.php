<!-- Section Related Products -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Vous aimerez aussi</h3>
                </div>
            </div>

            <!-- product -->
           @foreach($recommendations as $produit)
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
                                <h3 class="product-name"><a href="#">{{$produit->nom}}</a></h3>
                                    <h4 class="product-price">{{getProductPrice($produit)}} Dhs
                                        @if(getProductDelPrice($produit))
                                            <del class="product-old-price"> {{getProductDelPrice($produit)}} Dhs</del>
                                        @endif
                                    </h4>
                                    <div class="product-rating">
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
           @endforeach
            <!-- /product -->

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->
