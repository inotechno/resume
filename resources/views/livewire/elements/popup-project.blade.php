    <div id="project-popup" class="popup-box mfp-fade mfp-hide">
        @if ($project)
            <div class="content">
                <div class="image">
                    <img src="{{ asset('storage/' . $project->image_url) }}" alt="">
                </div>
                <div class="desc">
                    <div class="post-box">
                        <h1>{{ $project->title }}</h1>
                        <div class="blog-detail">{{ $project->category->name }}</div>
                        <div class="blog-content">
                            <p>{!! $project->description !!}</p>
                        </div>

                        {{-- Gunakan ICON untuk website, github --}}
                        @if ($project->project_url)
                            <a href="{{ $project->project_url }}" target="_blank" class="button">
                                <span class="fa fa-globe"></span>
                                <span class="text">View Project</span>
                            </a>
                        @endif
                        @if ($project->github)
                            <a href="{{ $project->github }}" target="_blank" class="button">
                                <span class="fa fa-github"></span>
                                <span class="text">View Code</span>
                            </a>
                        @endif
                    </div>
                </div>
            </div>
        @else
            <div class="content">
                {{-- Tampilkan konten default atau pesan "Loading..." --}}
                <p class="text-center">Loading...</p>
            </div>
        @endif

        @push('scripts')
            <script>
                document.addEventListener('livewire:init', function() {
                    Livewire.on('openPopup', function() {
                        setTimeout(() => {
                            const popupEl = document.querySelector('#project-popup');
                            if (!popupEl) {
                                console.error('Popup element not found!');
                                return;
                            }

                            $.magnificPopup.open({
                                items: {
                                    src: '#project-popup',
                                    type: 'inline'
                                },
                                callbacks: {
                                    close: function() {
                                        @this.set('project', null);
                                    }
                                }
                            });
                        }, 100);
                    });

                });
            </script>
        @endpush
    </div>
