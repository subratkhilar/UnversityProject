<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="librarian">
    <title>Librarian Dashboard</title>

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


<section id="course-concern" class="course-concern" style="padding-bottom: 10%">
    <div class="container">
        <div class="row">
            <a href="addBooks">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa-book fa-3x"></i>
                        <br/>
                        Add Books
                    </div>
                </div>
            </a>

            <a href="viewAddedBooks">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa fa-th-large fa-3x"></i>
                        <br/>
                        View Added Books
                    </div>
                </div>
            </a>
        </div>
    </div>
</section>

</body>
</html>