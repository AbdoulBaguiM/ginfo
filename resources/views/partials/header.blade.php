<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">

            {{menu('Informations','partials.menu.informations_header')}}

            <ul class="header-links pull-right">
                @guest
                    <li><a href="{{route('login')}}"><i class="fa fa-lock"></i>Mon Compte</a></li>
                @else
                    <li class="dropdown profile" style="margin-right: 3%">
                        <a href="#" class="dropdown-toggle text-right" data-toggle="dropdown" role="button"
                           aria-expanded="false"><nobr><i class="fa fa-user"></i> Bienvenue {{auth()->user()->name}} <i class="fa fa-caret-down"></i></a></nobr>

                        <ul class="dropdown-menu dropdown-menu-animated">
                            <br>
                            <li class="profile-img" style="padding: 10px">
                                <img src="{{ asset('storage/'.auth()->user()->avatar) }}" align="center" style="width: 50px;height: 50px;border-radius: 10px;">
                                <div style="color: white"> S</div>
                                <div class="profile-body">
                                    <h5>{{ Auth::user()->name }}</h5>
                                    <h6>{{ Auth::user()->email }}</h6>
                                </div>
                            </li>
                            <hr>
                            <li>
                                <a href="{{route('modifier_mon_profil')}}" style="color: black;">
                                    <i class="fa fa-user"></i> Mon Profil
                                </a>
                            </li>
                            <div class="spacer"></div>
                            <li>
                                <form action="{{ route('logout') }}" method="POST">
                                    {{ csrf_field() }}
                                    <button type="submit" class="secondary-btn"  style="position: center">
                                        Deconnexion
                                    </button>
                                </form>
                            </li>
                        </ul>
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
                        <a href="{{route('acceuil')}}" class="logo">
                            <img src="{{asset('storage/'.setting('site.logo'))}}" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="{{route('rechercher')}}" method="GET">
                            <input class="input-select" name="query" id="query" placeholder="Chercher un produit, une marque" value="{{request()->input('query')}}">
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
                                            <a href="{{route('voir_produit',$item->id)}}">
                                                <div class="product-img">
                                                    <img src="{{asset('storage/'.$item->model->photo_principale)}}" alt="">
                                                </div>
                                            </a>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="{{route('voir_produit',$item->id)}}">{{$item->name}}</a></h3>
                                                <h4 class="product-price">{{number_format($item->price,2)}}Dhs</h4>
                                                <span class="qty">
                                                    @if($item->model->quantite > 0 )
                                                       <form action="{{route('envoyer_au_panier',$item->rowId)}}" method="POST">
                                                           @csrf
                                                           <button class="unstyled-button" type="submit" style="font-size: 11px"><i class="fa fa-arrow-right"></i> Envoyer au Panier</button>
                                                        </form>
                                                    @else
                                                        <p style="color: red;font-size: 11px">Epuisé</p>
                                                    @endif
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
                                        <small>{{Cart::instance('wishlist')->count()}} Produit(s)</small>
                                    @else
                                        <small>Votre Liste d'envies est vide</small>
                                    @endif

                                </div>
                                <div class="cart-btns">
                                    <a href="{{route('voir_panier')}}">Voir le Panier</a>
                                    <a href="{{route('vider_la_wishlist')}}" style="background-color: red;">Vider <i class="fa fa-trash-o"></i></a>
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
                                            <a href="{{route('voir_produit',$item->id)}}">
                                                <div class="product-img">
                                                    <img src="{{asset('storage/'.$item->model->photo_principale)}}" alt="">
                                                </div>
                                            </a>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="{{route('voir_produit',$item->id)}}">{{$item->name}}</a></h3>
                                                <h4 class="product-price"><span class="qty">{{$item->qty}}x</span>{{number_format($item->price,2)}}Dhs</h4>
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
                                        <small>{{Cart::instance('default')->count()}} Produit(s)</small>
                                        <h5>SOUS-TOTAL: {{Cart::subtotal()}} Dhs</h5>
                                    @else
                                        <small>Votre Panier est vide</small>
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
