 <div>
     <!-- portfolio section -->
     <section class="w-100 float-left portfolio-con padding-top" id="Portfolio">
         <div class="container">
             <div class="generic-title text-center">
                 <h6 class="text-white">Creative Works</h6>
                 <h2 class="mb-0 text-white">Check My Portfolio</h2>
             </div>
             <div id="myBtnContainer" class="text-center">
                 <button onclick="filterSelection('all')"
                     class="{{ $selectedCategory === 'all' ? 'active active_button' : '' }}">
                     All
                 </button>
                 @foreach ($categories as $category)
                     <button onclick="filterSelection('{{ $category->slug }}')"
                         class="{{ $selectedCategory === $category->slug ? 'active active_button' : '' }}">
                         {{ $category->name }}
                     </button>
                 @endforeach
             </div>
         </div>
     </section>
     <!-- portfolio section -->

     <!-- portfolio section -->
     <section class="w-100 float-left portfolio-body-con">
         <div class="container">
             <div class="portfolio-img-con position-relative w-100 float-left wow fadeInUp">

                 @foreach ($projects as $project)
                     <div class="filterDiv {{ $project->category->slug }} position-relative">
                         <a href="#" data-toggle="modal" data-target="#{{ $project->slug }}">
                             <div class="portfolio-img position-relative">
                                 <figure>
                                     <img src="{{ asset('storage/' . $project->thumbnail) }}"
                                         alt="{{ $project->title }}" class="img-fluid" />
                                 </figure>
                             </div>
                         </a>
                         <div class="portfolio-img-content text-left">
                             <div class="portfolio-img-title d-inline-block">
                                 <h4>{{ $project->title }}</h4>
                                 <p>{!! $project->description_excerpt !!}</p>
                             </div>
                             <a href="#" class="float-lg-right" data-toggle="modal"
                                 data-target="#{{ $project->slug }}-icon">
                                 <i class="fas fa-arrow-right d-flex align-items-center justify-content-center"></i>
                             </a>
                         </div>
                     </div>
                 @endforeach

                 {{--
         <div class="filterDiv cars position-relative">
             <a href="#" data-toggle="modal" data-target="#modalWPWAF">
                 <div class="portfolio-img position-relative">
                     <figure>
                         <img src="{{ asset('image/portfolio-img1.png') }}" alt="portfolio-img1" class="img-fluid" />
                     </figure>
                 </div>
             </a>
             <div class="portfolio-img-content text-left">
                 <div class="portfolio-img-title d-inline-block">
                     <h4>Application UI Design</h4>
                     <p>Dolar repellendus temporibus...</p>
                 </div>
                 <a href="#" class="float-lg-right" data-toggle="modal" data-target="#modalWPWAF-icon">
                     <i class="fas fa-arrow-right d-flex align-items-center justify-content-center"></i>
                 </a>
             </div>
         </div>
         <div class="filterDiv colors fruits position-relative">
             <a href="#" data-toggle="modal" data-target="#modalporfolio2">
                 <div class="portfolio-img position-relative">
                     <figure>
                         <img src="{{ asset('image/portfolio-img2.png') }}" alt="portfolio-img1" class="img-fluid" />
                     </figure>
                 </div>
             </a>
             <div class="portfolio-img-content text-left">
                 <div class="portfolio-img-title d-inline-block">
                     <h4>Furni furniture UI Design</h4>
                     <p>Dolar repellendus temporibus...</p>
                 </div>
                 <a href="#" class="float-lg-right" data-toggle="modal" data-target="#modalporfolio2-icon">
                     <i class="fas fa-arrow-right d-flex align-items-center justify-content-center"></i>
                 </a>
             </div>
         </div>
         <div class="filterDiv cars position-relative">
             <a href="#" data-toggle="modal" data-target="#modalporfolio3">
                 <div class="portfolio-img position-relative">
                     <figure>
                         <img src="{{ asset('image/portfolio-img3.png') }}" alt="portfolio-img1" class="img-fluid" />
                     </figure>
                 </div>
             </a>
             <div class="portfolio-img-content text-left">
                 <div class="portfolio-img-title d-inline-block">
                     <h4>Mobile UI Design</h4>
                     <p>Dolar repellendus temporibus...</p>
                 </div>
                 <a href="#" class="float-lg-right" data-toggle="modal" data-target="#modalporfolio3-icon"><i
                         class="fas fa-arrow-right d-flex align-items-center justify-content-center"></i></a>
             </div>
         </div>
         <div class="filterDiv colors position-relative">
             <a href="#" data-toggle="modal" data-target="#modalporfolio4">
                 <div class="portfolio-img position-relative">
                     <figure>
                         <img src="{{ asset('image/portfolio-img4.png') }}" alt="portfolio-img1" class="img-fluid" />
                     </figure>
                 </div>
             </a>
             <div class="portfolio-img-content text-left">
                 <div class="portfolio-img-title d-inline-block">
                     <h4>Businesscard UI Design</h4>
                     <p>Dolar repellendus temporibus...</p>
                 </div>
                 <a href="#" class="float-lg-right" data-toggle="modal" data-target="#modalporfolio4-icon"><i
                         class="fas fa-arrow-right d-flex align-items-center justify-content-center"></i></a>
             </div>
         </div>
         <div class="filterDiv cars animals position-relative">
             <a href="#" data-toggle="modal" data-target="#modalporfolio5">
                 <div class="portfolio-img position-relative">
                     <figure>
                         <img src="{{ asset('image/portfolio-img5.png') }}" alt="portfolio-img1" class="img-fluid" />
                     </figure>
                 </div>
             </a>
             <div class="portfolio-img-content text-left">
                 <div class="portfolio-img-title d-inline-block">
                     <h4>Real estate UI Design</h4>
                     <p>Dolar repellendus temporibus...</p>
                 </div>
                 <a href="#" class="float-lg-right" data-toggle="modal" data-target="#modalporfolio5-icon"><i
                         class="fas fa-arrow-right d-flex align-items-center justify-content-center"></i></a>
             </div>
         </div> --}}
             </div>
         </div>
     </section>
 </div>
