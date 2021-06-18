@extends('layout')

@section('title', 'Connexion')

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
        <br>
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

        <div class="auth-pages">
            <div class="auth-left">
                <h3 align="center" style="color: black">Connectez-vous</h3>
                <div class="spacer"></div>

                <form action="{{ route('login') }}" method="POST">
                    {{ csrf_field() }}

                    <input type="email" id="email" name="email" value="{{ old('email')}}" placeholder="Email" required autofocus>
                    <input type="password" id="password" name="password" value="{{ old('password') }}" placeholder="Mot de passe" required>

                    <div class="login-container">
                        <button type="submit" class="auth-button">Connexion</button>
                        <label>
                            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Se souvenir de moi
                        </label>
                    </div>

                    <div class="spacer"></div>

                    <a href="{{ route('password.request') }}">
                        Mot de passe oublié ?
                    </a>

                </form>
            </div>

            <div class="auth-right">
                <h3 align="center" style="color: black">Créer un compte</h3>

                <div class="spacer"></div>
                &nbsp;
                <div class="spacer"></div>
                <p>Créez votre compte client en quelques clics ! Vous pourrez ainsi commander différents produits proposés par notre catalogue</p>



                <div class="spacer"></div>
                &nbsp;
                <div class="spacer"></div>
                &nbsp;


                <a href="{{ route('register') }}" class="auth-button-hollow">Créer votre compte</a>

            </div>
        </div>
    </div>
@endsection
