@extends('layout')

@section('extra-css')
    <link type="text/css" rel="stylesheet" href="{{asset('css/my-profile.css')}}"/>
    <script src="{{asset('js/jquery.min.js')}}"></script>
    <script src="{{asset('js/jquery.modal.min.js')}}"></script>
    <link rel="stylesheet" href="{{asset('css/jquery.modal.min.css')}}" />
@endsection

@section('content')
    <div class="container bootstrap snippet">
        <div class="spacer"></div>
        <br>
        <div class="row">
            @if (session()->has('success_message'))
                <div class="alert alert-success text-center">
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
            <div class="col-sm-3"><!--left col-->

                <div class="text-center">
                    <img src="{{asset('storage/'.$user->avatar)}}" class="avatar img-circle img-thumbnail" alt="avatar">
                    <hr><h6>Changer d'avatar</h6>
                    <input type="file" data-name="avatar" name="avatar" class="text-center center-block file-upload" form="registrationForm">

                </div><br>

                <ul class="list-group">
                    <li class="list-group-item text-muted">Mon Activité <i class="fa fa-dashboard fa-1x"></i></li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Commandes</strong></span>
                        {{$commandes->count()}}</li>
                </ul>

            </div><!--/col-3-->

            <div class="col-sm-9">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#profile">Mon Profil</a></li>
                    <li><a data-toggle="tab" href="#orders">Mes Commandes</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="profile">
                        <hr>
                        <form class="form" action="{{route('mettre_profil_a_jour')}}" method="POST" id="registrationForm" role="form" enctype="multipart/form-data">
                            @method('patch')
                            @csrf
                            <div class="form-group">

                                    <label for="first_name">Nom</label>
                                    <input type="text" class="form-control" name="first_name" id="first_name" value="{{old('name',$user->name)}}" placeholder="Nom">

                            </div>

                            <div class="form-group">

                                    <label for="last_name">Prenom</label>
                                    <input type="text" class="form-control" name="last_name" id="last_name" value="{{old('name',$user->last_name)}}" placeholder="Prenom">

                            </div>

                            <div class="form-group">

                                    <label for="phone">Telephone</label>
                                    <input type="text" class="form-control" name="telephone" id="phone" value="{{old('name',$user->telephone)}}" placeholder="Téléphone" >

                            </div>

                            <div class="form-group">

                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" id="email" value="{{old('name',$user->email)}}" placeholder="Adresse Mail" readonly>

                            </div>

                            <div class="form-group">

                                    <label for="email">Adresse</label>
                                    <input type="text" class="form-control" name="adresse" id="location" value="{{old('name',$user->adresse)}}" placeholder="Adresse">

                            </div>

                            <div class="form-group" style="display: inline-flex">
                                <div style="float: left">
                                    <label for="ville">Ville</label>
                                    <input type="text" class="form-control" name="password" id="password" value="{{old('name',$user->ville)}}" placeholder="Ville" style="width: 90%">
                                </div>

                                <div style="float: right">
                                    <label for="zipcode">Code Postal</label>
                                    <input type="text" class="form-control" name="password" id="password" value="{{old('name',$user->zipcode)}}" placeholder="Code Postal"  style="width: 90%">
                                </div>
                            </div>


                            <div class="form-group">

                                    <label for="password">Mot de Passe</label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Mot de Passe">

                            </div>

                            <div class="form-group">

                                    <label for="password2">Verifier le Mot de Passe</label>
                                    <input type="password" class="form-control" name="password_confirmation" id="password2" placeholder="Mot de Passe">

                            </div>

                            <div class="form-group">
                                    <p></p>
                                    <p><i class="fa fa-question"></i> Laissez le mot de passe vide pour qu'il soit inchangé</p>
                            </div>

                            <div class="form-group" align="center">
                                    <br>
                                    <button class="primary-btn order-submit" type="submit"><i class="fa fa-check"></i>Enregistrer</button>
                                    <button class="secondary-btn" type="reset"><i class="fa fa-trash"></i> Reinitialiser</button>
                            </div>
                        </form>

                        <hr>

                    </div><!--/tab-pane-->

                    <div class="tab-pane my-orders container" id="orders" style="width: 100%">
                        <hr>
                        <div>
                            @forelse($commandes as $commande)
                                <div class="order-container">
                                    <div class="order-header">
                                        <div class="order-header-items">
                                            <div>
                                                <div class="uppercase font-bold">Date Commande</div>
                                                <div align="center">{{ presentDate($commande->created_at) }}</div>
                                            </div>
                                            <div>
                                                <div class="uppercase font-bold">Commande N°</div>
                                                <div align="center">{{ $commande->id }}</div>
                                            </div>
                                            <div>
                                                <div class="uppercase font-bold">Total</div>
                                                <div>{{ number_format($commande->c_total,2) }} Dhs</div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="order-header-items">
                                                <div><a href="#{{$commande->id}}" rel="modal:open">Details</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal" id="{{$commande->id}}">
                                        <!-- Start address Section -->
                                        <tr>
                                            <td style="padding-top: 0;">
                                                <table align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner" style="border-bottom: 1px solid #bbbbbb;">
                                                    <tbody>
                                                    <tr>
                                                        <td style="width: 55%; font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                                            Adresse de Livraison
                                                        </td>
                                                        <td style="width: 45%; font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                                            Informations Client
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                                            {{strtoupper($commande->c_adresse)}}
                                                        </td>
                                                        <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                                            {{strtoupper($commande->c_nom)}} {{strtoupper($commande->c_prenom)}}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                                            {{strtoupper($commande->c_ville)}}, {{strtoupper($commande->c_zipcode)}}
                                                        </td>
                                                        <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                                            {{strtoupper($commande->c_telephone)}}
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <!-- End address Section -->

                                        <!-- Start product Section -->
                                        @foreach($commande->produits()->get() as $produit)
                                            <tr>
                                                <td style="padding-top: 0;">
                                                    <table align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner" style="border-bottom: 1px solid #eeeeee;">
                                                        <tbody>
                                                        <tr>
                                                            <td rowspan="4" style="padding-right: 10px; padding-bottom: 10px;">
                                                                <img style="height: 80px;" src="{{asset('storage/'.$produit->photo_principale)}}" alt="Product Image" />
                                                            </td>
                                                            <td colspan="2" style="font-size: 14px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                                                {{$produit->nom}}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 14px; line-height: 18px; color: #757575; width: 440px;">
                                                                Quantité: {{$produit->pivot->quantite}}
                                                            </td>
                                                            <td style="width: 130px;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 14px; line-height: 18px; color: #757575;"></td>
                                                            <td style="font-size: 14px; line-height: 18px; color: #757575; text-align: right;">
                                                                {{$produit->pivot->quantite}}x {{number_format($produit->prix_ht,2)}} DHS
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                    @endforeach
                                    <!-- End product Section -->

                                        <a class="secondary-btn" href="#" rel="modal:close" style="margin-left: 70%">Fermer</a>
                                    </div>
                                    <div class="order-products">
                                        @foreach ($commande->produits as $produit)
                                            <div class="order-product-item">
                                                <div>
                                                    <a href="{{ route('voir_produit', $produit) }}">
                                                        <img src="{{ asset('storage/'.$produit->photo_principale) }}" alt="Photo Produit">
                                                    </a>
                                                </div>
                                                <div>
                                                    <div>
                                                        <a href="{{ route('voir_produit', $produit) }}">{{ $produit->nom }}</a>
                                                    </div>
                                                    <div>{{ number_format($produit->prix_ht,2) }} Dhs</div>
                                                    <div>Quantité: {{ $produit->pivot->quantite }}</div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div> <!-- end order-container -->
                            @empty
                                <div class="panel panel-default">
                                    <div class="panel-heading">Vous n'avez aucune commande</div>
                                    <div class="panel-body">
                                        <a href="{{route('voir_produits')}}"><i class="fa fa-arrow-right"></i>
                                            Visiter notre boutique afin de passer vos premières commandes</a>
                                    </div>
                                </div>
                            @endforelse
                        </div>
                    </div><!--/tab-pane-->
                </div><!--/tab-pane-->
            </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
@endsection

@section('extra-js')
    <script>
        $(document).ready(function() {

            var readURL = function(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('.avatar').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }

            $(".file-upload").on('change', function(){
                readURL(this);
            });
        });
    </script>
@endsection
