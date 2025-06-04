<div>
    <div class="title">{{ $personal['name'] }}</div>
    <div class="subtitle subtitle-typed">
        <div class="typing-title">
            @foreach ($positions as $position)
                <p>{{ $position }}</p>
            @endforeach
        </div>
    </div>
</div>
