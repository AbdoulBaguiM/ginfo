@extends('layout')

@section('title', 'Reinitialiser Mot de Passe')

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
@endsection

@section('content')
    <div class="container">
        <div class="auth-pages">
            <div class="auth-left">
                @if (session()->has('status'))
                    <div class="alert alert-success text-center">
                        {{ session()->get('status') }}
                    </div>
                @endif @if(count($errors) > 0)
                    <div class="alert alert-danger text-center">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <h3>Reinitialiser votre Mot de Passe</h3>
                <div class="spacer"></div>
                <form class="form-horizontal" method="POST" action="{{ route('password.request') }}">
                    {{ csrf_field() }}

                    <input type="hidden" name="token" value="{{ $token }}">

                    <input id="email" type="email" class="form-control" name="email" value="{{$email}}" placeholder="Email" required autofocus>

                    <input id="password" type="password" class="form-control" name="password" placeholder="Mot de passe" required>

                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirmer le mot de passe" required>

                    <div class="login-container">
                        <button type="submit" class="auth-button">Reinitialiser</button>
                    </div>

                </form>
            </div>
            <div class="auth-right">
                <h3>Informations complémentaires</h3>
                <div class="spacer"></div>
                <p>Entrez l'adresse mail associée à votre compte ainsi que le nouveau mot de passe</p>
                <div class="spacer"></div>
                <p>Si vous rencontrez des difficultés, prière de nous contactez! Nous serons ravis de vous aider à récupérer votre compte</p>
            </div>
        </div>
    </div>
@endsection



