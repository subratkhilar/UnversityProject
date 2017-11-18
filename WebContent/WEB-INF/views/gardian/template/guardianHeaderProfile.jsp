<section class="profile-feature">
    <div class="awe-parallax bg-profile-feature"></div>

    <div class="awe-overlay overlay-color-3"></div>

    <div class="container">
        <div class="info-author">
            <div class="image">
                <img src="${createLink(controller: 'guardian', action: 'downloadProfileImg', params: [type: com.spandhan.DocumentType.LOGO])}"
                     alt="">
            </div>

            <div class="name-author">
                <h2 class="big">${guardian?.name}</h2>
            </div>

            <div class="address-author">
                <i class="fa fa-map-marker"></i>

                <h3>${guardian?.address}</h3>
            </div>
        </div>

        %{--<div class="info-follow">--}%
            %{--<div class="trophies">--}%
                %{--<span>12</span>--}%

                %{--<p>Trophies</p>--}%
            %{--</div>--}%

            %{--<div class="trophies">--}%
                %{--<span>12</span>--}%

                %{--<p>Follower</p>--}%
            %{--</div>--}%

            %{--<div class="trophies">--}%
                %{--<span>20</span>--}%

                %{--<p>Following</p>--}%
            %{--</div>--}%

            %{--<div class="trophies">--}%
                %{--<span>$ 149,902</span>--}%

                %{--<p>Balance</p>--}%
            %{--</div>--}%
        %{--</div>--}%
    </div>
</section>