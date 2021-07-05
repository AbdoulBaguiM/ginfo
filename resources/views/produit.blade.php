@extends('layout')

@section('title','| '.$produit->nom)

@section('breadcrumb')
    @include('partials.breadcrumb',['page' => 'Boutique', 'lien' => 'voir_produits'])
@endsection

@section('content')
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
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
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                            </div>
                            @if($produit->images)
                                @foreach(json_decode($produit->images,true) as $image)
                                    <div class="product-preview">
                                        <img src="{{asset('storage/'.$image)}}" alt="">
                                    </div>
                                @endforeach
                            @endif

                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img src="{{asset('storage/'.$produit->photo_principale)}}" alt="">
                            </div>
                            @if($produit->images)
                                @foreach(json_decode($produit->images,true) as $image)
                                    <div class="product-preview">
                                        <img src="{{asset('storage/'.$image)}}" alt="">
                                    </div>
                                @endforeach
                            @endif
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">{{$produit->nom}}</h2>
                            <div>
                                <div class="product-rating">
                                    @foreach(range(1,5) as $star)
                                        <i class="fa fa-star{{$produit->rating_cache >= $star ? '' : '-o empty'}}"></i>
                                    @endforeach
                                </div>
                                <a class="review-link" href="#">{{$produit->reviews()->count()}} Review(s) | Ajouter une note</a>
                            </div>
                            <div>
                                <h3 class="product-price">{{getProductPrice($produit)}} Dhs
                                    @if(getProductDelPrice($produit))
                                        <del class="product-old-price"> {{getProductDelPrice($produit)}} Dhs</del>
                                    @endif
                                </h3>
                                <span class="product-available">{!! $stockQ !!}</span>
                            </div>
                            <p>{{$produit->details}}</p>

