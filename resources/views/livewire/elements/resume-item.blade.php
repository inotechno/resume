<div class="resume-item {{ $last ? 'last' : 'border-line-h' }} {{ $active ? 'active' : '' }}">
    <div class="date">{{ $start_date }} - {{ $active ? 'Present' : $end_date }}</div>
    <div class="name">{{ $name }}</div>
    <div class="company">{{ $company }}.</div>

    @isset($content)
        {!! $content !!}
    @endisset
</div>
