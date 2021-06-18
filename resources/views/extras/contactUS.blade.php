@extends('layout')

@section('breadcrumb')
    @include('partials.breadcrumb',['page' => 'Contactez-nous', 'lien' => 'contactez-nous'])
@endsection

@section('content')
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row" align="center">
                @if (session()->has('success_message'))
                    <div class="alert alert-success text-center">
                        {{ session()->get('success_message') }}
                    </div>
                @endif

                @if(count($errors) > 0)
                    <div class="alert alert-danger text-center">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="spacer"></div>
                <h2>Contactez-nous</h2>

                <div class="spacer"></div>

                {!! Form::open(['route'=>'contactus.store']) !!}
                <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}" style="width: 50%;">
                    <label for="name" style="float: left">Nom :</label>
                    {!! Form::text('name', auth()->user() ? auth()->user()->name : '' , ['class'=>'form-control', 'placeholder'=>'Entrer votre nom']) !!}
                    <span class="text-danger">{{ $errors->first('name') }}</span>
                </div>
                <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}" style="width: 50%">
                    <label for="email" style="float: left">Email :</label>
                    {!! Form::text('email', auth()->user() ? auth()->user()->email : '', ['class'=>'form-control', 'placeholder'=>'Entrer votre adresse mail']) !!}
                    <span class="text-danger">{{ $errors->first('email') }}</span>
                </div>
                <div class="form-group {{ $errors->has('message') ? 'has-error' : '' }}" style="width: 50%">
                    <label for="message" style="float: left">Message :</label>
                    {!! Form::textarea('message', old('message'), ['class'=>'form-control', 'placeholder'=>'Entrer votre message']) !!}
                    <span class="text-danger">{{ $errors->first('message') }}</span>
                </div>
                <div class="form-group">
                    <button class="primary-btn">Envoyer</button>
                </div>
                {!! Form::close() !!}
            </div>

        </div>
    </div>

@endsection
