<ul class="footer-links">
    <li>
        @foreach($items as $menu_item)
            @if($menu_item->title == 'Téléphone')
                <a href="tel:{{$menu_item->link()}}"><i class="fa fa-phone"></i> {{$menu_item->link()}}</a>&#8287;&#8287;&#8287;&#8287;&#8287;
            @elseif( $menu_item->title == 'Mail')
                <a href="mailto: {{$menu_item->link()}}"><i class="fa fa-envelope-o"></i> {{$menu_item->link()}}</a>
            @endif
        @endforeach
    </li>
    <li>
        @foreach($items as $menu_item)
            @if($menu_item->title != 'Téléphone' && $menu_item->title != 'Mail')
                <a href="{{$menu_item->link()}}"><i class="fa fa-map-marker"></i> {{$menu_item->title}}</a>&#8287;&#8287;&#8287;&#8287;&#8287;
            @endif
        @endforeach
        <a href="#"> <i class="fa fa-clock-o"></i>{{setting('site.work_time')}}</a>
    </li>
</ul>
