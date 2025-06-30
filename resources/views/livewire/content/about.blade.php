<div class="content about">

    <!-- title -->
    <div class="title">About Me</div>

    <!-- content -->
    <div class="row">
        <div class="col col-d-6 col-t-6 col-m-12 border-line-v">
            <div class="text-box">
                @livewire('elements.paragraph', [
                    'markup' => true,
                    'value' => $personal['description'],
                ])
            </div>
        </div>
        <div class="col col-d-6 col-t-6 col-m-12 border-line-v">
            <div class="info-list">
                <ul>
                    <li>@livewire('elements.text', ['value' => 'Age . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $age, 'style' => 'font-size:15px;'])</li>
                    <li>@livewire('elements.text', ['value' => 'Gender . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $gender, 'style' => 'font-size:15px;'])</li>
                    <li>@livewire('elements.text', ['value' => 'Date of Birth . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $dateOfBirth, 'style' => 'font-size:15px;'])</li>
                    <li>@livewire('elements.text', ['value' => 'Place of Birth . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $placeOfBirth, 'style' => 'font-size:15px;'])</li>
                    <li>@livewire('elements.text', ['value' => 'Nationality . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $nationality, 'style' => 'font-size:15px;'])</li>
                    <li>@livewire('elements.text', ['value' => 'Religion . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $religion, 'style' => 'font-size:15px;'])</li>
                    <li>@livewire('elements.text', ['value' => 'Marital Status . . . . .', 'strong' => true]) @livewire('elements.text', ['value' => $maritalStatus, 'style' => 'font-size:15px;'])</li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>

</div>
