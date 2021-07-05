<ul class="main-nav nav navbar-nav">
    @foreach($items as $menu_item)
        @if($menu_item->title == 'Catégories')
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{$menu_item->title}} <i class="fa fa-caret-down"></i>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="padding-left: 20px">
                    @foreach(getCategories() as $categorie)
                        <a class="dropdown-item" href="{{route('voir_produits',['categorie' => $categorie->slug])}}">
                            {{$categorie->nom}}</a><br>
                    @endforeach
                </div>
            </li>
        @else
            <li><a href="{{$menu_item->link()}}">{{$menu_item->title}}</a></li>
        @endif
    @endforeach
</ul>
