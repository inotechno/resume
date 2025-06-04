<div class="skills-container">
    <div class="skills-header">
        <h6>My Skills</h6>
        <h2 class="mb-0">
            Hover To See Skill Level
        </h2>
    </div>

    <div class="skills-grid" id="skillsGrid">
        @foreach ($skills as $skill)
            <div class="skill-item" style="--index: {{ $loop->index }}">
                <div class="skill-icon"
                    style="background-color: {{ $skill->color }};">
                    @if ($skill->icon_url && file_exists(public_path('storage/' . $skill->icon_url)))
                        <img src="{{ asset('storage/' . $skill->icon_url) }}" alt="{{ $skill->name }}" width="30"
                            height="30">
                    @else
                        <span class="skill-fallback">{{ strtoupper(substr($skill->name, 0, 1)) }}</span>
                    @endif
                </div>
                <div class="skill-title">{{ $skill->name }}</div>
                <div class="skill-percentage" style="color: #ff6b6b;">{{ $skill->percentage }}%</div>
            </div>
        @endforeach
    </div>

    @if ($loadMore)
        <button wire:click="loadMoreSkills" class="load-more-btn">Load More</button>
    @endif

    @push('js')
    <script>
        // Scroll to data next After click load more
        $('.load-more-btn').click(function() {
            $('html, body').animate({
                scrollTop: $('#skillsGrid').offset().top
            }, 1000);
        });
    </script>
    @endpush
</div>
