<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8" />

    <meta name="application-name" content="{{ config('app.name') }}" />
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="vCard & Resume Template" />
    <meta name="keywords" content="vcard, resposnive, resume, personal, card, cv, cards, portfolio" />
    <meta name="author" content="bslthemes" />

    <title>{{ $title ?? config('app.name') }}</title>
    <link
        href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <link rel="stylesheet" href="{{ asset('css/basic.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/layout.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/blogs.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/ionicons.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/magnific-popup.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/animate.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/owl.carousel.css') }}" />

    <link rel="stylesheet" href="{{ asset('css/gradient.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/new-skin/new-skin.css') }}" />
    <link rel="shortcut icon" href="{{ $favicon ?? asset('images/favicons/favicon.ico') }}">

	@stack('styles')
</head>

<body class="antialiased">
    {{ $slot }}

    <script src="{{asset('js/jquery.min.js') }}"></script>
	<script src="{{asset('js/jquery.validate.js') }}"></script>
	<script src="{{asset('js/jquery.magnific-popup.js') }}"></script>
	<script src="{{asset('js/imagesloaded.pkgd.js') }}"></script>
	<script src="{{asset('js/isotope.pkgd.js') }}"></script>
	<script src="{{asset('js/jquery.slimscroll.js') }}"></script>
	<script src="{{asset('js/owl.carousel.js') }}"></script>
	<script src="{{asset('js/typed.js') }}"></script>
	<script src="https://use.fontawesome.com/8da76d029b.js"></script>

	<script src="{{asset('js/scripts.js') }}"></script>
	{{-- <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap"></script> --}}
	@stack('scripts')
</body>

</html>
