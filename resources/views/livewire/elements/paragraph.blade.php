<div>
    <p style="{{ $style }}" class="{{ $class }}">
        @if($markup)
            {!! $value !!}
        @else
            {{ $value }}
        @endif
    </p>
</div>
