<div class="card-inner" id="works-card">
    <div class="card-wrap">
        <div class="content works">
            <!-- title -->
            <div class="title">Recent Works</div>

            <!-- filters -->
            <div class="filter-menu filter-button-group">
                <div class="f_btn active">
                    <label><input type="radio" name="fl_radio" value="grid-item" />All</label>
                </div>
                @foreach ($categories as $category)
                    <div class="f_btn">
                        <label><input type="radio" name="fl_radio"
                                value="{{ $category->slug }}" />{{ $category->name }}</label>
                    </div>
                @endforeach
            </div>

            <!-- content -->
            <div class="row grid-items border-line-v">
                @foreach ($projects as $project)
                    <div class="col col-d-6 col-t-6 col-m-12 grid-item {{ $project->category->slug }} border-line-h border-line">
                        <div class="box-item">
                            <div class="image">
                                <a href="#" class="has-popup-media"
                                    wire:click="$dispatch('showProject', { projectId: '{{ $project->id }}' })">
                                    <img src="{{ asset('storage/' . $project->thumbnail) }}" alt="" />
                                    <span class="info">
                                        <span class="ion ion-images"></span>
                                    </span>
                                </a>
                            </div>
                            <div class="desc">
                                <a href="#" class="name has-popup-media"
                                    wire:click="$dispatch('showProject', { projectId: {{ $project->id }} })">{{ $project->title }}</a>
                                <div class="category">{{ $project->category->name }}</div>
                            </div>
                        </div>
                    </div>

                    <div class="clear"></div>
                @endforeach
            </div>
        </div>
    </div>

    <!-- Tambahkan komponen popup di sini -->
    @livewire('elements.popup-project')
</div>
