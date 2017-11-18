<html>
<head>
    <sec:ifAnyGranted roles="ROLE_PRINCIPAL">
        <meta name="layout" content="principal">
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_ADMINISTRATOR">
        <meta name="layout" content="administrator">
    </sec:ifAnyGranted>
    <title>Spandhan:Vendor-Inventory Category Mapping</title>
</head>

<body>
<section id="course-concern" class="course-concern">

    <div class="container">
        <div class="row">
            <!-- FORM -->
            <div class="col-lg-7 col-md-6" style="margin-top: 10px">
               <!--  <g:render template="vendorCategoryListing" model="[school: school, user: user]"/> -->
               
               <div class="table-responsive">
        <table class="table table-bordered table-hover " style="margin-top: 10px">
            <tr>
                <th>Company Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Contact Person</th>
                <th>Inventory Category</th>
            </tr>
            <tr>
            </tr>

        </table>
    </div>
            </div>

           <div class="col-lg-1 col-md-1"></div>

            <div class="col-lg-4 col-md-4" style="margin-top: 10px">
                <div class="form-login" style="background-color: #E9E9E9 !important;">
                   <!--  <g:form controller="administrator" action="mapVendorInventory">
                        <g:render template="/common/flash"/> -->
                        <h2 style="color: #37abf2 !important;">Map Vendor with Inventory Category</h2>
                        <!-- <sec:ifAnyGranted roles="ROLE_ADMINISTRATOR"> -->

                            <div class="form-email" style="margin-top: 18px">
                                <div class="mc-select-wrap">
                                    <div class="mc-select">
                                        <select id="schoolDropdown" class="select" name="school"
                                                style="z-index: 10; opacity: 0;">
                                            <option value="" selected="">Please Select School</option>
                                            <%-- <g:each in="${user?.schoolRepresentative?.schools?.sort { it?.name }}"
                                                    var="schoolItr">
                                                <option ${schoolItr == school ? 'selected' : ''}
                                                        value="${schoolItr?.id}">${schoolItr?.name}</option>
                                            </g:each> --%>
                                        </select>
                                        <i  class="fa fa-angle-down"></i>
                                    </div>
                                </div>
                            </div>
                       <!--  </sec:ifAnyGranted> -->
                        <div class="form-email" style="margin-top: 18px">
                            <div class="mc-select-wrap">
                                <div class="mc-select">
                                    <select class="select" name="vendor"
                                            style="z-index: 10; opacity: 0;">
                                        <option value="" selected="">Please Select Vendor</option>
                                        <%-- <sec:ifAnyGranted roles="ROLE_ADMINISTRATOR">
                                            <g:each in="${user?.schoolRepresentative?.schools?.sort { it?.name }}"
                                                    var="school">
                                                <g:each in="${school?.vendor}" var="vendor">
                                                    <option value="${vendor?.id}">${vendor?.companyName}:${vendor?.companyAddress}</option>
                                                </g:each>

                                            </g:each>
                                        </sec:ifAnyGranted>
                                        <sec:ifAnyGranted roles="ROLE_PRINCIPAL">
                                            <g:each in="${school?.vendor}" var="vendor">
                                                <option value="${vendor?.id}">${vendor?.companyName}:${vendor?.companyAddress}</option>
                                            </g:each>

                                        </sec:ifAnyGranted>
 --%>
                                    </select><i class="fa fa-angle-down"></i>
                                </div>
                            </div>
                        </div>

                        <div class="form-email" style="margin-top: 18px">
                            <div class="mc-select-wrap">
                                <div class="mc-select">
                                    <select class="select"
                                            name="inventoryItemCategory" style="z-index: 10; opacity: 0;">
											<%--  <option value=""
                                                selected="">Select Inventory Category</option>
                                        <g:each in="${com.spandhan.inventory.InventoryItemCategory.itemCategoryList()}"
                                                var="category">

                                            <option value="${category?.key}">${category?.value}</option>
                                        </g:each> --%>

                                    </select>

                                    <i class="fa fa-angle-down"></i>
                                </div>
                            </div>
                        </div>

                        <div class="form-submit-1">
                            <input type="submit" value="Assign" class="mc-btn btn-style-1">
                        </div>

                        <div class="link" style="margin-top: 20px !important;">
                            <%-- <a href="${createLink(controller: 'login', action: 'auth')}">
                                %{--<i class="icon fa fa-arrow-right"></i>Already have account ? Log in--}%
                            </a> --%>
                        </div>
                    <!-- </g:form> -->
                </div>
            </div>

            <!-- END / FORM -->

            <div class="image">
            </div>

        </div>
    </div>

</section>

</body>
</html>