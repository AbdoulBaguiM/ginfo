<ul class="newsletter-follow">
    @foreach($items as $menu_item)
        <li><a href="{{$menu_item->link()}}"><i class="fa fa-{{$menu_item->title}}"></i></a></li>
    @endforeach
</ul>
