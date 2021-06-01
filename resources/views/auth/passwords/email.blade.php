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
                    <div class="alert alert-success">
                        {{ session()->get('status') }}
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
                <h3>Mot de passe oublié ?</h3>
                <div class="spacer"></div>
                <form action="{{ route('password.email') }}" method="POST">
                    {{ csrf_field() }}
                    <input type="email" id="email" name="email" value="{{ old('email') }}" placeholder="Email" required autofocus>
                    <div class="login-container">
                        <button type="submit" class="auth-button">Reinitialiser</button>
                    </div>


                </form>
            </div>
            <div class="auth-right">
                <h3>Informations complémentaires</h3>
                <div class="spacer"></div>
                <p>Un lien de reinitialisation sera envoyé dans votre boîte mail. Cliquez dessus pour pouvoir créer un nouveau mot de passe.</p>
                <div class="spacer"></div>
                <p>Ne le communiquez à personne aux risques de perdre votre compte</p>
            </div>
        </div>
    </div>
@endsection

