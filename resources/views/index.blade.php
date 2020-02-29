<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Movie DB</title>

        <link rel="stylesheet" href="/css/app.css">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    </head>
    <body>
       <div id="app" class="container">
            <div class="row">
                <div class="col-12">
                    <router-view/>
                </div>
            </div>
       </div>
       <script src="/js/app.js"></script>
    </body>
</html>
