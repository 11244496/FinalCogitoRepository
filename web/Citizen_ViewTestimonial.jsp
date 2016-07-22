<%-- 
    Document   : Citizen_Home
    Created on : 02 4, 16, 9:19:29 AM
    Author     : RoAnn
--%>

<%@page import="Entity.Project"%>
<%@page import="Entity.Reply"%>
<%@page import="Entity.Files"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Testimonial"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Citizen c = (Citizen) session.getAttribute("user");%>
<%
    Testimonial testimonial = (Testimonial) session.getAttribute("openTestimonial");
    boolean hasNoReply = (Boolean) session.getAttribute("hasNoReply");
    Reply r = new Reply();
    if (!hasNoReply) {
        r = (Reply) session.getAttribute("reply");
    }
    ArrayList<Reply> rList = testimonial.getReplies();
    ArrayList<Reply> comments = (ArrayList<Reply>) session.getAttribute("comments");

    ArrayList<Files> image = (ArrayList<Files>) session.getAttribute("openImage");
    ArrayList<Files> video = (ArrayList<Files>) session.getAttribute("openVideo");
    ArrayList<Files> docs = (ArrayList<Files>) session.getAttribute("openDocument");
    boolean check = (Boolean) session.getAttribute("followCheck");
    boolean showAdd = (Boolean) session.getAttribute("showAdd");
%>


