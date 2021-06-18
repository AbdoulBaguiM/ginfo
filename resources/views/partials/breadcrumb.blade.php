<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="/">Acceuil</a></li>
{{--                    <li><a href="{{route('voir_produits')}}">Boutique</a></li>--}}
                    <li><a href="{{route($lien)}}">{{$page}}</a></li>
                    @if( ! empty($produit) )
                        @foreach( $produit->categories()->get() as $categorie )
                            <li><a href="{{route('voir_produits',['categorie' => $categorie->slug])}}">{{$categorie->nom}}</a></li>
                        @endforeach
                        <li><a href="{{route('voir_produit',$produit->id)}}">{{$produit->nom}}</a></li>
                    @endif
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->
