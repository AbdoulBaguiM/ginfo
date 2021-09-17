<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <table>
                <tr>
                    <!-- L'élément "#mon-chart" où placer le chart -->
                    <td style="padding: 10px"><div id="mon-chart-1" style="width: 600px;height: 500px"></div></td>
                    <td style="padding: 10px"> <div id="mon-chart-3" style="width: 600px; height: 500px;"></div></td>
                </tr>
                <tr>
                    <td style="padding: 10px"><div id="mon-chart-2" style="width: 600px;height: 500px;"></div></td>
                    <td style="padding: 10px"><div id="mon-chart-4" style="width: 600px;height: 500px"></div></td>
                </tr>
            </table>

        </div>
    </div>
</div>

<script type="text/javascript" src="{{asset('js/loader.js')}}"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Catégories', 'Produits'],
            @foreach ($categorie_produits as $category) // On parcourt les catégories
            [ "{{ $category->nom }}", {{ $category->produits->count() }} ], // Proportion des produits de la catégorie
            @endforeach
        ]);

        var options = {
            title: 'Proportion des produits par catégorie', // Le titre
            pieHole: 0.4,
        };

        // On crée le chart en indiquant l'élément où le placer "#mon-chart"
        var chart = new google.visualization.PieChart(document.getElementById('mon-chart-1'));

        // On désine le chart avec les données et les options
        chart.draw(data, options);
    }
</script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Catégorie', 'Produits', 'Ventes' ],
            @foreach ($categories as $category) // On parcourt les catégories
            [ '{{ $category->nom }}', {{ $category->produits->count() }}, {{ $category->commandes->count() }} ],
            @endforeach
        ]);

        var options = {
            chart: {
                title: 'Performance Catégories - Produits - Ventes',
                subtitle: 'Produits, Ventes pour chaque catégorie',
            },
            bars: 'vertical' // Direction "verticale" pour les bars
        };

        var chart = new google.charts.Bar(document.getElementById('mon-chart-2'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
</script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);

    function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
        ['Villes', 'Commandes'],
                @foreach($ventes as $key => $item)
                    [  "{{$key}}" ,{{$item->count()}}],
                @endforeach
        ]);


        var options = {
            title : 'Ventes par villes',
            hAxis: {title: 'Villes'},
            seriesType: 'bars',
            series: {5: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('mon-chart-3'));
        chart.draw(data, options);
    }
</script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Villes', 'Clients'],
            @foreach ($clients as $key => $client)
                @if(!empty($key))
                    [ "{{ $key }}", {{ $client->count() }} ],
                @endif
            @endforeach
        ]);

        var options = {
            title: 'Proportion de clients par ville',
        };

        // On crée le chart en indiquant l'élément où le placer "#mon-chart"
        var chart = new google.visualization.PieChart(document.getElementById('mon-chart-4'));

        // On désine le chart avec les données et les options
        chart.draw(data, options);
    }
</script>

