<h2>Informations de contact</h2>
@foreach($items as $menu_item)
        <p>
            @if($menu_item->title == 'Téléphone')
               <a href="tel:{{$menu_item->link()}}"><i class="fa fa-phone"></i> {{$menu_item->link()}}</a>
            @elseif( $menu_item->title == 'Mail')
                <a href="mailto: {{$menu_item->link()}}"><i class="fa fa-envelope-o"></i> {{$menu_item->link()}}</a>
            @else
                <a href="{{$menu_item->link()}}"><i class="fa fa-map-marker"></i> {{$menu_item->title}}</a>
            @endif
        </p>
@endforeach