{{--                            <div class="product-options">
                                <label>
                                    Size
                                    <select class="input-select">
                                        <option value="0">X</option>
                                    </select>
                                </label>
                                <label>
                                    Color
                                    <select class="input-select">
                                        <option value="0">Red</option>
                                    </select>
                                </label>
                            </div>--}}
                            @if($produit->quantite > 0 )
                                <div class="add-to-cart">
                                    <div class="qty-label" style="width: 20%;">
                                        <div class="input-group">
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[{{$produit->id}}]">
                                                    <span class="glyphicon glyphicon-minus"></span>
                                                </button>
                                            </span>
                                            <input type="text" name="quant[{{$produit->id}}]" class="form-control input-number" value="1" min="1" max="{{$produit->quantite}}" style="width: 65px;text-align: center" form="add_to_cart" >
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[{{$produit->id}}]">
                                                    <span class="glyphicon glyphicon-plus"></span>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                    <p></p>

                                    <button  style="display: none">
                                        <form action="{{ route('ajouter_au_panier', $produit) }}" method="POST" id="add_to_cart">
                                            @csrf
                                            <input type="hidden" name="id" value="{{$produit->id}}">
                                            <input type="hidden" name="nom" value="{{$produit->nom}}">
                                            <input type="hidden" name="prix_ht" value="{{floatval(str_replace(',', '', getProductPrice($produit)))}}">
                                            <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Ajouter au Panier</button>
                                        </form>
                                    </button>
                                </div>
                            @endif

                            <ul class="product-btns">
                                <li>
                                    <form action="{{ route('ajouter_a_la_wishlist', $produit) }}" method="POST">
                                        @csrf
                                        <input type="hidden" name="id" value="{{$produit->id}}">
                                        <input type="hidden" name="nom" value="{{$produit->nom}}">
                                        <input type="hidden" name="prix_ht" value="{{floatval(str_replace(',', '', getProductPrice($produit)))}}">
                                        <button class="unstyled-button" type="submit" style="font-weight: 500;text-transform: uppercase;"><i class="fa fa-heart-o"></i> Ajouter à la Wishlist</button>
                                    </form>
                                </li>
                            </ul>

                            <ul class="product-links">
                                <li>Categorie:</li>

                                @foreach($produit->categories()->get() as $categorie)
                                    <li><a href="{{route('voir_produits',['categorie' => $categorie->slug])}}">{{$categorie->nom}}</a></li>
                                @endforeach

                            </ul>

                            <ul class="product-links">


                                @foreach($produit->marque()->get() as $marque)
                                    @if($marque)
                                        <li>Marque:</li>
                                        <li><a href="{{route('voir_produits',['marque' => $marque->slug])}}">{{$marque->nom}}</a></li>
                                    @endif
                                @endforeach

                            </ul>

                            {!! Share::page('http://127.0.0.1:8000/boutique/'.$produit->id, null, [], '<ul class="product-links"><li>Partager : </li>', '</ul>')
                                ->facebook()
                                ->twitter()
                                ->whatsapp()
                                ->linkedin(); !!}

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                                <li><a data-toggle="tab" href="#tab2">Détails</a></li>
                                <li><a data-toggle="tab" href="#tab3">Reviews ({{$produit->reviews()->count()}})</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            {!! $produit->description !!}
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->

                                <!-- tab2  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p align="center">{{$produit->details}}</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab2  -->

                                <!-- tab3  -->
                                <div id="tab3" class="tab-pane fade in">
                                    <div class="row">
                                        <!-- Rating -->
                                        <div class="col-md-3">
                                            <div id="rating">
                                                <div class="rating-avg">
                                                    <span>{{$produit->rating_cache}}</span>
                                                    <div class="rating-stars">
                                                        @foreach(range(1,5) as $star)
                                                            <i class="fa fa-star{{$produit->rating_cache >= $star ? '' : '-o empty'}}"></i>
                                                        @endforeach

                                                    </div>
                                                </div>
                                                <ul class="rating">
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: {{$reviewDetails['widthR'][5]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][5]}}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: {{$reviewDetails['widthR'][4]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][4]}}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: {{$reviewDetails['widthR'][3]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][3]}}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: {{$reviewDetails['widthR'][2]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][2]}}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width:{{$reviewDetails['widthR'][1]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][1]}}</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Rating -->

                                        <!-- Reviews -->
                                        <div class="col-md-6">
                                            <div id="reviews">
                                                <ul class="reviews">
                                                    @forelse($reviews as $review)

                                                        <li>
                                                            <div class="review-heading">
                                                                <h5 class="name">{{$review->user->name}}</h5>
                                                                <p class="date">{{presentDate($review->updated_at)}}</p>
                                                                <div class="review-rating">
                                                                    @foreach(range(1,5) as $star)
                                                                        <i class="fa fa-star{{$review->note >= $star ? '' : '-o empty'}}"></i>
                                                                    @endforeach
                                                                </div>
                                                            </div>
                                                            <div class="review-body">
                                                                <p>{{$review->message}}</p>
                                                                @if($review->statut)
                                                                    <p align="right" style="color: lawngreen;font-size: small"><i class="fa fa-check-circle-o"></i> Achat vérifié</p>
                                                                @endif
                                                            </div>
                                                        </li>
                                                    @empty
                                                        <li><p>Aucune note pour ce produit, soyez le premier</p></li>
                                                    @endforelse

                                                </ul>

                                                {{$reviews->appends(request()->input())->links("pagination::bootstrap-4")}}
                                            </div>
                                        </div>
                                        <!-- /Reviews -->

                                        <!-- Review Form -->
                                        <div class="col-md-3">
                                            <div id="review-form">
                                                <form class="review-form" action="{{route('ajouter_review')}}" method="POST">
                                                    @csrf
                                                    <input name="id" type="hidden" value="{{$produit->id}}">
                                                    <input class="input" name="nom" type="text" value="{{auth()->user()? auth()->user()->name : null}}" placeholder="Nom">
                                                    <input class="input" name="email" type="email" value="{{auth()->user()? auth()->user()->email : null}}" placeholder="Email">
                                                    <textarea class="input" name="commentaire" placeholder="Commentaire"></textarea>
                                                    <div class="input-rating">
                                                        <span>Note: </span>
                                                        <div class="stars">
                                                            <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                            <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                            <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                            <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                            <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                        </div>
                                                    </div>
                                                    <button class="primary-btn" type="submit">Envoyer</button>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- /Review Form -->
                                    </div>
                                </div>
                                <!-- /tab3  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        @include('partials.mightAlsoLike')
@endsection
@section('extra-js')
    <script>
        $('.btn-number').click(function(e){
            e.preventDefault();

            fieldName = $(this).attr('data-field');
            type      = $(this).attr('data-type');
            var input = $("input[name='"+fieldName+"']");
            var currentVal = parseInt(input.val());
            if (!isNaN(currentVal)) {
                if(type == 'minus') {

                    if(currentVal > input.attr('min')) {
                        input.val(currentVal - 1).change();
                    }
                    if(parseInt(input.val()) == input.attr('min')) {
                        $(this).attr('disabled', true);
                    }

                } else if(type == 'plus') {

                    if(currentVal < input.attr('max')) {
                        input.val(currentVal + 1).change();
                    }
                    if(parseInt(input.val()) == input.attr('max')) {
                        $(this).attr('disabled', true);
                    }

                }
            } else {
                input.val(0);
            }
        });
        $('.input-number').focusin(function(){
            $(this).data('oldValue', $(this).val());
        });
        $('.input-number').change(function() {

            minValue =  parseInt($(this).attr('min'));
            maxValue =  parseInt($(this).attr('max'));
            valueCurrent = parseInt($(this).val());

            name = $(this).attr('name');
            if(valueCurrent >= minValue) {
                $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
            } else {
                alert('La valeur minimale est atteinte');
                $(this).val($(this).data('oldValue'));
            }
            if(valueCurrent <= maxValue) {
                $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
            } else {
                alert('La valeur maximale est atteinte');
                $(this).val($(this).data('oldValue'));
            }


        });
        $(".input-number").keydown(function (e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                // Allow: Ctrl+A
                (e.keyCode == 65 && e.ctrlKey === true) ||
                // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });
    </script>
@endsection
