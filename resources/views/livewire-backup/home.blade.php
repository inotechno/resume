<div>
    <!---header-and-banner-section-->
    <div class="header-and-banner-con w-100 float-left position-relative">
        <div class="header-and-banner-inner-con">
            <header class="main-header">
                <!--navbar-start-->
                @livewire('component.layout.header')
                <!--navbar-end-->
            </header>

            <section class="banner-main-con" id="home">
                @livewire('banner')
            </section>
        </div>

    </div>
    <!---header-and-banner-section-->
    <!-- service section -->
    <section class="w-100 float-left service-con padding-top padding-bottom position-relative" id="service-con">
        @livewire('service')
    </section>
    <!-- service section -->

    <!-- skill section -->
    <section class="w-100 float-left skill-con padding-top padding-bottom position-relative" id="about-con">
        @livewire('skill')
    </section>
    <!-- skill section -->

    <div>
        @livewire('portfolio')
    </div>

    <!-- portfolio section -->

    <!-- tastimonials section -->
    <section
        class="w-100 float-left padding-top padding-bottom tastimonials-con position-relative text-lg-left text-center"
        id="testimonials">
        @livewire('testimonial')
    </section>
    <!-- tastimonials section -->

    <!-- blog section -->
    <section class="w-100 float-left blog-con padding-top padding-bottom position-relative" id="blog">
        @livewire('blog')
    </section>
    <!-- blog section -->

    <!-- form section -->
    <section class="w-100 float-left form-main-con padding-top padding-bottom" id="Contact">
        @livewire('contact')
    </section>
    <!-- form section -->

    <!-- weight footer section -->
    @livewire('component.layout.footer')

    <a id="button"></a>
</div>
