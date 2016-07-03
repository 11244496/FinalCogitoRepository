<%-- 
    Document   : OCPD_ActivityList
    Created on : 04 8, 16, 10:15:17 PM
    Author     : RoAnn
--%>

<%@page import="Entity.Activity"%>
<%@page import="Entity.Contractor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Project"%>
<%@page import="Entity.Employee"%>
<%@page import="Entity.Citizen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Employee bac = (Employee) session.getAttribute("user");
                ArrayList<Activity> activitylist = (ArrayList<Activity>) request.getAttribute("list");
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
                                <span class="username">Hello <b><u><%=bac.getFirstName()%></u></b>!</span>
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
                <!-- sidebar menu start-->
                <ul class="sidebar-menu" id="nav-accordion">
                    <li>
                        <a href="OCPD_Home">
                            <i class="fa fa-dashboard"></i>
                            <span>Home</span>
                        </a>
                    </li>


                    <li>
                        <a href="OCPD_ViewPlanningDocument">
                            <i class="fa fa-book"></i>
                            <span>CLUP and CDP</span>
                        </a>
                    </li>

                    <!--multi level menu start-->
                    <li class="sub-menu">
                        <a href="javascript:;" >
                            <i class="fa fa-tasks"></i>
                            <span>Project Proposals</span>
                        </a>
                        <ul class="sub">
                            <li><a  href="OCPD_ViewProjectList">&nbsp; &nbsp; &nbsp; &nbsp; View Project Proposals</a></li>
                            <li class="sub-menu">
                                <a  href="">&nbsp; &nbsp; &nbsp; &nbsp; Monitor Projects</a>
                                <ul class="sub">
                                    <li><a  href="OCPD_Timeline.jsp">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; View Timeline</a></li>
                                    <li class="sub-menu">
                                        <a  href="OCPD_ViewProjectStatus">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; View Project Status</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!--multi level menu end-->
                    <li>
                        <a href="OCPD_NotificationList">
                            <i class="fa fa-book"></i>
                            <span>Notifications</span>
                        </a>
                    </li>
                    <li>
                        <a href="OCPD_ActivityList" class="active">
                            <i class="fa fa-book"></i>
                            <span>Department Activity Log</span>
                        </a>
                    </li>

                </ul>
                <!-- sidebar menu end-->
            </div>
        </aside>


        <!--main content start-->
        <section id="main-content">
            <section class="wrapper site-min-height">
                <!-- page start-->
                <section class="panel">
                    <div class="col-lg-8" style="padding-left: 0px; padding-right:0px; width:100%;">
                        <div class="row">
                            <div class="col-lg-6" style="width:100%;">
                                <!--widget start-->
                                <section class="panel" style="width:100%;">
                                    <div class="panel-body">

                                        <table class="table table-hover p-table">
                                            <thead>
                                                <tr>
                                                    <th>Activity</th>
                                                    <th>Date</th>
                                                    <th>Time</th>




                                                </tr>
                                            </thead>
                                            <%                                                            for (int x = 0; x < activitylist.size(); x++) {
                                                    String act = activitylist.get(x).getActivity();
                                                    String date = activitylist.get(x).getDateTime();

                                                    String[] parts = date.split(" ");
                                                    String part1 = parts[0];
                                                    String part2 = parts[1];

                                            %>

                                            <tbody>
                                                <tr>
                                                    <td class="p-name">
                                                        <%out.print(act);%>
                                                    </td>

                                                    <td class="p-name">
                                                        <%out.print(part1);%>
                                                    </td>
                                                    <td class="p-name">
                                                        <%out.print(part2);%>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <%
                                                }
                                            %>


                                        </table>






                                    </div>
                                </section>
                                <!--widget end-->

                            </div>
                        </div>

                    </div>
                </section>
                <!-- page end-->
            </section>

        </section>
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
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.pulsate.min.js"></script>
        <script src="js/slidebars.min.js"></script>
    </body>
</html>
