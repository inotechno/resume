<div class="card-inner blog blog-post animated active" id="blog-card">
    <div class="card-wrap">

        <!--
      Blog Single
     -->
        <div class="content blog-single">

            <!-- title -->
            <div class="title">Project Detail</div>

            <!-- content -->
            <div class="row border-line-v">
                <div class="col col-m-12 col-t-12 col-d-12">
                    <div class="post-box">

                        <!-- blog detail -->
                        <h1 class="h-title">{{ $project->title }}</h1>
                        <div class="blog-detail">
                            <span class="date">{{ $project->created_at }}</span>
                            <span class="cat-links">{{ $project->category->name }}</span>
                            <span class="byline"> by <span class="author"><a
                                        href="#">{{ $name }}</a></span></span>
                        </div>

                        <!-- blog image -->
                        <div class="blog-image">
                            <img src="{{ asset('storage/' . $project->image_url) }}" alt="">
                        </div>

                        <!-- blog content -->
                        <div class="blog-content">
                            <p>{!! $project->description !!}</p>


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

                        <div class="post-text-bottom">
                            <div class="social-share">
                                <span>Share</span>

                                <a class="share-btn share-btn-twitter" title="Share on Twitter"><i
                                        class="ion ion-social-twitter"></i></a>
                                <a class="share-btn share-btn-linkedin" title="Share on Linkedin"><i
                                        class="ion ion-social-linkedin"></i></a>
                                <a class="share-btn share-btn-reddit" title="Share on Reddit"><i
                                        class="ion ion-social-reddit"></i></a>
                                <a class="share-btn share-btn-pinterest" title="Share on Pinterest"><i
                                        class="ion ion-social-pinterest"></i></a>
                            </div>
                            <span class="tags-links">Taggs:
                                @foreach ($project->tags as $tag)
                                    <a href="#">{{ $tag }}</a>
                                @endforeach
                            </span>
                        </div>

                    </div>
                </div>
            </div>

            <nav class="navigation post-navigation">
                <div class="nav-links">
                    <div class="nav-previous">
                        @if ($prevProject)
                            <a href="{{ route('project.detail', $prevProject->slug) }}"><span
                                    class="post-nav-next post-nav-text">Prev</span></a>
                        @endif
                    </div>
                    <div class="nav-next">
                        @if ($nextProject)
                            <a href="{{ route('project.detail', $nextProject->slug) }}"><span
                                    class="post-nav-prev post-nav-text">Next</span></a>
                        @endif
                    </div>
                </div>
            </nav>

            {{-- <div class="post-comments">
                <div class="title">
                    <div class="title_inner">3 Comments</div>
                </div>
                <div class="row border-line-v comments-row">
                    <div class="col col-m-12 col-t-12 col-d-12">
                        <ul class="comments">
                            <li class="comment post-comment">
                                <div class="comment">
                                    <div class="comment-image image">
                                        <img src="images/man1.jpg" class="avatar" height="80" width="80"
                                            alt="" />
                                    </div>
                                    <div class="comment-desc desc">
                                        <div class="comment-name name">
                                            <span class="comment-author">John Doe</span>
                                            <span class="comment-time">8:16 pm</span>
                                            <span class="comment-date">April 28, 2020</span>
                                            <span class="comment-reply">
                                                <a class="comment-reply-link" href="#">Reply</a>
                                            </span>
                                        </div>
                                        <div class="comment-text">
                                            <p>An has alterum nominavi. Nam at elitr veritus voluptaria. Cu eum regione
                                                tacimates vituperatoribus, ut mutat delenit est.</p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <ul class="children">
                                <li class="comment post-comment">
                                    <div class="comment">
                                        <div class="comment-image image">
                                            <img src="images/man1.jpg" class="avatar" height="80" width="80"
                                                alt="" />
                                        </div>
                                        <div class="comment-desc desc">
                                            <div class="comment-name name">
                                                <span class="comment-author">John Doe</span>
                                                <span class="comment-time">8:16 pm</span>
                                                <span class="comment-date">April 28, 2020</span>
                                                <span class="comment-reply">
                                                    <a class="comment-reply-link" href="#">Reply</a>
                                                </span>
                                            </div>
                                            <div class="comment-text">
                                                <p>An has alterum nominavi. Nam at elitr veritus voluptaria. Cu eum
                                                    regione tacimates vituperatoribus, ut mutat delenit est.</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <li class="comment post-comment">
                                <div class="comment">
                                    <div class="comment-image image">
                                        <img src="images/man1.jpg" class="avatar" height="80" width="80"
                                            alt="" />
                                    </div>
                                    <div class="comment-desc desc">
                                        <div class="comment-name name">
                                            <span class="comment-author">John Doe</span>
                                            <span class="comment-time">8:16 pm</span>
                                            <span class="comment-date">April 28, 2020</span>
                                            <span class="comment-reply">
                                                <a class="comment-reply-link" href="#">Reply</a>
                                            </span>
                                        </div>
                                        <div class="comment-text">
                                            <p>An has alterum nominavi. Nam at elitr veritus voluptaria. Cu eum regione
                                                tacimates vituperatoribus, ut mutat delenit est.</p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="post-comments">
                <div class="title">Leave a Comment</div>
                <div class="row border-line-v">
                    <div class="col col-m-12 col-t-12 col-d-12">
                        <div class="post-box">
                            <form id="cform" method="post">
                                <div class="row">
                                    <div class="col col-d-12 col-t-12 col-m-12">
                                        <div class="group-val">
                                            <input type="text" name="name" placeholder="Full Name" />
                                        </div>
                                    </div>
                                    <div class="col col-d-12 col-t-12 col-m-12">
                                        <div class="group-val">
                                            <textarea name="message" placeholder="Your Message"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="align-left">
                                    <a href="#" class="button" onclick="$('#cform').submit(); return false;">
                                        <span class="text">Add Comment</span>
                                        <span class="arrow"></span>
                                    </a>
                                </div>
                            </form>
                            <div class="alert-success">
                                <p>Thanks, your message is sent successfully.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div> --}}

        </div>

    </div>
</div>
