@extends('layout')

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

                {!! setting('site.terms_conditions') !!}
            </div>
        </div>
    </div>
@endsection
