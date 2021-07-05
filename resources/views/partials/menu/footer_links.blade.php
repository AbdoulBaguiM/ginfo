<ul class="footer-links">
    @foreach($items as $menu_item)
        @if($menu_item->title != 'Acceuil' && $menu_item->title != 'Catégories')
            <li><a href="{{$menu_item->link()}}">{{$menu_item->title}}</a></li>
        @endif
    @endforeach
</ul>
