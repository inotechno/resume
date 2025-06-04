<div class="col col-d-12 col-t-12 col-m-12 border-line-v">
    <div class="resume-title border-line-h">
        <div class="icon"><i class="fa fa-briefcase"></i></div>
        <div class="name">Experience</div>
    </div>
    <div class="resume-items">
        @foreach ($experiences as $experience)
            @livewire('elements.resume-item', [
                'start_date' => $experience->start_date,
                'end_date' => $experience->end_date,
                'name' => $experience->position,
                'company' => $experience->company,
                'content' => $experience->content,
                'active' => $experience->is_current,
                'last' => $loop->last,
            ])
        @endforeach
    </div>
</div>
