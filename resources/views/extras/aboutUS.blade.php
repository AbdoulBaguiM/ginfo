@extends('layout')

@section('extra-css')
<style>
    section{
        display: flex;
        flex-flow: row wrap;
        justify-content: center;
        width: 100%;
        padding-bottom: 20px;
        margin: 20px auto;
        box-shadow: 0px 0px 10px #bbb;
        background-color: #fff;
    }

    section h2{
        margin: 20px 0;
        width: 90%;
    }
    section > div{
        width: 90%;
    }

    .prez{
        border-bottom: 2px dashed #ccc;
    }
    .prez a{
        display: block;
        text-align: center;
        padding: 10px;
        margin: 10px auto 30px auto;
        color: #fff;
        background-color: #EA0;
        box-shadow: 0px 0px 10px #ccc;
        border-radius: 5px;
    }
    .contact-flex{
        display: flex;
        flex-flow: row wrap;
        align-items: center;
    }
    .contact-flex p:first-child{
        flex: 0 0 40%;
    }
    .contact-flex p:last-child{
        flex: 0 0 60%;
    }
</style>
@endsection

@section('content')
    <div class="section">
        <div class="container">
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
                    <section>
                        <div class="prez" align="center">
                            <h2>Qui sommes-nous ?</h2>
                            <img src="{{asset('img/logo_mail.png')}}" class="photo">
                            <div class="spacer"></div>
                            {!! setting('site.aboutUs') !!}
                            <div class="spacer"></div>
                        </div>

                        <div align="center">
                            {{menu('Informations','partials.menu.aboutus_contact')}}
                        </div>
                    </section>
            </div>
        </div>
    </div>
@endsection
