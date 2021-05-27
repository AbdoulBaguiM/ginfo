<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +212-662-158-998</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> ginfofes@gmail.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> 67, Hay Farah II, Rue Khalil - Fès</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> DHS</a></li>
                @guest
                    <li><a href="{{route('login')}}"><i class="fa fa-user-o"></i> Mon Compte</a></li>
                @else
                    <li>
                        <div class="dropdown">
                            <a class="dropdown-item" href="{{ route('logout') }}"
                               onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                {{ __('Logout') }}
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                @csrf
                            </form>
                        </div>
                    </li>

                @endguest
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img src="{{asset('img/logo.png')}}" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select class="input-select">
                                <option value="0">All Categories</option>
                                <option value="1">Category 01</option>
                                <option value="1">Category 02</option>
                            </select>
                            <input class="input" placeholder="Search here">
                            <button class="search-btn">Rechercher</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-heart-o"></i>
                                <span>Liste d'envies</span>
                                @if(Cart::instance('wishlist')->count() > 0)
                                    <div class="qty">{{Cart::instance('wishlist')->count()}}</div>
                                @endif
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    @foreach(Cart::instance('wishlist')->content() as $item)
                                        <div class="product-widget">
                                            <a href="{{route('voir_produit',$item->model->id)}}">
                                                <div class="product-img">
                                                    <img src="{{asset('storage/'.$item->model->photo_principale)}}" alt="">
                                                </div>
                                            </a>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="{{route('voir_produit',$item->model->id)}}">{{$item->model->nom}}</a></h3>
                                                <h4 class="product-price">{{number_format($item->model->prix_ht,2)}}Dhs</h4>
                                                <span class="qty">
                                                   <form action="{{route('envoyer_au_panier',$item->rowId)}}" method="POST">
                                                       @csrf
                                                       <button type="submit"><i class="fa fa-arrow-right"></i></button>
                                                    </form>
                                                </span>
                                            </div>
                                            <form action="{{route('supprimer_de_la_wishlist',$item->rowId)}}" method="POST">
                                                @csrf
                                                {{method_field('DELETE')}}

                                                <button class="delete" type="submit"><i class="fa fa-close"></i></button>
                                            </form>
                                        </div>
                                    @endforeach

                                </div>
                                <div class="cart-summary">
                                    @if(Cart::instance('wishlist')->count() > 0)
                                        <small>{{Cart::instance('wishlist')->count()}} Item(s) selected</small>
                                    @else
                                        <small>Votre Wishlist est vide</small>
                                    @endif

                                </div>
                                <div class="cart-btns">
                                    <a href="{{route('voir_panier')}}">Voir le Panier</a>
                                </div>
                            </div>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Panier</span>
                                @if(Cart::instance('default')->count() > 0)
                                    <div class="qty">{{Cart::instance('default')->count()}}</div>
                                @endif
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    @foreach(Cart::content() as $item)
                                        <div class="product-widget">
                                            <a href="{{route('voir_produit',$item->model->id)}}">
                                                <div class="product-img">
                                                    <img src="{{asset('storage/'.$item->model->photo_principale)}}" alt="">
                                                </div>
                                            </a>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="{{route('voir_produit',$item->model->id)}}">{{$item->model->nom}}</a></h3>
                                                <h4 class="product-price"><span class="qty">1x</span>{{number_format($item->model->prix_ht,2)}}Dhs</h4>
                                            </div>
                                            <form action="{{route('supprimer_du_panier',$item->rowId)}}" method="POST">
                                                {{csrf_field()}}
                                                {{method_field('DELETE')}}

                                                <button class="delete" type="submit"><i class="fa fa-close"></i></button>
                                            </form>
                                        </div>
                                    @endforeach

                                </div>
                                <div class="cart-summary">
                                    @if(Cart::instance('default')->count() > 0)
                                        <small>{{Cart::instance('default')->count()}} Item(s) selected</small>
                                        <h5>SUBTOTAL: {{Cart::subtotal()}} Dhs</h5>
                                    @else
                                        <small>Votre panier est vide</small>
                                    @endif

                                </div>
                                <div class="cart-btns">
                                    <a href="{{route('voir_panier')}}">Voir le Panier</a>
                                    <a href="{{route('checkout_commande')}}">Commander <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->
