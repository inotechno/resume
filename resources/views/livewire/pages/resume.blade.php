<div class="card-inner" id="resume-card">
    <div class="card-wrap">
        <div class="content resume">

            <!-- title -->
            <div class="title">Resume</div>

            <!-- content -->
            <div class="row">

                <!-- experience -->
                @livewire('content.experience')

                <!-- education -->
                @livewire('content.education')

                <div class="clear"></div>
            </div>

        </div>

        <!--
      Skills
     -->
        <div class="content skills">

            <!-- title -->
            <div class="title">My Skills</div>

            <!-- content -->
            @livewire('content.skill')

        </div>

        <!--
      Testimonials
     -->
        <div class="content testimonials">

            <!-- title -->
            <div class="title">Testimonials</div>

            <!-- content -->
            <div class="row testimonials-items">

                <!-- client item -->
                <div class="col col-d-12 col-t-12 col-m-12 border-line-v">
                    <div class="revs-carousel default-revs">
                        <div class="owl-carousel">
                            <div class="item">
                                <div class="revs-item">
                                    <div class="text">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum
                                        dolor sit amet, consectetur adipiscing elit.
                                    </div>
                                    <div class="user">
                                        <div class="img"><img src="images/man1.jpg" alt="" />
                                        </div>
                                        <div class="info">
                                            <div class="name">Helen Floyd</div>
                                            <div class="company">Art Director</div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="revs-item">
                                    <div class="text">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum
                                        dolor sit amet, consectetur adipiscing elit.
                                    </div>
                                    <div class="user">
                                        <div class="img"><img src="images/man1.jpg" alt="" />
                                        </div>
                                        <div class="info">
                                            <div class="name">Robert Chase</div>
                                            <div class="company">CEO</div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="revs-item">
                                    <div class="text">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum
                                        dolor sit amet, consectetur adipiscing elit.
                                    </div>
                                    <div class="user">
                                        <div class="img"><img src="images/man1.jpg" alt="" />
                                        </div>
                                        <div class="info">
                                            <div class="name">Helen Floyd</div>
                                            <div class="company">Art Director</div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clear"></div>
            </div>

        </div>

    </div>
</div>
