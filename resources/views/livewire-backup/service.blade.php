<div class="container">
    <div class="service-inner-con position-relative">
        <div class="generic-title text-center">
            <h6>My Expertise</h6>
            <h2 class="mb-0">
                Provide Wide Range of<br />
                Digital Services
            </h2>
        </div>
        <div class="service-box wow fadeInUp">
            <div class="row">
                @foreach ($services as $service)
                    <div class="col-lg-6 col-md-6 my-2">
                        <div class="service-box-item">
                            <figure class="mb-0">
                                <img src="{{ asset('storage/' . $service->icon_url) }}" alt="service-icon" class="img-fluid" />
                            </figure>
                            <div class="service-box-item-content">
                                <h4>{{ $service->name }}</h4>
                                <p>
                                    {{ $service->description_excerpt }}
                                </p>
                                <a href="#" data-toggle="modal" data-target="#{{ $service->slug }}">Read More</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
