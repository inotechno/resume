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
            @livewire('component.top-menu')

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

        @livewire('pages.about')

        @livewire('pages.resume')

        @livewire('pages.work')

        {{-- @livewire('pages.blog') --}}

        @livewire('pages.contact')

    </div>

    <div class="s_overlay"></div>
    <div class="content-sidebar">
        <div class="sidebar-wrap search-form">
            <aside id="secondary" class="widget-area">
                <section id="search-2" class="widget widget_search">
                    <label>
                        <span class="screen-reader-text">Search for:</span>
                        <input type="search" class="search-field" placeholder="Search …" value="" name="s">
                    </label>
                    <input type="submit" class="search-submit" value="Search">
                </section>
                <section class="widget widget_recent_entries">
                    <h2 class="widget-title">
                        <span class="widget-title-span"><span class="first-word">Recent</span> Posts</span>
                    </h2>
                    <ul>
                        <li>
                            <a href="#">Creativity Is More Than</a>
                        </li>
                        <li>
                            <a href="#">Designing the perfect</a>
                        </li>
                        <li>
                            <a href="#">Music Player Design</a>
                        </li>
                        <li>
                            <a href="#">A Song And Dance Act</a>
                        </li>
                        <li>
                            <a href="#">By spite about do of allow</a>
                        </li>
                    </ul>
                </section>
                <section class="widget widget_recent_comments">
                    <h2 class="widget-title">
                        <span class="widget-title-span"><span class="first-word">Recent</span> Comments</span>
                    </h2>
                    <ul>
                        <li class="recentcomments">
                            <span class="comment-author-link">JOHN SMITH</span> on <a href="#">Creativity Is
                                More Than</a>
                        </li>
                        <li class="recentcomments">
                            <span class="comment-author-link">ADAM SMITH</span> on <a href="#">Creativity Is
                                More Than</a>
                        </li>
                        <li class="recentcomments">
                            <span class="comment-author-link">admin</span> on <a href="#">Designing the
                                perfect</a>
                        </li>
                        <li class="recentcomments">
                            <span class="comment-author-link">admin</span> on <a href=#">Designing the perfect</a>
                        </li>
                        <li class="recentcomments">
                            <span class="comment-author-link">James</span> on <a href="#">Designing the
                                perfect</a>
                        </li>
                    </ul>
                </section>
                <section class="widget widget_archive">
                    <h2 class="widget-title">
                        <span class="widget-title-span">
                            <span class="first-letter">Archives</span>
                        </span>
                    </h2>
                    <ul>
                        <li>
                            <a href="#">November 2018</a>
                        </li>
                    </ul>
                </section>
                <section class="widget widget_categories">
                    <h2 class="widget-title">
                        <span class="widget-title-span"><span class="first-letter">Categories</span></span>
                    </h2>
                    <ul>
                        <li class="cat-item cat-item-2">
                            <a href="#">Design</a>
                        </li>
                        <li class="cat-item cat-item-3">
                            <a href="#">Music</a>
                        </li>
                    </ul>
                </section>
                <section class="widget widget_meta">
                    <h2 class="widget-title">
                        <span class="widget-title-span"><span class="first-letter">Meta</span></span>
                    </h2>
                    <ul>
                        <li><a href="#">Log in</a></li>
                        <li><a href="#">Entries feed</a></li>
                        <li><a href="#">Comments feed</a></li>
                        <li><a href="#">WordPress.org</a></li>
                    </ul>
                </section>
            </aside>
        </div>
        <span class="close"></span>
    </div>

    @push('styles')
        <link rel="stylesheet" href="{{ asset('css/demos/demo-' . $colorNumber . '-colors.css') }}" />

        @if ($darkMode)
            <link rel="stylesheet" href="{{ asset('css/template-dark/dark.css') }}" />
        @endif

        <link rel="shortcut icon" href="{{ $favicon ?? asset('images/favicons/favicon.ico') }}">

    @endpush

</div>
