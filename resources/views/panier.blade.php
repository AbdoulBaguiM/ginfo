@extends('layout')

@section('title','Panier')

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
            <a href="{{route('voir_produits')}}" class="btn continue">Retour a la boutique</a>
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
                                <div class="infoWrap">
                                    <div class="tableRow">
                                        <div class="cartSection">
                                            <a href="{{route('voir_produit',$item->model->id)}}">
                                                <img src="{{asset('storage/'.$item->model->photo_principale)}}" alt="" class="itemImg" />

                                                <h3>{{$item->model->nom}}</h3>
                                            </a>
                                            <p>{{$item->model->details}}</p>
                                            <p> <input type="number"  class="qty" placeholder="3"/> x $5.00</p>

                                            <p class="stockStatus"> In Stock</p>
                                        </div>
                                        <div class="cell2">
                                            <div class="prodTotal cartSection">
                                                <p>{{number_format($item->model->prix_ht,2)}}Dhs</p>
                                            </div>
                                            <div class="cartSection removeWrap">
                                                <form action="{{route('supprimer_du_panier',$item->rowId)}}" method="POST">
                                                    @csrf
                                                    {{method_field('DELETE')}}

                                                    <button class="remove" type="submit"><i class="fa fa-trash"></i></button>

                                                </form>
                                            </div>
                                        </div>

                                </div>
                            </li>
                        @endforeach

                    </ul>
        </div>

{{--        <div class="promoCode">--}}
{{--            <label for="promo">Vous avez un Code Promo?</label>--}}
{{--            <form action="{{route('ajouter_coupon')}}" method="POST">--}}
{{--                @csrf--}}
{{--                <input type="text" name="coupon_code" id="coupon_code" placeholder="Entrer le Code" />--}}
{{--                <button type="submit" class="btn"></button>--}}
{{--            </form>--}}
{{--        </div>--}}

        <div class="subtotal cf">
            <ul>
                <li class="totalRow"><span class="label">Subtotal</span><span class="value">{{Cart::subtotal()}} Dhs</span></li>

                <li class="totalRow"><span class="label">Shipping</span><span class="value">$5.00</span></li>

                <li class="totalRow"><span class="label">Tax</span><span class="value">{{Cart::tax()}} Dhs</span></li>
                <li class="totalRow final"><span class="label">Total</span><span class="value">{{Cart::total()}} Dhs</span></li>
                <li class="totalRow"><a href="{{route('checkout_commande')}}" class="btn continue">Commander</a></li>
            </ul>
        </div>
    </div>

    @else
        <h3>Panier vide</h3>
    @endif
@endsection

@section('extra-js')
    <script src="{{asset('js/cart.js')}}"></script>
@endsection

