@extends('layout')

@section('breadcrumb')
    @include('partials.breadcrumb',['page' => 'Contactez-nous', 'lien' => 'contactez-nous'])
@endsection

@section('content')
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
                    <div class="alert alert-danger text-center">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="spacer"></div>

                <div class="col-md-6">

                    <h2>Contactez-nous</h2>

                    <div class="spacer"></div>

                    {!! Form::open(['route'=>'contactus.store']) !!}
                    <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}" >
                        <label for="name" style="float: left">Nom :</label>
                        {!! Form::text('name', auth()->user() ? auth()->user()->name : '' , ['class'=>'form-control', 'placeholder'=>'Entrer votre nom']) !!}
                        <span class="text-danger">{{ $errors->first('name') }}</span>
                    </div>
                    <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}" >
                        <label for="email" style="float: left">Email :</label>
                        {!! Form::text('email', auth()->user() ? auth()->user()->email : '', ['class'=>'form-control', 'placeholder'=>'Entrer votre adresse mail']) !!}
                        <span class="text-danger">{{ $errors->first('email') }}</span>
                    </div>
                    <div class="form-group {{ $errors->has('message') ? 'has-error' : '' }}" >
                        <label for="message" style="float: left">Message :</label>
                        {!! Form::textarea('message', old('message'), ['class'=>'form-control', 'placeholder'=>'Entrer votre message']) !!}
                        <span class="text-danger">{{ $errors->first('message') }}</span>
                    </div>
                    <div class="form-group" align="center">
                        <button class="primary-btn">Envoyer</button>
                    </div>
                    {!! Form::close() !!}
                </div>

                <div class="col-md-6" align="center">
                    {{menu('Informations','partials.menu.informations_contactus')}}

                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13227.491646682392!2d-5.014194!3d34.021473!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xdd0a299d7f7a951!2sG.Info!5e0!3m2!1sfr!2sma!4v1624204820051!5m2!1sfr!2sma" width="600" height="395" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>

            </div>
        </div>
    </div>

@endsection
