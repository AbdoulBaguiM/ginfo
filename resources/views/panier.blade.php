@extends('layout')

@section('title','| Panier')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
@endsection

@section('content')
    <div class="wrap cf">
        <div class="heading cf">
            <h1>Mon Panier</h1>
            <a href="{{route('voir_produits')}}" class="btn-local continue">Retour a la boutique</a>
        </div>

        @if(Cart::count() > 0 )
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
<p>
                                            <select onmousedown="if(this.options.length>5){this.size=5;}" onchange="this.blur()"  onblur="this.size=1;" class="input-select quantity" data-id="{{ $item->rowId }}" style="width: 80px; border-radius: 10px;">
                                                @for ($i = 1; $i <= $item->model->quantite ; $i++)
                                                    <option {{ $item->qty == $i ? 'selected' : '' }}> {{ $i }} </option>
                                                @endfor
                                            </select>
                                            x {{number_format($item->model->prix_ht,2)}} Dhs
</p>
                                            <p class="stockStatus"> {!! getStockLevel($item->model->quantite) !!}</p>
                                        </div>
                                        <div class="cell2">
                                            <div class="prodTotal cartSection">
                                                <p>{{number_format($item->model->prix_ht * $item->qty,2)}}DHS</p>
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
        @else
            <div class="spacer"></div>
            <h4>Votre Panier est vide</h4>
        @endif
    </div>
@endsection

@section('extra-js')
    <script src="{{asset('js/cart.js')}}"></script>
    <script src="{{asset('js/axios.js')}}"></script>
    <script>
        (function(){
            const classname = document.querySelectorAll('.quantity')

            Array.from(classname).forEach(function(element) {
                element.addEventListener('change', function() {
                    const id = element.getAttribute('data-id')

                    axios.patch(`/panier/${id}`, {
                        quantity: this.value,
                    })
                        .then(function (response) {
                            window.location.href = '{{ route('voir_panier') }}'
                        })
                        .catch(function (error) {
                            window.location.href = '{{ route('voir_panier') }}'
                        });
                })
            })
        })();
    </script>
@endsection

