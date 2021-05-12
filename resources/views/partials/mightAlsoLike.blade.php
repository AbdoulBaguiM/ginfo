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
                                <img src="{{asset('img/'.$produit->photo_principale)}}" alt="">
                                <div class="product-label">
                                    <span class="sale">-30%</span>
                                </div>
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">{{$produit->nom}}</a></h3>
                                <h4 class="product-price">{{number_format($produit->prix_ht,2)}} <del class="product-old-price">$990.00</del></h4>
                                <div class="product-rating">
                                </div>
                                <div class="product-btns">
                                    <button class="add-to-wishlist">
                                        <form action="{{ route('ajouter_a_la_wishlist', $produit) }}" method="POST">
                                            {{ csrf_field() }}
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
                                    {{ csrf_field() }}
                                    <input type="hidden" name="id" value="{{$produit->id}}">
                                    <input type="hidden" name="nom" value="{{$produit->nom}}">
                                    <input type="hidden" name="prix_ht" value="{{$produit->prix_ht}}">
                                    <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>add to cart</button>
                                </form>
                            </div>
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
