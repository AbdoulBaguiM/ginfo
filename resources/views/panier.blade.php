@extends('layout')

@section('title','| Panier')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
@endsection

@section('breadcrumb')
    @include('partials.breadcrumb')
@endsection

@section('content')
    <div class="wrap cf">
        <div class="heading cf">
            <h1>Mon Panier</h1>
            <a href="{{route('voir_produits')}}" class="btn-local continue">Retour a la boutique</a>
        </div>
        <div class="cart">
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

                @if(Cart::count() > 0 )

                    <h2>{{Cart::count()}} element(s) dans le Panier</h2>

                    <ul class="cartWrap">
                        @foreach(Cart::content() as $item)
                            <li class="items @if ($loop->iteration % 2 == 0) odd @else even @endif">
                                <div class="product-widget">
                                <div class="infoWrap">
                                    <div class="tableRow">
                                        <div class="cartSection">
                                            <a href="{{route('voir_produit',$item->model->id)}}">
                                                <img src="{{asset('storage/'.$item->model->photo_principale)}}" alt="" class="itemImg" />

                                                <h3>{{$item->model->nom}}</h3>
                                            </a>
                                            <p>{{$item->model->details}}</p>

                                            <div style="width: 18em">
                                                <div class="input-group">
                                                    <span class="input-group-btn">
                                                        <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[{{$item->model->id}}]">
                                                            <span class="glyphicon glyphicon-minus"></span>
                                                        </button>
                                                    </span>
                                                    <input type="text" name="quant[{{$item->model->id}}]" class="form-control input-number" value="{{$item->qty}}" min="1" max="{{$item->model->quantite}}">
                                                    <span class="input-group-btn">
                                                        <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[{{$item->model->id}}]">
                                                            <span class="glyphicon glyphicon-plus"></span>
                                                        </button>
                                                    </span>
                                                </div>
                                            </div>

                                            <p class="stockStatus"> En Stock</p>
                                        </div>
                                        <div class="cell2">
                                            <div class="prodTotal cartSection">
                                                <p>{{number_format($item->model->prix_ht,2)}}DHS</p>
                                            <div class="cartSection removeWrap">

                                                <form action="{{route('supprimer_du_panier',$item->rowId)}}" method="POST">
                                                    @csrf
                                                    {{method_field('DELETE')}}

                                                    <button class="delete" type="submit"><i class="fa fa-close"></i></button>

                                                </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </li>
                        @endforeach

                    </ul>
        </div>

        <div class="subtotal cf">
            <ul>
                <li class="totalRow"><span class="label">Sous-Total</span><span class="value">{{Cart::subtotal()}} Dhs</span></li>

                <li class="totalRow"><span class="label">Frais de Livraison</span><span class="value">5.00 Dhs</span></li>

                <li class="totalRow"><span class="label">Taxe</span><span class="value">{{Cart::tax()}} Dhs</span></li>
                <li class="totalRow final"><span class="label">Total</span><span class="value">{{Cart::total()}} Dhs</span></li>
                <li class="totalRow"><a href="{{route('checkout_commande')}}" class="btn-local continue">Commander</a></li>
            </ul>
        </div>
    </div>

    @else
        <h4>Votre Panier est vide</h4>
    @endif
@endsection

@section('extra-js')
    <script src="{{asset('js/cart.js')}}"></script>
@endsection

