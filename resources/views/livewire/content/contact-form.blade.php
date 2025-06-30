<div class="content contacts">

    <div class="title">Contact Form</div>

    <div class="row">
        <div class="col col-d-12 col-t-12 col-m-12 border-line-v">
            <div class="contact_form" wire:ignore.self>
                <form id="cc-form">
                    <div class="row">
                        <div class="col col-d-6 col-t-6 col-m-12">
                            <div class="group-val">
                                <input type="text" name="name" placeholder="Full Name" wire:model="name" class="form-control" />

                                @error('name')
                                    <span class="error" style="color: goldenrod;font-size:12px;font-style: italic;">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col col-d-6 col-t-6 col-m-12">
                            <div class="group-val">
                                <input type="text" name="email" placeholder="Email Address" wire:model="email" class="form-control" />
                                @error('email')
<span class="error" style="color: goldenrod;font-size:12px;font-style: italic;">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col col-d-12 col-t-12 col-m-12">
                            <div class="group-val">
                                <textarea name="message" placeholder="Your Message" wire:model="message"></textarea>

                                @error('message')
                                    <span class="error" style="color: goldenrod;font-size:12px;font-style: italic;">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="align-left">
                        <button type="button" class="button" wire:click="submitForm">
                            <span class="text">Send Message</span>
                            <span class="arrow"></span>
                        </button>
                    </div>
                </form>
                <div class="alert-success">
                    <p>{{ $alertMessage }}</p>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    @push('scripts')
        <script>
            window.addEventListener('showAlert', event => {
                console.log('showAlert event received');
                console.log(event.detail.message)
                $('#cc-form').fadeOut();
                $('.alert-success').delay(1000).fadeIn();
            });
        </script>
    @endpush

</div>
