<html>
<head>
    <meta name="layout" content="principal">
    <title>Asset Management</title>
    <style>
    .circle {
        margin-top: 20px;
        padding-top: 30px;
        width: 150px;
        height: 150px;
        border-radius: 250px;
        font-size: 18px;
        border: 1px solid #175690;
        color: black;
        line-height: 30px;
        text-align: center;
        background: white;
    }

    .circle:hover {
        box-shadow: 1px 1px 5px;
    }

    @media screen and (max-width: 540px) {
        .categories-content .content [class*="col-"],
        .course-concern [class*="col-"] {
            width: 50% !important;
            float: right;
        }
    }

    @media (min-width: 768px) {
        .col-sm-4 {
            width: 24.333333%;
        }
    }
    </style>

</head>

<body>

<section id="course-concern" class="course-concern">
    <div class="container">
        <div class="row">
            <div class="col-md-1"></div>

            <div class="col-md-10">
                <div class="col-md-12">
                    <div class="col-md-2 mc-select-wrap">
                        <h2>
                            Asset Management
                        </h2>
                    </div>

                    <%-- %{--<div class="col-md-4 well mc-select-wrap" style="margin-top: 10px">--}%
                    %{--<div class="mc-select">--}%
                    %{--<select class="select" name="school"--}%
                    %{--style="z-index: 10; opacity: 0;">--}%
                    %{--<option value="" selected="">Please Select School</option>--}%
                    %{--<g:each in="${user?.schoolRepresentative?.schools?.sort { it?.name }}"--}%
                    %{--var="schoolItr">--}%
                    %{--<option ${schoolItr == school ? 'selected' : ''}--}%
                    %{--value="${schoolItr?.id}">${schoolItr?.name}</option>--}%
                    %{--</g:each>--}%
                    %{--</select><i--}%
                    %{--class="fa fa-angle-down"></i>--}%
                    %{--</div>--}%
                    %{--</div>--}% --%>
                </div>

                <div class="page-header-content">
                	<a href="createVendor">
                   <%--  <a href="${createLink(controller: 'administrator', action: 'createVendor')}"> --%>
                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <div class="circle">
                                <i class="fa fa-plus-square-o fa-3x"></i>
                                <br/>
                                Add Vendor
                            </div>
                        </div>
                  </a>
                </div>

                <div class="col-lg-4">
                   <%-- <a href="${createLink(controller: 'administrator', action: 'mapVendorInventory')}"> --%>
                   <a href="mapVendorInventory">
                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <div class="circle">
                                <i class="fa fa-map-o fa-3x"></i>
                                <br/>
                                Map Vendor Category
                            </div>
                        </div>
                    </a> 
                </div>

                <div class="col-lg-4">
                    <%-- <a href="${createLink(controller: 'administrator', action: 'createInventoryItem')}"> --%>
                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <div class="circle">
                                <i class="fa fa-plus-square-o fa-3x"></i>
                                <br/>
                                Add Inventory Items
                            </div>
                        </div>
                    <!-- </a> -->
                </div>

            </div>
        </div>
    </div>

    <div class="col-md-1"></div>
</div>
</div>
</section>

</body>
</html>