<div class="card-inner contacts" id="contacts-card">
    <div class="card-wrap">

        <div class="content contacts">

            <div class="title">Get in Touch</div>

            <div class="row">
                <div class="col col-d-12 col-t-12 col-m-12 border-line-v">
                    @livewire('elements.map-frame', ['style' => 'margin-bottom: 20px;'])
                    <div class="info-list">
                        <ul>
                            <li>
                                @livewire('elements.text', ['value' => 'Address . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $address, 'style' => 'font-size:15px;'])
                            </li>
                            <li>
                                @livewire('elements.text', ['value' => 'Email . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $email, 'style' => 'font-size:15px;'])
                            </li>
                            <li>
                                @livewire('elements.text', ['value' => 'Phone . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $phone, 'style' => 'font-size:15px;'])
                            </li>
                            <li>
                                @livewire('elements.text', ['value' => 'Whatsapp . . . . .', 'strong' => true]) @livewire('elements.link', ['value' => '6289676490971', 'href' => $whatsapp, 'target' => '_blank', 'style' => 'font-size:15px;'])
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>

        </div>

        @livewire('content.contact-form')

    </div>
</div>
