<div class="col col-d-12 col-t-12 col-m-12 border-line-v">
    <div class="resume-title border-line-h">
        <div class="icon"><i class="fa fa-university"></i></div>
        <div class="name">Education</div>
    </div>
    <div class="resume-items">
        @foreach ($educations as $education)
            @livewire('elements.resume-item', [
                'start_date' => $education->start_date,
                'end_date' => $education->end_date,
                'name' => $education->degree,
                'company' => $education->name,
                'active' => $education->is_current,
                'last' => $loop->last,
            ])
        @endforeach
    </div>
</div>