<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Home</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />
        <link href="unitegallery/css/unite-gallery.css" rel="stylesheet" >
        <link href="unitegallery/themes/default/ug-theme-default.css" rel="stylesheet">
    </head>

    <body>

        <section id="container" class="">
            <header class="header green-bg">

                <div class="sidebar-toggle-box">
                    <div data-original-title="Toggle Navigation" data-placement="right" class="fa fa-bars tooltips"></div>
                </div>

                <a href="index.html" class="logo" >COGITO<span></span></a>

                <div class="nav notify-row" id="top_menu">

                    <ul class="nav top-menu">
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-tasks"></i>
                                <span class="badge bg-success"><!--NUMBER OF TASKS--></span>
                            </a>
                            <ul class="dropdown-menu extended tasks-bar">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have __ pending tasks</p>
                                </li>
                            </ul>
                        </li>

                        <li id="header_notification_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                                <i class="fa fa-bell-o"></i>
                                <span class="badge bg-warning"><!--NUMBER OF NOTIFICATIONS--></span>
                            </a>
                            <ul class="dropdown-menu extended notification">
                                <div class="notify-arrow notify-arrow-yellow"></div>
                                <li>
                                    <p class="yellow">You have __ new notifications</p>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="top-nav ">
                    <ul class="nav pull-right top-menu">

                        <li>
                            <input type="text" class="form-control search" placeholder="">
                        </li>

                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img alt="" src="img/avatar1_small.jpg">
                                <span class="username">Hello <b><u><%=c.getFirstName()%></u></b>!</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                                <li><a href="#"><i class="fa fa-bell-o"></i> Notification</a></li>
                                <li><a href="Logout"><i class="fa fa-key"></i> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </header>
        </section>

        <aside>
            <div id="sidebar"  class="nav-collapse ">
                <ul class="sidebar-menu" id="nav-accordion">

                    <li>
                        <a href="Citizen_Home">
                            <i class="fa fa-dashboard"></i>
                            <span>Home</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_SearchTestimonial">
                            <i class="fa fa-book"></i>
                            <span>Testimonials</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_ProjectsImplemented">
                            <i class="fa fa-book"></i>
                            <span>Projects Implemented</span>
                        </a>
                    </li>

                    <li>
                        <a href="Citizen_NotificationActivity">
                            <i class="fa fa-book"></i>
                            <span>Notification and Activity</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>

        <section id="main-content">
            <section class="wrapper site-min-height">


                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">

                            <header class="panel-heading" style="width: 30%">
                                <p>Testimonial Details</p>

                            </header>
                            <div style="float: next; width: 100%">
                                <%if (testimonial.getCitizen().getId() != c.getId()) {%>
                                <%if (check) {%>

                                <form action="Citizen_UnfollowTestimonial">
                                    <input type="hidden" name="idd" value="<%=testimonial.getId()%>">
                                    <button type="submit" class="btn btn-info btn-sm">Unfollow</button>
                                </form>

                                <%} else {%>
                                <form action="Citizen_FollowTestimonial">
                                    <%String supporters = (String) request.getAttribute("supporters");%>
                                    <input type="hidden" name="idd" value="<%=testimonial.getId()%>">
                                    <button type="submit" class="btn btn-info btn-sm" >Follow: <%=supporters%></button> 
                                </form>
                                <%}%>
                                <%if (!showAdd) {%>
                                <form action="Citizen_AddInfo">
                                    <a href="Citizen_AddTestimonialInfo.jsp"><button type="button" class="btn btn-info btn-sm">Contribute</button></a>
                                </form>
                                <%}%>
                                <%} else {%>
                                <%if (showAdd) {%>
                                <form action="Citizen_ViewPendingFiles">
                                    <button type="submit" class="btn btn-info btn-sm" >View submitted files</button>
                                </form>
                                <%}%>
                                <%if (!hasNoReply) {%>
                                <a class="btn btn-info btn-sm" data-toggle="modal" href="#gsViewReplyModal"><i class="fa fa-envelope"></i> View Reply</a>
                                <%}%>
                                <%}%>
                            </div>
                        </section>   
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-8">
                        <section class="panel">
                            <div class="bio-graph-heading project-heading">
                                <strong><%=testimonial.getTitle()%></strong>
                            </div>

                            <div class="panel-body">

                                <%for (int x = 0; x < video.size(); x++) {%>
                                <video width="100%" height="100%" controls>
                                    <source src="<%=testimonial.getFolderName() + testimonial.getTitle() + "/" + video.get(x).getFileName()%>" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                                <%}%>

                                <div id="gallery" style="display:none;">

                                    <%for (int x = 0; x < image.size(); x++) {
                                            String desc = image.get(x).getDescription();
                                            String imagelocation = testimonial.getFolderName() + testimonial.getTitle() + "/" + image.get(x).getFileName();
                                    %>

                                    <img alt="<%=desc%>"
                                         src="<%=imagelocation%>"
                                         data-image="<%=imagelocation%>"
                                         data-description="<%=desc%>">
                                    <%}%>
                                </div>

                                <div id="OtherFiles">
                                    <h3>Document Uploads</h3>  
                                    <br>
                                    <ul class="list-unstyled p-files">

                                        <%
                                            if (docs.isEmpty() == false || image == null) {
                                                String d;
                                                for (int x = 0; x < docs.size(); x++) {
                                                    d = testimonial.getFolderName() + testimonial.getTitle() + "/" + docs.get(x).getFileName();

                                        %>

                                        <h4 ><a href="<%=d%>"><i class="fa fa-file-text"></i> <%out.print(docs.get(x).getFileName());%></a> 
                                            - <%out.print(docs.get(x).getDescription());%>
                                        </h4>
                                        <br>
                                        <%

                                                }
                                            }

                                        %>  

                                    </ul>

                                </div>    
                                <br>
                                <center>
                                    <button type="button" onclick="history.go(-1)" class="btn btn-info" >Back</button>                                    
                                </center> 
                            </div>
                        </section>
                    </div>
                    <div class="col-md-4">
                        <section class="panel">

                            <div class="bio-graph-heading project-heading">
                                <strong>Location</strong>
                            </div>
                            <div class="panel-body">
                                <div id="map" style="height: 300px; width: 320px; margin: 0; padding: 0;"></div>
                            </div>


                            <div class="bio-graph-heading project-heading">
                                <strong>Other Information</strong>
                            </div>

                            <div class="panel-body">

                                <h5 class="bold">Category</h5>
                                <p><%=testimonial.getCategory()%></p>
                                <br>

                                <h5 class="bold">Message</h5>
                                <p>
                                    <%=testimonial.getMessage()%>                        
                                </p>
                                <br>
                                <h5 class="bold">Uploaded by</h5>
                                <p><%=testimonial.getCitizen().getUser().getUsername()%></p>
                                <br>

                                <h5 class="bold">Date Uploaded</h5>
                                <p><%=testimonial.getDateUploaded()%></p>
                                <br>

                                <%String supporters = (String) request.getAttribute("supporters");%>
                                <h5 class="bold">Number of supporters</h5>
                                <p><%=supporters%></p>
                                <br>

                                <h5 class="bold">Main Project</h5>
                                <%
                                    if (testimonial.getMainproject().getId() != null) {
                                        System.out.println(testimonial.getMainproject().getName());
                                    } else {
                                %>
                                <p>No main project yet.</p>
                                <%}%>

                                <br>


                            </div>

                        </section>
                    </div>

                    <br>
                    <div class="col-md-8">
                        <section class="panel">
                            <header class="panel-heading" style="width: 30%">
                                <p>Write a comment</p>

                            </header>
                            <form action='Citizen_SendComment'>
                                <div class="panel-body">
                                    <div class='col-md-12'>
                                        <div class='col-md-3'>
                                            <h4> Write a comment </h4>
                                            <br>
                                            <br>
                                        </div>
                                        <div class='col-md-8'>
                                            <textarea class='form-control' name='comment' rows="4"></textarea>
                                            <input type='hidden' value="<%=testimonial.getId()%>" name="testId">
                                        </div>
                                        <div class='col-md-1'>
                                            <span clas='pull-right'>
                                                <button type='submit' style='padding-top: 10px; padding-bottom: 10px' class='btn btn-success btn-sm'>Post</button>
                                            </span>
                                        </div>
                                    </div>
                                        
                                    <div class='col-md-12'  style="margin-top: 5%;">
                                        <header class="panel-heading">
                                            <b><p>Comments</p></b>
                                        </header>
                                    </div>
                                        <% for (Reply rep : comments){%>
                                    <div class='col-md-12'>
                                        <header class="panel-heading">
                                            <p><%=rep.getSender().getUsername()%>
                                            <span class="pull-right">
                                                <%=rep.getDateSent()%>
                                            </span>
                                            </p>
                                        </header>
                                        <div class='col-md-12'>
                                            <textarea class='form-control' readonly style="background: white; cursor: default;"><%=rep.getMessage()%></textarea>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>    
                            </form>
                            <br>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>

        <section id='main-content'>
            <section class='wrapper site-min-height'>
                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">

                        </section>   
                    </div>
                </div>
            </section>
        </section>

        <%if (!hasNoReply) {%>
        <div class="modal fade " id="gsViewReplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">View Reply</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group col-md-12">
                            <label class="col-md-2"> To: </label>
                            <div class="col-md-8">
                                <input class="form-control" name="toR" readonly value="<%=testimonial.getCitizen().getUser().getUsername()%>">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="col-md-2"> From: </label>
                            <div class="col-md-8">
                                <input class="form-control" name="fromR" readonly value="<%=r.getSender().getUsername()%>">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="col-md-2"> Message: </label>
                            <div class="col-md-8">
                                <textarea class="form-control" name="messageR" readonly><%=r.getMessage()%></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <center>
                                <button data-dismiss="modal" class="btn btn-info" type="button">Close</button>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>

        <!--main content end-->
        <!--footer start-->
        <footer class="site-footer">
            <div class="text-center">
                2016 &copy; KAYA
                <a href="#" class="go-top">
                    <i class="fa fa-angle-up"></i>
                </a>
            </div>
        </footer>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6e73iIoB6fgzlEmgdJBFYO3DX0OhMLw&callback=initMap"async defer></script>
        <script>
                                        var map;
                                        var markers = <%=session.getAttribute("location")%>;
                                        function initMap() {

                                            map = new google.maps.Map(document.getElementById('map'), {
                                                center: {lat: 14.45, lng: 120.98},
                                                zoom: 14
                                            });

                                            markers.forEach(function (coor) {
                                                var geocoder = new google.maps.Geocoder;
                                                var latLng = new google.maps.LatLng(coor.latitude, coor.longitude);
                                                var marker = new google.maps.Marker({
                                                    position: latLng,
                                                    map: map
                                                });
                                                var infowindow = new google.maps.InfoWindow;

                                                marker.addListener('click', function () {
                                                    geocodeLatLng(geocoder, map, infowindow, latLng);
                                                });
                                            });

                                        }

                                        function geocodeLatLng(geocoder, map, infowindow, latLng) {
                                            var latlng = latLng;
                                            geocoder.geocode({'location': latlng}, function (results, status) {
                                                if (status === google.maps.GeocoderStatus.OK) {
                                                    if (results[0]) {
                                                        var marker = new google.maps.Marker({
                                                            position: latlng,
                                                            map: map
                                                        });
                                                        infowindow.setContent(results[0].formatted_address);
                                                        infowindow.open(map, marker);
                                                    } else {
                                                        window.alert('No results found');
                                                    }
                                                } else {
                                                    window.alert('Geocoder failed due to: ' + status);
                                                }
                                            });
                                        }
        </script>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>
        <script src="js/slidebars.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src='unitegallery/js/unitegallery.min.js'></script>
        <script src="unitegallery/themes/default/ug-theme-default.js"></script>
        <script type="text/javascript">

                                        jQuery(document).ready(function () {

                                            jQuery("#gallery").unitegallery();

                                        });

        </script>
    </body>
</html>
