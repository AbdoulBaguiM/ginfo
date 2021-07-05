@extends('layout')

@section('title', 'Créer un compte')

@section('extra-css')
    <style>
        .auth-pages {
            margin: 100px auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 100px;
            min-height: 60vh;
        }

        .auth-pages input {
            border: 1px solid ;
            padding: 16px 10px;
            border-radius: 5px;
            width: 100%;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .auth-pages input[type=checkbox] {
            width: auto;
        }

        .auth-pages .login-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .auth-pages .auth-button {
            background: #F96302;
            color: white;
            border-radius: 5px;
            border: 1px solid #212121;
            padding: 12px 50px;
        }

        .auth-pages .auth-button-hollow {
            background: white;
            color: #212121;
            border-radius: 5px;
            border: 1px solid #212121;
            padding: 12px 50px;
        }

        .auth-pages .auth-button-hollow:hover {
            background: #F96302;
            color: #e9e9e9;
        }

        .auth-pages .auth-right {
            border-left: 1px solid #CDCDCD;
            padding-left: 100px;
        }

        .auth-pages .already-have-container {
            text-align: right;
        }
    </style>
    {!! NoCaptcha::renderJs() !!}
@endsection

@section('content')
    <div class="container">
        <div class="auth-pages">
            <div>
                @if (session()->has('success_message'))
                    <div class="alert alert-success">
                        {{ session()->get('success_message') }}
                    </div>
                @endif @if(count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <h3 align="center">Créer votre compte</h3>
                <div class="spacer"></div>

                <form method="POST" action="{{ route('register') }}">
                    {{ csrf_field() }}

                    <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="Nom" required>

                    <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="Email" required focused>

                    <input id="telephone" type="tel" class="form-control" name="telephone" value="{{ old('telephone') }}" placeholder="Telephone" required>

                    <input id="password" type="password" class="form-control" name="password" placeholder="Mot de passe" required>

                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirmer le mot de passe" required>

                    <div class="form-group">
                        {!! NoCaptcha::display() !!}
                    </div>

                    <div class="login-container">
                        <button type="submit" class="auth-button">Créer votre compte</button>
                        <div class="already-have-container">
                            <p><strong>Vous avez déjà un compte?</strong></p>
                            <a href="{{ route('login') }}">Connectez-vous</a>
                        </div>
                    </div>

                </form>


            </div>

            <div class="auth-right">
                <h3 align="center">Nouvel Utilisateur</h3>
                <div class="spacer"></div>
                <p><strong>C'est gratuit</strong></p>
                <p>Créez votre compte client en quelques clics ! Vous pourrez ainsi commander différents produits proposés par notre catalogue</p>

                &nbsp;
                <div class="spacer"></div>
                <p><strong>Programme de fidelité</strong></p>
                <p>Nos clients fidèles sont recompensés par des promotions exclusives. Ne perdez plus de temps et inscrivez-vous</p>
            </div>
        </div> <!-- end auth-pages -->
    </div>
@endsection
