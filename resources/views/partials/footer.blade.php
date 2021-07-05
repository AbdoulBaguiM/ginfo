<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">À Propos</h3>
                        {{menu('Informations','partials.menu.informations_footer')}}
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Navigation</h3>
                        {{menu('navigation','partials.menu.footer_links')}}
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Informations</h3>
                        <ul class="footer-links">
                            <li><a href="{{route('qui_sommes_nous')}}">Qui sommes-nous ?</a></li>
                            <li><a href="{{route('contactez-nous')}}">Contactez-nous</a></li>
                            <li><a href="{{route('voir_termes_et_conditions')}}">Termes & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Services</h3>
                        <ul class="footer-links">
                            <li><a href="{{route('modifier_mon_profil')}}">Mon Compte</a></li>
                            <li><a href="{{route('voir_panier')}}">Voir le Panier</a></li>
                            <li><a href="#">Liste d'envie</a></li>
                            <li><a href="{{route('contactez-nous')}}">Besoin d'aide</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
								Copyright &copy; GINFO <script>document.write(new Date().getFullYear());</script> Tous droits réservés
							</span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->
