<?php

function getStockLevel($quantite)
{
    if ($quantite > setting('site.stock_threshold'))
        $stockQ = '<span style="color: forestgreen">En Stock</span>';
    elseif ($quantite <= setting('site.stock_threshold') && $quantite > 0)
        $stockQ = '<span style="color: orange">Stock Faible</span>';
    else
        $stockQ = '<span style="color: red">Epuisé</span>';

    return $stockQ;
}
