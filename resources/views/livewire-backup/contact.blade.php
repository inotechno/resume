 <div class="container">
     <div class="form-main-inner-con position-relative">
         <div class="generic-title text-center">
             <h6>Get in Touch</h6>
             <h2 class="mb-0">
                 Any Questions? Feel Free<br />
                 to Contact
             </h2>
         </div>
         <div class="row">
             <div class="col-lg-4 order-lg-0 order-2">
                 <div class="contact-information position-relative wow slideInLeft">
                     <ul class="list-unstyled">
                         <li>
                             <figure class="mb-0 d-flex align-items-center justify-content-center">
                                 <img src="{{ asset('image/location-icon.png') }}" alt="location-icon"
                                     class="img-fluid" />
                             </figure>
                             <div class="contact-information-content">
                                 <h5>Address:</h5>
                                 <p class="mb-0">
                                     121 King Street Melbourne, 3000, Australia
                                 </p>
                             </div>
                         </li>
                         <li>
                             <figure class="mb-0 d-flex align-items-center justify-content-center">
                                 <img src="{{ asset('image/message-icon.png') }}" alt="message-icon"
                                     class="img-fluid" />
                             </figure>
                             <div class="contact-information-content">
                                 <h5>Email:</h5>
                                 <p class="mb-0">Info@folioflix.com</p>
                                 <p class="mb-0">folioflix@gmail.com</p>
                             </div>
                         </li>
                         <li class="mb-0">
                             <figure class="mb-0 d-flex align-items-center justify-content-center">
                                 <img src="{{ asset('image/phone-icon.png') }}" alt="phone-icon" class="img-fluid" />
                             </figure>
                             <div class="contact-information-content">
                                 <h5>Phone:</h5>
                                 <p class="mb-0">+61 3 8376 6284</p>
                                 <p class="mb-0">+800 2345 6789</p>
                             </div>
                         </li>
                     </ul>
                 </div>
             </div>
             <div class="col-lg-8">
                 <div id="form_result"></div>

                 <form id="contactpage" method="POST" class="contact-form wow slideInRight text-lg-left text-center">
                     <div class="row">
                         <div class="col-lg-6 col-md-6">
                             <div class="form-group mb-0">
                                 <input type="text" placeholder="Name" name="name" id="name"
                                     autocomplete="off" required />
                             </div>
                         </div>
                         <div class="col-lg-6 col-md-6">
                             <div class="form-group mb-0">
                                 <input type="email" id="emailHelp" name="emailHelp" placeholder="Email"
                                     autocomplete="off" required />
                                 <small class="form-text text-muted"></small>
                             </div>
                         </div>
                         <div class="col-lg-6 col-md-6">
                             <div class="form-group mb-0">
                                 <input type="tel" placeholder="Phone" name="phone" id="phone" required />
                             </div>
                         </div>
                         <div class="col-lg-6 col-md-6">
                             <div class="form-group mb-0">
                                 <input type="text" name="subject" placeholder="Subject" id="subject" />
                             </div>
                         </div>
                     </div>
                     <div class="row">
                         <div class="col-lg-12">
                             <div class="form-group mb-0">
                                 <textarea placeholder="Message" rows="3" name="comments" id="comments"></textarea>
                             </div>
                         </div>
                     </div>
                     <button type="submit" id="submit" class="appointment-btn">
                         Submit
                     </button>
                 </form>
             </div>
         </div>
     </div>
 </div>
