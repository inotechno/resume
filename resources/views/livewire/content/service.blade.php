 <div class="content services">

     <!-- title -->
     <div class="title">My Services</div>

     <!-- content -->
     <div class="row service-items border-line-v">
         @foreach ($services as $service)
             <!-- service item -->
             <div class="col col-d-6 col-t-6 col-m-12 border-line-h">
                 <div class="service-item">
                     <img src="{{ asset('storage/' . $service->icon_url) }}" alt="service-icon" class="img-fluid" width="50" />
                     <div class="name">
                         <span>
                             {{ $service->name }}
                         </span>
                     </div>
                     <div class="desc">
                         <div>
                             @livewire('elements.paragraph', [
                                 'value' => $service->description_excerpt,
                             ])
                         </div>
                     </div>
                 </div>
             </div>
         @endforeach
     </div>
     <div class="clear"></div>

 </div>
