<div class="container pl-0 pr-0">
    <!--banner-start-->
    <div class="footer-social-icon banner-social-icon mb-0">
        <ul class="mb-0 list-unstyled">
            <li class="">
                <a href="{{ $instagram }}"><i
                        class="fab fa-instagram d-flex align-items-center justify-content-center"></i></a>
            </li>
            <li class="mt-3 mb-3">
                <a href="{{ $github }}"><i
                        class="fab fa-github d-flex align-items-center justify-content-center ml-0 mr-0"></i></a>
            </li>
            <li class="">
                <a href="{{ $linkedin }}"><i
                        class="fab fa-linkedin-in d-flex align-items-center justify-content-center"></i></a>
            </li>
        </ul>
    </div>
    <div class="banner-con text-lg-left text-center">
        <div class="row">
            <div class="col-lg-7 col-sm-12 d-flex justify-content-center flex-column">
                <div class="banner-left-con wow slideInLeft">
                    <div class="banner-heading">
                        <h2>Hello, I Am</h2>
                        <ul class="dynamic-txts">
                            <div class="wrapper">
                                <li>
                                    <h1>{{ $name }}</h1>
                                </li>
                                @foreach ($titles as $title)
                                    <li>
                                        <h1>{{ $title }}</h1>
                                    </li>
                                @endforeach
                            </div>
                        </ul>
                        <p>
                            {!! $description !!}
                        </p>
                    </div>
                    <div class="banner-btn generic-btn d-inline-block">
                        <a href="#Contact">Hire Me</a>
                    </div>
                    <a href="#Portfolio" class="See-btn">See My Work</a>
                </div>
            </div>
            <div class="col-lg-5 col-sm-12">
                <div class="banner-right-con position-relative wow slideInRight" id="banner-right-con">
                    <figure class="mb-0">
                        <img src="{{ $image_url }}" class="img-fluid" alt="{{ $name }}" id="{{ $name }}" />
                    </figure>
                    <div class="best-award-con d-inline-block wow bounceInUp" data-wow-duration="1s"
                        data-wow-delay="1s">
                        <div class="best-award-inner-con">
                            <figure class="mb-0">
                                <img src="{{ asset('image/cup-img.png') }}" alt="cup-img" class="img-fluid" />
                            </figure>
                            <div class="best-award-title">
                                <p class="mb-0">
                                    Best Design<br />
                                    Award.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="best-award-con d-inline-block happy-con wow bounceInUp" data-wow-duration="1s"
                        data-wow-delay="1s">
                        <div class="best-award-inner-con text-center">
                            <figure>
                                <img src="{{ $image_url }}"
                                    alt="Foto" class="img-fluid" width="100" height="100" />
                            </figure>
                            <div class="best-award-title d-inline-block ml-0">
                                <p class="mb-0 d-inline-block count">4</p>
                                <p class="mb-0 d-inline-block">k+</p>
                                <span class="d-block">Happy<br />
                                    Customers</span>
                            </div>
                        </div>
                    </div>
                    <div class="cursor"></div>
                    <div class="cursor2"></div>
                </div>
            </div>
        </div>
    </div>
    <!--banner-end-->
</div>
