<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Inscrivez-vous à notre <strong>NEWSLETTER</strong></p>
                    <form action="{{route('inscription_newsletter')}}" method="POST">
                        @csrf
                        <input class="input" name="email" type="email" value="{{auth()->user() ? auth()->user()->email : '' }}" placeholder="Entrer votre adresse mail">
                        <button class="newsletter-btn" type="submit"><i class="fa fa-envelope"></i> Inscription</button>
                    </form>
                    {{menu('social_links','partials.menu.social_links')}}
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->
