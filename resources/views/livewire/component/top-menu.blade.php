<div class="top-menu">
    <ul>

        @if (!$hidden)
            <li class="active">
                <a href="#about-card">
                    <span class="icon ion-person"></span>
                    <span class="link">About</span>
                </a>
            </li>
            <li>
                <a href="#resume-card">
                    <span class="icon ion-android-list"></span>
                    <span class="link">Resume</span>
                </a>
            </li>
            <li>
                <a href="#works-card">
                    <span class="icon ion-paintbrush"></span>
                    <span class="link">Works</span>
                </a>
            </li>
            {{-- <li>
            <a href="#blog-card">
                <span class="icon ion-chatbox-working"></span>
                <span class="link">Blog</span>
            </a>
        </li> --}}
            <li>
                <a href="#contacts-card">
                    <span class="icon ion-at"></span>
                    <span class="link">Contact</span>
                </a>
            </li>
        @else
            <li class="active">
                <a href="{{ route('home') }}">
                    <span class="icon ion-home"></span>
                    <span class="link">Home</span>
                </a>
            </li>
        @endif

    </ul>
</div>
