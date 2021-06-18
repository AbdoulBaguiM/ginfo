<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Commande Effectuée</title>

    <!-- Start Common CSS -->
    <style type="text/css">
        #outlook a {padding:0;}
        body{width:100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family: Helvetica, arial, sans-serif;}
        .ExternalClass {width:100%;}
        .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {line-height: 100%;}
        .backgroundTable {margin:0; padding:0; width:100% !important; line-height: 100% !important;}
        .main-temp table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; font-family: Helvetica, arial, sans-serif;}
        .main-temp table td {border-collapse: collapse;}
    </style>
    <!-- End Common CSS -->
</head>
<body>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="backgroundTable main-temp" style="background-color: #d5d5d5;">
    <tbody>
    <tr>
        <td>
            <table width="600" align="center" cellpadding="15" cellspacing="0" border="0" class="devicewidth" style="background-color: #ffffff;">
                <tbody>
                <!-- Start header Section -->
                <tr>
                    <td style="padding-top: 30px;">
                        <table width="560" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner" style="border-bottom: 1px solid #eeeeee; text-align: center;">
                            <tbody>
                            <tr>
                                <td style="padding-bottom: 10px;">
                                    <a href="{{route('acceuil')}}"><img src="{{asset('img/logo_mail.png')}}" alt="Logo" /></a>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; line-height: 18px; color: #666666;">
                                    +212-662-158-998
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; line-height: 18px; color: #666666;">
                                    ginfofes@gmail.com
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; line-height: 18px; color: #666666;">
                                    67, Hay Farah II, Rue Khalil - Fès
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; line-height: 18px; color: #666666; padding-bottom: 25px;">
                                    <strong>Commande N° :</strong> {{$commande->id}}| <strong>Date :</strong>
                                    {{$commande->created_at}}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <!-- End header Section -->

                <!-- Start address Section -->
                <tr>
                    <td style="padding-top: 0;">
                        <table width="560" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner" style="border-bottom: 1px solid #bbbbbb;">
                            <tbody>
                            <tr>
                                <td style="width: 55%; font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                    Adresse de Livraison
                                </td>
                                <td style="width: 45%; font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                    Informations Client
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                    {{strtoupper($commande->c_adresse)}}
                                </td>
                                <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                    {{strtoupper($commande->c_nom)}} {{strtoupper($commande->c_prenom)}}
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                    {{strtoupper($commande->c_ville)}}, {{strtoupper($commande->c_zipcode)}}
                                </td>
                                <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                    {{strtoupper($commande->c_telephone)}}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <!-- End address Section -->

                <!-- Start product Section -->
                @foreach($commande->produits()->get() as $produit)
                    <tr>
                        <td style="padding-top: 0;">
                            <table width="560" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner" style="border-bottom: 1px solid #eeeeee;">
                                <tbody>
                                    <tr>
                                        <td rowspan="4" style="padding-right: 10px; padding-bottom: 10px;">
                                            <img style="height: 80px;" src="{{asset('storage/'.$produit->photo_principale)}}" alt="Product Image" />
                                        </td>
                                        <td colspan="2" style="font-size: 14px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                            {{$produit->nom}}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 14px; line-height: 18px; color: #757575; width: 440px;">
                                            Quantité: {{$produit->pivot->quantite}}
                                        </td>
                                        <td style="width: 130px;"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 14px; line-height: 18px; color: #757575;"></td>
                                        <td style="font-size: 14px; line-height: 18px; color: #757575; text-align: right;">
                                            {{$produit->pivot->quantite}}x {{number_format($produit->prix_ht,2)}} DHS
                                        </td>
                                    </tr>
                                    {{--<tr>
                                        <td style="font-size: 14px; line-height: 18px; color: #757575; padding-bottom: 10px;"></td>
                                        <td style="font-size: 14px; line-height: 18px; color: #757575; text-align: right; padding-bottom: 10px;">
                                            <b style="color: #666666;">1,234.50 DHS</b> Total
                                        </td>
                                    </tr>--}}
                                </tbody>
                            </table>
                        </td>
                    </tr>
                @endforeach
                <!-- End product Section -->

                <!-- Start calculation Section -->
                <tr>
                    <td style="padding-top: 0;">
                        <table width="560" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner" style="border-bottom: 1px solid #bbbbbb; margin-top: -5px;">
                            <tbody>
                            <tr>
                                <td rowspan="5" style="width: 55%;"></td>
                                <td style="font-size: 14px; line-height: 18px; color: #666666;">
                                    Sous-Total:
                                </td>
                                <td style="font-size: 14px; line-height: 18px; color: #666666; width: 130px; text-align: right;">
                                    {{number_format($commande->c_subtotal,2)}} Dhs
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; line-height: 18px; color: #666666; padding-bottom: 10px; border-bottom: 1px solid #eeeeee;">
                                    Frais de Livraison
                                </td>
                                <td style="font-size: 14px; line-height: 18px; color: #666666; padding-bottom: 10px; border-bottom: 1px solid #eeeeee; text-align: right;">
{{--                                    Frais de livraison--}}
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; font-weight: bold; line-height: 18px; color: #666666; padding-top: 10px;">
                                    Total
                                </td>
                                <td style="font-size: 14px; font-weight: bold; line-height: 18px; color: #666666; padding-top: 10px; text-align: right;">
                                    {{number_format($commande->c_total,2)}} DHS
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <!-- End calculation Section -->

                <!-- Start payment method Section -->
                <tr>
                    <td style="padding: 0 10px;">
                        <table width="560" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner">
                            <tbody>
                            <tr>
                                <td colspan="2" style="font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                    Methode de Payement
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                    Bank Name:
                                </td>
                                <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                    Account Name:
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                    Bank Address:
                                </td>
                                <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                    Account Number:
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666; padding-bottom: 10px;">
                                    Bank Code:
                                </td>
                                <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666; padding-bottom: 10px;">
                                    SWIFT Code:
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 100%; text-align: center; font-style: italic; font-size: 13px; font-weight: 600; color: #666666; padding: 15px 0; border-top: 1px solid #eeeeee;">
                                    <b style="font-size: 14px;">Note:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <!-- End payment method Section -->
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>
