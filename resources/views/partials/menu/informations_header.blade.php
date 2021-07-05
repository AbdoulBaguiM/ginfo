<ul class="header-links pull-left">
    @foreach($items as $menu_item)
        @if($menu_item->title == 'Téléphone')
            <li><a href="tel:{{$menu_item->link()}}"><i class="fa fa-phone"></i> {{$menu_item->link()}}</a></li>
        @elseif( $menu_item->title == 'Mail')
            <li><a href="mailto: {{$menu_item->link()}}"><i class="fa fa-envelope-o"></i> {{$menu_item->link()}}</a></li>
        @else
            <li><a href="{{$menu_item->link()}}"><i class="fa fa-map-marker"></i> {{$menu_item->title}}</a></li>
        @endif
    @endforeach
</ul>
