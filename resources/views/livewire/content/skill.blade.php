<div class="row">

    <div class="col col-d-12 col-t-12 col-m-12 border-line-h">
        <div class="skills-list circles">
            <div class="skill-title">
                <div class="icon"><i class="fa fa-code"></i></div>
                <div class="name">Coding</div>
            </div>
            <ul>
                @foreach ($codingSkills as $skill)
                    <li>
                        <div class="name">{{ $skill->name }}</div>
                        <div class="progress p{{ $skill->percentage }}">
                            <span>{{ $skill->percentage }}%</span>
                        </div>
                    </li>
                @endforeach
            </ul>
        </div>
    </div>

    <!-- skill item -->
    <div class="col col-d-6 col-t-6 col-m-12 border-line-v">
        <div class="skills-list">
            <div class="skill-title border-line-h">
                <div class="icon"><i class="fa fa-paint-brush"></i></div>
                <div class="name">Software & Tool</div>
            </div>
            <ul>
                @foreach ($toolSkills as $skill)
                    <li class="border-line-h">
                        <div class="name">{{ $skill->name }}</div>
                        <div class="progress">
                            <div class="percentage" style="width:{{ $skill->percentage }}%;"></div>
                        </div>
                    </li>
                @endforeach
            </ul>
        </div>
    </div>

    <!-- skill item -->
    <div class="col col-d-6 col-t-6 col-m-12 border-line-v">
        <div class="skills-list list">
            <div class="skill-title border-line-h">
                <div class="icon"><i class="fa fa-list"></i></div>
                <div class="name">Knowledge</div>
            </div>
            <ul>
                @foreach ($knowledgeSkills as $skill)
                    <li>
                        <div class="name">{{ $skill->name }}</div>
                    </li>
                @endforeach
            </ul>
        </div>
    </div>

    {{-- <div class="col col-d-6 col-t-6 col-m-12 border-line-v">
        <div class="skills-list dotted">
            <div class="skill-title border-line-h">
                <div class="icon"><i class="fa fa-flag"></i></div>
                <div class="name">Languages</div>
            </div>
            <ul>
                <li class="border-line-h">
                    <div class="name">English</div>
                    <div class="progress">
                        <div class="percentage" style="width:90%;"></div>
                    </div>
                </li>
                <li class="border-line-h">
                    <div class="name">German</div>
                    <div class="progress">
                        <div class="percentage" style="width:60%;"></div>
                    </div>
                </li>
                <li class="border-line-h">
                    <div class="name">Italian</div>
                    <div class="progress">
                        <div class="percentage" style="width:30%;"></div>
                    </div>
                </li>
                <li>
                    <div class="name">French</div>
                    <div class="progress ">
                        <div class="percentage" style="width:70%;"></div>
                    </div>
                </li>
            </ul>
        </div>
    </div> --}}
    <div class="clear"></div>
</div>
