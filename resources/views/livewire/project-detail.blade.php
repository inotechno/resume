<div class="page new-skin">

    <!-- preloader -->
    @livewire('component.preloader')

    <!-- background -->
    @livewire('component.background')

    <div class="container opened" data-animation-in="fadeInLeft" data-animation-out="fadeOutLeft">
        <header class="header">

            <!-- header profile -->
            @livewire('component.header-profile')

            <!-- menu -->
            @livewire('component.top-menu', ['hidden' => true])

        </header>

        <div class="card-started" id="home-card">
            <div class="profile no-photo">

                <!-- profile image -->
                @livewire('component.photo-profile')

                <!-- profile titles -->
                @livewire('component.title')

                <!-- profile socials -->
                @livewire('component.social')

                <!-- profile buttons -->
                @livewire('component.buttons')

            </div>

        </div>

        @livewire('pages.project-detail', ['slug' => $slug])

    </div>

    @push('styles')
        <link rel="stylesheet" href="{{ asset('css/demos/demo-' . $colorNumber . '-colors.css') }}" />

        @if ($darkMode)
            <link rel="stylesheet" href="{{ asset('css/template-dark/dark.css') }}" />
        @endif

        <link rel="shortcut icon" href="{{ $favicon ?? asset('images/favicons/favicon.ico') }}">

    @endpush

</div>
