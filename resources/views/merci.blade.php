@extends('layout')

@section('content')
    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
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

                <div class="jumbotron text-center" style="background-color: white">
                    <h1 class="display-3">Félicitations !</h1>
                    <p class="lead"><strong>Veuillez vérifier votre boite mail</strong> pour visualiser votre commande</p>
                    <hr>
                    <p>
                        Vous rencontrez des difficultés ?<a href="{{route('contactez-nous')}}">Contactez-nous</a>
                    </p>
                    <p class="lead">
                        <a href="{{route('voir_produits')}}" class="btn btn-primary btn-lg" role="button"  style="background-color: #F96302">
                            Retour vers la boutique</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
@endsection
