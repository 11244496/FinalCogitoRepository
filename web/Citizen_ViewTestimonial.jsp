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
    ArrayList<Reply> rList = testimonial.getReplies();

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


                <!-- page start-->                    
                <section class="panel">

                    <header class="panel-heading" style="height: 80px">
                        Testimonial Details
                        <span class="pull-right">
                            <div>
                                <%if (testimonial.getCitizen().getId() != c.getId()) {%>
                                <%if (check) {%>
                                <span class="pull-right">
                                    <form action="Citizen_UnfollowTestimonial">
                                        <input type="hidden" name="idd" value="<%=testimonial.getId()%>">
                                        <button type="submit" class="btn btn-info btn-sm" >Unfollow</button>
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
                                        <a href="Citizen_AddTestimonialInfo.jsp" class="pull-right position"><button type="button" class="btn btn-info btn-sm">Contribute</button></a>
                                    </form>
                                    <%}%>
                                    <%} else {%>
                                    <%if (showAdd) {%>
                                    <form action="Citizen_ViewPendingFiles">
                                        <button type="submit" class="btn btn-info btn-sm" >View submitted files</button>
                                    </form>
                                </span>
                                <%}%>
                                <%}%>
                            </div>
                        </span>
                    </header>

                </section>


                <div class="row">
                    <div class="col-md-8">
                        <section class="panel">
                            <div class="bio-graph-heading project-heading">
                                <strong><%=testimonial.getTitle()%></strong>
                            </div>

                        </section>

                        <section class="panel">

                            <div class="panel-body">
                                <section class="panel">
                                    <div class="panel-body">

                                        <script>

                                            (function (h, g, c, j, e, l, k) {/*! Jssor */
                                                new (function () {
                                                });
                                                var f = {Pc: function (a) {
                                                        return -c.cos(a * c.PI) / 2 + .5
                                                    }, ad: function (a) {
                                                        return a
                                                    }, Ce: function (a) {
                                                        return -a * (a - 2)
                                                    }, De: function (a) {
                                                        return a * a * a
                                                    }, Ee: function (a) {
                                                        return(a -= 1) * a * a + 1
                                                    }}, d = {m: f.ad, l: f.De, ud: f.Ee};
                                                var b = new function () {
                                                    var d = this, Bb = /\S+/g, G = 1, db = 2, hb = 3, gb = 4, lb = 5, H, r = 0, i = 0, s = 0, W = 0, z = 0, J = navigator, pb = J.appName, o = J.userAgent, p = parseFloat;
                                                    function zb() {
                                                        if (!H) {
                                                            H = {of: "ontouchstart"in h || "createTouch"in g};
                                                            var a;
                                                            if (J.pointerEnabled || (a = J.msPointerEnabled))
                                                                H.kd = a ? "msTouchAction" : "touchAction"
                                                        }
                                                        return H
                                                    }
                                                    function v(j) {
                                                        if (!r) {
                                                            r = -1;
                                                            if (pb == "Microsoft Internet Explorer" && !!h.attachEvent && !!h.ActiveXObject) {
                                                                var e = o.indexOf("MSIE");
                                                                r = G;
                                                                s = p(o.substring(e + 5, o.indexOf(";", e))); /*@cc_on W=@_jscript_version@*/
                                                                ;
                                                                i = g.documentMode || s
                                                            } else if (pb == "Netscape" && !!h.addEventListener) {
                                                                var d = o.indexOf("Firefox"), b = o.indexOf("Safari"), f = o.indexOf("Chrome"), c = o.indexOf("AppleWebKit");
                                                                if (d >= 0) {
                                                                    r = db;
                                                                    i = p(o.substring(d + 8))
                                                                } else if (b >= 0) {
                                                                    var k = o.substring(0, b).lastIndexOf("/");
                                                                    r = f >= 0 ? gb : hb;
                                                                    i = p(o.substring(k + 1, b))
                                                                } else {
                                                                    var a = /Trident\/.*rv:([0-9]{1,}[\.0-9]{0,})/i.exec(o);
                                                                    if (a) {
                                                                        r = G;
                                                                        i = s = p(a[1])
                                                                    }
                                                                }
                                                                if (c >= 0)
                                                                    z = p(o.substring(c + 12))
                                                            } else {
                                                                var a = /(opera)(?:.*version|)[ \/]([\w.]+)/i.exec(o);
                                                                if (a) {
                                                                    r = lb;
                                                                    i = p(a[2])
                                                                }
                                                            }
                                                        }
                                                        return j == r
                                                    }
                                                    function q() {
                                                        return v(G)
                                                    }
                                                    function R() {
                                                        return q() && (i < 6 || g.compatMode == "BackCompat")
                                                    }
                                                    function fb() {
                                                        return v(hb)
                                                    }
                                                    function kb() {
                                                        return v(lb)
                                                    }
                                                    function wb() {
                                                        return fb() && z > 534 && z < 535
                                                    }
                                                    function K() {
                                                        v();
                                                        return z > 537 || i > 42 || r == G && i >= 11
                                                    }
                                                    function P() {
                                                        return q() && i < 9
                                                    }
                                                    function xb(a) {
                                                        var b, c;
                                                        return function (f) {
                                                            if (!b) {
                                                                b = e;
                                                                var d = a.substr(0, 1).toUpperCase() + a.substr(1);
                                                                n([a].concat(["WebKit", "ms", "Moz", "O", "webkit"]), function (g, e) {
                                                                    var b = a;
                                                                    if (e)
                                                                        b = g + d;
                                                                    if (f.style[b] != k)
                                                                        return c = b
                                                                })
                                                            }
                                                            return c
                                                        }
                                                    }
                                                    function vb(b) {
                                                        var a;
                                                        return function (c) {
                                                            a = a || xb(b)(c) || b;
                                                            return a
                                                        }
                                                    }
                                                    var L = vb("transform");
                                                    function ob(a) {
                                                        return{}.toString.call(a)
                                                    }
                                                    var F;
                                                    function Hb() {
                                                        if (!F) {
                                                            F = {};
                                                            n(["Boolean", "Number", "String", "Function", "Array", "Date", "RegExp", "Object"], function (a) {
                                                                F["[object " + a + "]"] = a.toLowerCase()
                                                            })
                                                        }
                                                        return F
                                                    }
                                                    function n(b, d) {
                                                        var a, c;
                                                        if (ob(b) == "[object Array]") {
                                                            for (a = 0; a < b.length; a++)
                                                                if (c = d(b[a], a, b))
                                                                    return c
                                                        } else
                                                            for (a in b)
                                                                if (c = d(b[a], a, b))
                                                                    return c
                                                    }
                                                    function C(a) {
                                                        return a == j ? String(a) : Hb()[ob(a)] || "object"
                                                    }
                                                    function mb(a) {
                                                        for (var b in a)
                                                            return e
                                                    }
                                                    function A(a) {
                                                        try {
                                                            return C(a) == "object" && !a.nodeType && a != a.window && (!a.constructor || {}.hasOwnProperty.call(a.constructor.prototype, "isPrototypeOf"))
                                                        } catch (b) {
                                                        }
                                                    }
                                                    function u(a, b) {
                                                        return{x: a, y: b}
                                                    }
                                                    function sb(b, a) {
                                                        setTimeout(b, a || 0)
                                                    }
                                                    function I(b, d, c) {
                                                        var a = !b || b == "inherit" ? "" : b;
                                                        n(d, function (c) {
                                                            var b = c.exec(a);
                                                            if (b) {
                                                                var d = a.substr(0, b.index), e = a.substr(b.index + b[0].length + 1, a.length - 1);
                                                                a = d + e
                                                            }
                                                        });
                                                        a = c + (!a.indexOf(" ") ? "" : " ") + a;
                                                        return a
                                                    }
                                                    function ub(b, a) {
                                                        if (i < 9)
                                                            b.style.filter = a
                                                    }
                                                    d.mf = zb;
                                                    d.md = q;
                                                    d.rf = fb;
                                                    d.qd = kb;
                                                    d.uf = K;
                                                    d.tb = P;
                                                    xb("transform");
                                                    d.wd = function () {
                                                        return i
                                                    };
                                                    d.xf = function () {
                                                        v();
                                                        return z
                                                    };
                                                    d.P = sb;
                                                    function Z(a) {
                                                        a.constructor === Z.caller && a.zd && a.zd.apply(a, Z.caller.arguments)
                                                    }
                                                    d.zd = Z;
                                                    d.Bb = function (a) {
                                                        if (d.af(a))
                                                            a = g.getElementById(a);
                                                        return a
                                                    };
                                                    function t(a) {
                                                        return a || h.event
                                                    }
                                                    d.Cd = t;
                                                    d.hc = function (b) {
                                                        b = t(b);
                                                        var a = b.target || b.srcElement || g;
                                                        if (a.nodeType == 3)
                                                            a = d.Dd(a);
                                                        return a
                                                    };
                                                    d.Fd = function (a) {
                                                        a = t(a);
                                                        return{x: a.pageX || a.clientX || 0, y: a.pageY || a.clientY || 0}
                                                    };
                                                    function D(c, d, a) {
                                                        if (a !== k)
                                                            c.style[d] = a == k ? "" : a;
                                                        else {
                                                            var b = c.currentStyle || c.style;
                                                            a = b[d];
                                                            if (a == "" && h.getComputedStyle) {
                                                                b = c.ownerDocument.defaultView.getComputedStyle(c, j);
                                                                b && (a = b.getPropertyValue(d) || b[d])
                                                            }
                                                            return a
                                                        }
                                                    }
                                                    function bb(b, c, a, d) {
                                                        if (a !== k) {
                                                            if (a == j)
                                                                a = "";
                                                            else
                                                                d && (a += "px");
                                                            D(b, c, a)
                                                        } else
                                                            return p(D(b, c))
                                                    }
                                                    function m(c, a) {
                                                        var d = a ? bb : D, b;
                                                        if (a & 4)
                                                            b = vb(c);
                                                        return function (e, f) {
                                                            return d(e, b ? b(e) : c, f, a & 2)
                                                        }
                                                    }
                                                    function Eb(b) {
                                                        if (q() && s < 9) {
                                                            var a = /opacity=([^)]*)/.exec(b.style.filter || "");
                                                            return a ? p(a[1]) / 100 : 1
                                                        } else
                                                            return p(b.style.opacity || "1")
                                                    }
                                                    function Gb(b, a, f) {
                                                        if (q() && s < 9) {
                                                            var h = b.style.filter || "", i = new RegExp(/[\s]*alpha\([^\)]*\)/g), e = c.round(100 * a), d = "";
                                                            if (e < 100 || f)
                                                                d = "alpha(opacity=" + e + ") ";
                                                            var g = I(h, [i], d);
                                                            ub(b, g)
                                                        } else
                                                            b.style.opacity = a == 1 ? "" : c.round(a * 100) / 100
                                                    }
                                                    var M = {U: ["rotate"], eb: ["rotateX"], cb: ["rotateY"], Tb: ["skewX"], Ub: ["skewY"]};
                                                    if (!K())
                                                        M = B(M, {A: ["scaleX", 2], D: ["scaleY", 2], db: ["translateZ", 1]});
                                                    function N(d, a) {
                                                        var c = "";
                                                        if (a) {
                                                            if (q() && i && i < 10) {
                                                                delete a.eb;
                                                                delete a.cb;
                                                                delete a.db
                                                            }
                                                            b.j(a, function (d, b) {
                                                                var a = M[b];
                                                                if (a) {
                                                                    var e = a[1] || 0;
                                                                    if (O[b] != d)
                                                                        c += " " + a[0] + "(" + d + (["deg", "px", ""])[e] + ")"
                                                                }
                                                            });
                                                            if (K()) {
                                                                if (a.nb || a.pb || a.db)
                                                                    c += " translate3d(" + (a.nb || 0) + "px," + (a.pb || 0) + "px," + (a.db || 0) + "px)";
                                                                if (a.A == k)
                                                                    a.A = 1;
                                                                if (a.D == k)
                                                                    a.D = 1;
                                                                if (a.A != 1 || a.D != 1)
                                                                    c += " scale3d(" + a.A + ", " + a.D + ", 1)"
                                                            }
                                                        }
                                                        d.style[L(d)] = c
                                                    }
                                                    d.Oc = m("transformOrigin", 4);
                                                    d.lf = m("backfaceVisibility", 4);
                                                    d.We = m("transformStyle", 4);
                                                    d.Xe = m("perspective", 6);
                                                    d.ge = m("perspectiveOrigin", 4);
                                                    d.Ye = function (a, b) {
                                                        if (q() && s < 9 || s < 10 && R())
                                                            a.style.zoom = b == 1 ? "" : b;
                                                        else {
                                                            var c = L(a), f = "scale(" + b + ")", e = a.style[c], g = new RegExp(/[\s]*scale\(.*?\)/g), d = I(e, [g], f);
                                                            a.style[c] = d
                                                        }
                                                    };
                                                    d.mc = function (b, a) {
                                                        return function (c) {
                                                            c = t(c);
                                                            var f = c.type, e = c.relatedTarget || (f == "mouseout" ? c.toElement : c.fromElement);
                                                            (!e || e !== a && !d.df(a, e)) && b(c)
                                                        }
                                                    };
                                                    d.g = function (a, e, b, c) {
                                                        a = d.Bb(a);
                                                        if (a.addEventListener) {
                                                            e == "mousewheel" && a.addEventListener("DOMMouseScroll", b, c);
                                                            a.addEventListener(e, b, c)
                                                        } else if (a.attachEvent) {
                                                            a.attachEvent("on" + e, b);
                                                            c && a.setCapture && a.setCapture()
                                                        }
                                                    };
                                                    d.Q = function (a, c, e, b) {
                                                        a = d.Bb(a);
                                                        if (a.removeEventListener) {
                                                            c == "mousewheel" && a.removeEventListener("DOMMouseScroll", e, b);
                                                            a.removeEventListener(c, e, b)
                                                        } else if (a.detachEvent) {
                                                            a.detachEvent("on" + c, e);
                                                            b && a.releaseCapture && a.releaseCapture()
                                                        }
                                                    };
                                                    d.Zb = function (a) {
                                                        a = t(a);
                                                        a.preventDefault && a.preventDefault();
                                                        a.cancel = e;
                                                        a.returnValue = l
                                                    };
                                                    d.gf = function (a) {
                                                        a = t(a);
                                                        a.stopPropagation && a.stopPropagation();
                                                        a.cancelBubble = e
                                                    };
                                                    d.S = function (d, c) {
                                                        var a = [].slice.call(arguments, 2), b = function () {
                                                            var b = a.concat([].slice.call(arguments, 0));
                                                            return c.apply(d, b)
                                                        };
                                                        return b
                                                    };
                                                    d.Xb = function (d, c) {
                                                        for (var b = [], a = d.firstChild; a; a = a.nextSibling)
                                                            (c || a.nodeType == 1) && b.push(a);
                                                        return b
                                                    };
                                                    function nb(a, c, e, b) {
                                                        b = b || "u";
                                                        for (a = a?a.firstChild:j; a; a = a.nextSibling)
                                                            if (a.nodeType == 1) {
                                                                if (V(a, b) == c)
                                                                    return a;
                                                                if (!e) {
                                                                    var d = nb(a, c, e, b);
                                                                    if (d)
                                                                        return d
                                                                }
                                                            }
                                                    }
                                                    d.E = nb;
                                                    function T(a, d, f, b) {
                                                        b = b || "u";
                                                        var c = [];
                                                        for (a = a?a.firstChild:j; a; a = a.nextSibling)
                                                            if (a.nodeType == 1) {
                                                                V(a, b) == d && c.push(a);
                                                                if (!f) {
                                                                    var e = T(a, d, f, b);
                                                                    if (e.length)
                                                                        c = c.concat(e)
                                                                }
                                                            }
                                                        return c
                                                    }
                                                    function ib(a, c, d) {
                                                        for (a = a?a.firstChild:j; a; a = a.nextSibling)
                                                            if (a.nodeType == 1) {
                                                                if (a.tagName == c)
                                                                    return a;
                                                                if (!d) {
                                                                    var b = ib(a, c, d);
                                                                    if (b)
                                                                        return b
                                                                }
                                                            }
                                                    }
                                                    d.jf = ib;
                                                    function yb(a, c, e) {
                                                        var b = [];
                                                        for (a = a?a.firstChild:j; a; a = a.nextSibling)
                                                            if (a.nodeType == 1) {
                                                                (!c || a.tagName == c) && b.push(a);
                                                                if (!e) {
                                                                    var d = yb(a, c, e);
                                                                    if (d.length)
                                                                        b = b.concat(d)
                                                                }
                                                            }
                                                        return b
                                                    }
                                                    d.Ze = yb;
                                                    d.Ue = function (b, a) {
                                                        return b.getElementsByTagName(a)
                                                    };
                                                    function B() {
                                                        var e = arguments, d, c, b, a, g = 1 & e[0], f = 1 + g;
                                                        d = e[f - 1] || {};
                                                        for (; f < e.length; f++)
                                                            if (c = e[f])
                                                                for (b in c) {
                                                                    a = c[b];
                                                                    if (a !== k) {
                                                                        a = c[b];
                                                                        var h = d[b];
                                                                        d[b] = g && (A(h) || A(a)) ? B(g, {}, h, a) : a
                                                                    }
                                                                }
                                                        return d
                                                    }
                                                    d.G = B;
                                                    function ab(f, g) {
                                                        var d = {}, c, a, b;
                                                        for (c in f) {
                                                            a = f[c];
                                                            b = g[c];
                                                            if (a !== b) {
                                                                var e;
                                                                if (A(a) && A(b)) {
                                                                    a = ab(a, b);
                                                                    e = !mb(a)
                                                                }
                                                                !e && (d[c] = a)
                                                            }
                                                        }
                                                        return d
                                                    }
                                                    d.id = function (a) {
                                                        return C(a) == "function"
                                                    };
                                                    d.af = function (a) {
                                                        return C(a) == "string"
                                                    };
                                                    d.fd = function (a) {
                                                        return!isNaN(p(a)) && isFinite(a)
                                                    };
                                                    d.j = n;
                                                    function S(a) {
                                                        return g.createElement(a)
                                                    }
                                                    d.lb = function () {
                                                        return S("DIV")
                                                    };
                                                    d.Qc = function () {
                                                    };
                                                    function X(b, c, a) {
                                                        if (a == k)
                                                            return b.getAttribute(c);
                                                        b.setAttribute(c, a)
                                                    }
                                                    function V(a, b) {
                                                        return X(a, b) || X(a, "data-" + b)
                                                    }
                                                    d.J = X;
                                                    d.p = V;
                                                    function x(b, a) {
                                                        if (a == k)
                                                            return b.className;
                                                        b.className = a
                                                    }
                                                    d.Nc = x;
                                                    function rb(b) {
                                                        var a = {};
                                                        n(b, function (b) {
                                                            a[b] = b
                                                        });
                                                        return a
                                                    }
                                                    function tb(b, a) {
                                                        return b.match(a || Bb)
                                                    }
                                                    function Q(b, a) {
                                                        return rb(tb(b || "", a))
                                                    }
                                                    d.fe = tb;
                                                    function cb(b, c) {
                                                        var a = "";
                                                        n(c, function (c) {
                                                            a && (a += b);
                                                            a += c
                                                        });
                                                        return a
                                                    }
                                                    function E(a, c, b) {
                                                        x(a, cb(" ", B(ab(Q(x(a)), Q(c)), Q(b))))
                                                    }
                                                    d.Dd = function (a) {
                                                        return a.parentNode
                                                    };
                                                    d.T = function (a) {
                                                        d.W(a, "none")
                                                    };
                                                    d.H = function (a, b) {
                                                        d.W(a, b ? "none" : "")
                                                    };
                                                    d.Ud = function (b, a) {
                                                        b.removeAttribute(a)
                                                    };
                                                    d.Ld = function () {
                                                        return q() && i < 10
                                                    };
                                                    d.de = function (d, a) {
                                                        if (a)
                                                            d.style.clip = "rect(" + c.round(a.e) + "px " + c.round(a.u) + "px " + c.round(a.v) + "px " + c.round(a.f) + "px)";
                                                        else {
                                                            var g = d.style.cssText, f = [new RegExp(/[\s]*clip: rect\(.*?\)[;]?/i), new RegExp(/[\s]*cliptop: .*?[;]?/i), new RegExp(/[\s]*clipright: .*?[;]?/i), new RegExp(/[\s]*clipbottom: .*?[;]?/i), new RegExp(/[\s]*clipleft: .*?[;]?/i)], e = I(g, f, "");
                                                            b.Wb(d, e)
                                                        }
                                                    };
                                                    d.Y = function () {
                                                        return +new Date
                                                    };
                                                    d.O = function (b, a) {
                                                        b.appendChild(a)
                                                    };
                                                    d.Rb = function (b, a, c) {
                                                        (c || a.parentNode).insertBefore(b, a)
                                                    };
                                                    d.Qb = function (b, a) {
                                                        a = a || b.parentNode;
                                                        a && a.removeChild(b)
                                                    };
                                                    d.be = function (a, b) {
                                                        n(a, function (a) {
                                                            d.Qb(a, b)
                                                        })
                                                    };
                                                    d.Wc = function (a) {
                                                        d.be(d.Xb(a, e), a)
                                                    };
                                                    d.ae = function (a, b) {
                                                        var c = d.Dd(a);
                                                        b & 1 && d.N(a, (d.q(c) - d.q(a)) / 2);
                                                        b & 2 && d.M(a, (d.r(c) - d.r(a)) / 2)
                                                    };
                                                    d.Zd = function (b, a) {
                                                        return parseInt(b, a || 10)
                                                    };
                                                    d.Yd = p;
                                                    d.df = function (b, a) {
                                                        var c = g.body;
                                                        while (a && b !== a && c !== a)
                                                            try {
                                                                a = a.parentNode
                                                            } catch (d) {
                                                                return l
                                                            }
                                                        return b === a
                                                    };
                                                    function Y(e, c, b) {
                                                        var a = e.cloneNode(!c);
                                                        !b && d.Ud(a, "id");
                                                        return a
                                                    }
                                                    d.gb = Y;
                                                    d.Cb = function (f, g) {
                                                        var a = new Image;
                                                        function b(f, e) {
                                                            d.Q(a, "load", b);
                                                            d.Q(a, "abort", c);
                                                            d.Q(a, "error", c);
                                                            g && g(a, e)
                                                        }
                                                        function c(a) {
                                                            b(a, e)
                                                        }
                                                        if (kb() && i < 11.6 || !f)
                                                            b(!f);
                                                        else {
                                                            d.g(a, "load", b);
                                                            d.g(a, "abort", c);
                                                            d.g(a, "error", c);
                                                            a.src = f
                                                        }
                                                    };
                                                    d.Xd = function (e, a, f) {
                                                        var c = e.length + 1;
                                                        function b(b) {
                                                            c--;
                                                            if (a && b && b.src == a.src)
                                                                a = b;
                                                            !c && f && f(a)
                                                        }
                                                        n(e, function (a) {
                                                            d.Cb(a.src, b)
                                                        });
                                                        b()
                                                    };
                                                    d.Wd = function (a, g, i, h) {
                                                        if (h)
                                                            a = Y(a);
                                                        var c = T(a, g);
                                                        if (!c.length)
                                                            c = b.Ue(a, g);
                                                        for (var f = c.length - 1; f > -1; f--) {
                                                            var d = c[f], e = Y(i);
                                                            x(e, x(d));
                                                            b.Wb(e, d.style.cssText);
                                                            b.Rb(e, d);
                                                            b.Qb(d)
                                                        }
                                                        return a
                                                    };
                                                    function Ib(a) {
                                                        var l = this, p = "", r = ["av", "pv", "ds", "dn"], f = [], q, j = 0, h = 0, e = 0;
                                                        function i() {
                                                            E(a, q, f[e || j || h & 2 || h]);
                                                            b.fb(a, "pointer-events", e ? "none" : "")
                                                        }
                                                        function c() {
                                                            j = 0;
                                                            i();
                                                            d.Q(g, "mouseup", c);
                                                            d.Q(g, "touchend", c);
                                                            d.Q(g, "touchcancel", c)
                                                        }
                                                        function o(a) {
                                                            if (e)
                                                                d.Zb(a);
                                                            else {
                                                                j = 4;
                                                                i();
                                                                d.g(g, "mouseup", c);
                                                                d.g(g, "touchend", c);
                                                                d.g(g, "touchcancel", c)
                                                            }
                                                        }
                                                        l.ee = function (a) {
                                                            if (a === k)
                                                                return h;
                                                            h = a & 2 || a & 1;
                                                            i()
                                                        };
                                                        l.ed = function (a) {
                                                            if (a === k)
                                                                return!e;
                                                            e = a ? 0 : 3;
                                                            i()
                                                        };
                                                        l.rb = a = d.Bb(a);
                                                        var m = b.fe(x(a));
                                                        if (m)
                                                            p = m.shift();
                                                        n(r, function (a) {
                                                            f.push(p + a)
                                                        });
                                                        q = cb(" ", f);
                                                        f.unshift("");
                                                        d.g(a, "mousedown", o);
                                                        d.g(a, "touchstart", o)
                                                    }
                                                    d.Cc = function (a) {
                                                        return new Ib(a)
                                                    };
                                                    d.fb = D;
                                                    d.qb = m("overflow");
                                                    d.M = m("top", 2);
                                                    d.N = m("left", 2);
                                                    d.q = m("width", 2);
                                                    d.r = m("height", 2);
                                                    d.Vd = m("marginLeft", 2);
                                                    d.Kd = m("marginTop", 2);
                                                    d.F = m("position");
                                                    d.W = m("display");
                                                    d.L = m("zIndex", 1);
                                                    d.Jb = function (b, a, c) {
                                                        if (a != k)
                                                            Gb(b, a, c);
                                                        else
                                                            return Eb(b)
                                                    };
                                                    d.Wb = function (a, b) {
                                                        if (b != k)
                                                            a.style.cssText = b;
                                                        else
                                                            return a.style.cssText
                                                    };
                                                    var U = {a: d.Jb, e: d.M, f: d.N, ib: d.q, bb: d.r, Fb: d.F, If: d.W, V: d.L};
                                                    function w(g, l) {
                                                        var f = P(), b = K(), e = wb(), h = L(g);
                                                        function i(b, d, a) {
                                                            var e = b.ub(u(-d / 2, -a / 2)), f = b.ub(u(d / 2, -a / 2)), g = b.ub(u(d / 2, a / 2)), h = b.ub(u(-d / 2, a / 2));
                                                            b.ub(u(300, 300));
                                                            return u(c.min(e.x, f.x, g.x, h.x) + d / 2, c.min(e.y, f.y, g.y, h.y) + a / 2)
                                                        }
                                                        function a(e, a) {
                                                            a = a || {};
                                                            var g = a.db || 0, l = (a.eb || 0) % 360, m = (a.cb || 0) % 360, o = (a.U || 0) % 360, p = a.Hf;
                                                            if (f) {
                                                                g = 0;
                                                                l = 0;
                                                                m = 0;
                                                                p = 0
                                                            }
                                                            var c = new Db(a.nb, a.pb, g);
                                                            c.eb(l);
                                                            c.cb(m);
                                                            c.Td(o);
                                                            c.Sd(a.Tb, a.Ub);
                                                            c.yc(a.A, a.D, p);
                                                            if (b) {
                                                                c.ob(a.Hb, a.Ib);
                                                                e.style[h] = c.Rd()
                                                            } else if (!W || W < 9) {
                                                                var j = "";
                                                                if (o || a.A != k && a.A != 1 || a.D != k && a.D != 1) {
                                                                    var n = i(c, a.kb, a.mb);
                                                                    d.Kd(e, n.y);
                                                                    d.Vd(e, n.x);
                                                                    j = c.Qd()
                                                                }
                                                                var r = e.style.filter, s = new RegExp(/[\s]*progid:DXImageTransform\.Microsoft\.Matrix\([^\)]*\)/g), q = I(r, [s], j);
                                                                ub(e, q)
                                                            }
                                                        }
                                                        w = function (f, c) {
                                                            c = c || {};
                                                            var h = c.Hb, i = c.Ib, g;
                                                            n(U, function (a, b) {
                                                                g = c[b];
                                                                g !== k && a(f, g)
                                                            });
                                                            d.de(f, c.c);
                                                            if (!b) {
                                                                h != k && d.N(f, c.Xc + h);
                                                                i != k && d.M(f, c.Dc + i)
                                                            }
                                                            if (c.Pd)
                                                                if (e)
                                                                    sb(d.S(j, N, f, c));
                                                                else
                                                                    a(f, c)
                                                        };
                                                        d.wb = N;
                                                        if (e)
                                                            d.wb = w;
                                                        if (f)
                                                            d.wb = a;
                                                        else if (!b)
                                                            a = N;
                                                        d.K = w;
                                                        w(g, l)
                                                    }
                                                    d.wb = w;
                                                    d.K = w;
                                                    function Db(i, l, p) {
                                                        var d = this, b = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, i || 0, l || 0, p || 0, 1], h = c.sin, g = c.cos, m = c.tan;
                                                        function f(a) {
                                                            return a * c.PI / 180
                                                        }
                                                        function o(a, b) {
                                                            return{x: a, y: b}
                                                        }
                                                        function n(c, e, l, m, o, r, t, u, w, z, A, C, E, b, f, k, a, g, i, n, p, q, s, v, x, y, B, D, F, d, h, j) {
                                                            return[c * a + e * p + l * x + m * F, c * g + e * q + l * y + m * d, c * i + e * s + l * B + m * h, c * n + e * v + l * D + m * j, o * a + r * p + t * x + u * F, o * g + r * q + t * y + u * d, o * i + r * s + t * B + u * h, o * n + r * v + t * D + u * j, w * a + z * p + A * x + C * F, w * g + z * q + A * y + C * d, w * i + z * s + A * B + C * h, w * n + z * v + A * D + C * j, E * a + b * p + f * x + k * F, E * g + b * q + f * y + k * d, E * i + b * s + f * B + k * h, E * n + b * v + f * D + k * j]
                                                        }
                                                        function e(c, a) {
                                                            return n.apply(j, (a || b).concat(c))
                                                        }
                                                        d.yc = function (a, c, d) {
                                                            if (a == k)
                                                                a = 1;
                                                            if (c == k)
                                                                c = 1;
                                                            if (d == k)
                                                                d = 1;
                                                            if (a != 1 || c != 1 || d != 1)
                                                                b = e([a, 0, 0, 0, 0, c, 0, 0, 0, 0, d, 0, 0, 0, 0, 1])
                                                        };
                                                        d.ob = function (a, c, d) {
                                                            b[12] += a || 0;
                                                            b[13] += c || 0;
                                                            b[14] += d || 0
                                                        };
                                                        d.eb = function (c) {
                                                            if (c) {
                                                                a = f(c);
                                                                var d = g(a), i = h(a);
                                                                b = e([1, 0, 0, 0, 0, d, i, 0, 0, -i, d, 0, 0, 0, 0, 1])
                                                            }
                                                        };
                                                        d.cb = function (c) {
                                                            if (c) {
                                                                a = f(c);
                                                                var d = g(a), i = h(a);
                                                                b = e([d, 0, -i, 0, 0, 1, 0, 0, i, 0, d, 0, 0, 0, 0, 1])
                                                            }
                                                        };
                                                        d.Td = function (c) {
                                                            if (c) {
                                                                a = f(c);
                                                                var d = g(a), i = h(a);
                                                                b = e([d, i, 0, 0, -i, d, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1])
                                                            }
                                                        };
                                                        d.Sd = function (a, c) {
                                                            if (a || c) {
                                                                i = f(a);
                                                                l = f(c);
                                                                b = e([1, m(l), 0, 0, m(i), 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1])
                                                            }
                                                        };
                                                        d.ub = function (c) {
                                                            var a = e(b, [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, c.x, c.y, 0, 1]);
                                                            return o(a[12], a[13])
                                                        };
                                                        d.Rd = function () {
                                                            return"matrix3d(" + b.join(",") + ")"
                                                        };
                                                        d.Qd = function () {
                                                            return"progid:DXImageTransform.Microsoft.Matrix(M11=" + b[0] + ", M12=" + b[4] + ", M21=" + b[1] + ", M22=" + b[5] + ", SizingMethod='auto expand')"
                                                        }
                                                    }
                                                    new function () {
                                                        var a = this;
                                                        function b(d, g) {
                                                            for (var j = d[0].length, i = d.length, h = g[0].length, f = [], c = 0; c < i; c++)
                                                                for (var k = f[c] = [], b = 0; b < h; b++) {
                                                                    for (var e = 0, a = 0; a < j; a++)
                                                                        e += d[c][a] * g[a][b];
                                                                    k[b] = e
                                                                }
                                                            return f
                                                        }
                                                        a.A = function (b, c) {
                                                            return a.nd(b, c, 0)
                                                        };
                                                        a.D = function (b, c) {
                                                            return a.nd(b, 0, c)
                                                        };
                                                        a.nd = function (a, c, d) {
                                                            return b(a, [[c, 0], [0, d]])
                                                        };
                                                        a.ub = function (d, c) {
                                                            var a = b(d, [[c.x], [c.y]]);
                                                            return u(a[0][0], a[1][0])
                                                        }
                                                    };
                                                    var O = {Xc: 0, Dc: 0, Hb: 0, Ib: 0, I: 1, A: 1, D: 1, U: 0, eb: 0, cb: 0, nb: 0, pb: 0, db: 0, Tb: 0, Ub: 0};
                                                    d.Mc = function (a) {
                                                        var c = a || {};
                                                        if (a)
                                                            if (b.id(a))
                                                                c = {ic: c};
                                                            else if (b.id(a.c))
                                                                c.c = {ic: a.c};
                                                        return c
                                                    };
                                                    d.Ad = function (l, m, w, n, y, z, o) {
                                                        var a = m;
                                                        if (l) {
                                                            a = {};
                                                            for (var g in m) {
                                                                var A = z[g] || 1, v = y[g] || [0, 1], d = (w - v[0]) / v[1];
                                                                d = c.min(c.max(d, 0), 1);
                                                                d = d * A;
                                                                var u = c.floor(d);
                                                                if (d != u)
                                                                    d -= u;
                                                                var h = n.ic || f.Pc, i, B = l[g], q = m[g];
                                                                if (b.fd(q)) {
                                                                    h = n[g] || h;
                                                                    var x = h(d);
                                                                    i = B + q * x
                                                                } else {
                                                                    i = b.G({Vb: {}}, l[g]);
                                                                    b.j(q.Vb || q, function (e, a) {
                                                                        if (n.c)
                                                                            h = n.c[a] || n.c.ic || h;
                                                                        var c = h(d), b = e * c;
                                                                        i.Vb[a] = b;
                                                                        i[a] += b
                                                                    })
                                                                }
                                                                a[g] = i
                                                            }
                                                            var t = b.j(m, function (b, a) {
                                                                return O[a] != k
                                                            });
                                                            t && b.j(O, function (c, b) {
                                                                if (a[b] == k && l[b] !== k)
                                                                    a[b] = l[b]
                                                            });
                                                            if (t) {
                                                                if (a.I)
                                                                    a.A = a.D = a.I;
                                                                a.kb = o.kb;
                                                                a.mb = o.mb;
                                                                a.Pd = e
                                                            }
                                                        }
                                                        if (m.c && o.ob) {
                                                            var p = a.c.Vb, s = (p.e || 0) + (p.v || 0), r = (p.f || 0) + (p.u || 0);
                                                            a.f = (a.f || 0) + r;
                                                            a.e = (a.e || 0) + s;
                                                            a.c.f -= r;
                                                            a.c.u -= r;
                                                            a.c.e -= s;
                                                            a.c.v -= s
                                                        }
                                                        if (a.c && b.Ld() && !a.c.e && !a.c.f && a.c.u == o.kb && a.c.v == o.mb)
                                                            a.c = j;
                                                        return a
                                                    }
                                                };
                                                function n() {
                                                    var a = this, d = [];
                                                    function i(a, b) {
                                                        d.push({Bc: a, rc: b})
                                                    }
                                                    function g(a, c) {
                                                        b.j(d, function (b, e) {
                                                            b.Bc == a && b.rc === c && d.splice(e, 1)
                                                        })
                                                    }
                                                    a.Gb = a.addEventListener = i;
                                                    a.removeEventListener = g;
                                                    a.o = function (a) {
                                                        var c = [].slice.call(arguments, 1);
                                                        b.j(d, function (b) {
                                                            b.Bc == a && b.rc.apply(h, c)
                                                        })
                                                    }
                                                }
                                                var m = function (z, C, i, J, M, L) {
                                                    z = z || 0;
                                                    var a = this, q, n, o, u, A = 0, G, H, F, B, y = 0, g = 0, m = 0, D, k, f, d, p, w = [], x;
                                                    function O(a) {
                                                        f += a;
                                                        d += a;
                                                        k += a;
                                                        g += a;
                                                        m += a;
                                                        y += a
                                                    }
                                                    function t(o) {
                                                        var h = o;
                                                        if (p && (h >= d || h <= f))
                                                            h = ((h - f) % p + p) % p + f;
                                                        if (!D || u || g != h) {
                                                            var j = c.min(h, d);
                                                            j = c.max(j, f);
                                                            if (!D || u || j != m) {
                                                                if (L) {
                                                                    var l = (j - k) / (C || 1);
                                                                    if (i.pd)
                                                                        l = 1 - l;
                                                                    var n = b.Ad(M, L, l, G, F, H, i);
                                                                    if (x)
                                                                        b.j(n, function (b, a) {
                                                                            x[a] && x[a](J, b)
                                                                        });
                                                                    else
                                                                        b.K(J, n)
                                                                }
                                                                a.ec(m - k, j - k);
                                                                m = j;
                                                                b.j(w, function (b, c) {
                                                                    var a = o < g ? w[w.length - c - 1] : b;
                                                                    a.ab(m - y)
                                                                });
                                                                var r = g, q = m;
                                                                g = h;
                                                                D = e;
                                                                a.Nb(r, q)
                                                            }
                                                        }
                                                    }
                                                    function E(a, b, e) {
                                                        b && a.Kb(d);
                                                        if (!e) {
                                                            f = c.min(f, a.vd() + y);
                                                            d = c.max(d, a.fc() + y)
                                                        }
                                                        w.push(a)
                                                    }
                                                    var r = h.requestAnimationFrame || h.webkitRequestAnimationFrame || h.mozRequestAnimationFrame || h.msRequestAnimationFrame;
                                                    if (b.rf() && b.wd() < 7)
                                                        r = j;
                                                    r = r || function (a) {
                                                        b.P(a, i.hb)
                                                    };
                                                    function I() {
                                                        if (q) {
                                                            var d = b.Y(), e = c.min(d - A, i.xd), a = g + e * o;
                                                            A = d;
                                                            if (a * o >= n * o)
                                                                a = n;
                                                            t(a);
                                                            if (!u && a * o >= n * o)
                                                                K(B);
                                                            else
                                                                r(I)
                                                        }
                                                    }
                                                    function s(h, i, j) {
                                                        if (!q) {
                                                            q = e;
                                                            u = j;
                                                            B = i;
                                                            h = c.max(h, f);
                                                            h = c.min(h, d);
                                                            n = h;
                                                            o = n < g ? -1 : 1;
                                                            a.Bd();
                                                            A = b.Y();
                                                            r(I)
                                                        }
                                                    }
                                                    function K(b) {
                                                        if (q) {
                                                            u = q = B = l;
                                                            a.dd();
                                                            b && b()
                                                        }
                                                    }
                                                    a.Gc = function (a, b, c) {
                                                        s(a ? g + a : d, b, c)
                                                    };
                                                    a.Hc = s;
                                                    a.vb = K;
                                                    a.Md = function (a) {
                                                        s(a)
                                                    };
                                                    a.X = function () {
                                                        return g
                                                    };
                                                    a.Zc = function () {
                                                        return n
                                                    };
                                                    a.yb = function () {
                                                        return m
                                                    };
                                                    a.ab = t;
                                                    a.ob = function (a) {
                                                        t(g + a)
                                                    };
                                                    a.Fc = function () {
                                                        return q
                                                    };
                                                    a.Te = function (a) {
                                                        p = a
                                                    };
                                                    a.Kb = O;
                                                    a.Sc = function (a, b) {
                                                        E(a, 0, b)
                                                    };
                                                    a.dc = function (a) {
                                                        E(a, 1)
                                                    };
                                                    a.vd = function () {
                                                        return f
                                                    };
                                                    a.fc = function () {
                                                        return d
                                                    };
                                                    a.Nb = a.Bd = a.dd = a.ec = b.Qc;
                                                    a.oc = b.Y();
                                                    i = b.G({hb: 16, xd: 50}, i);
                                                    p = i.Jc;
                                                    x = i.Nd;
                                                    f = k = z;
                                                    d = z + C;
                                                    H = i.gd || {};
                                                    F = i.B || {};
                                                    G = b.Mc(i.i)
                                                };
                                                var p = new function () {
                                                    var h = this;
                                                    function g(b, a, c) {
                                                        c.push(a);
                                                        b[a] = b[a] || [];
                                                        b[a].push(c)
                                                    }
                                                    h.ce = function (d) {
                                                        for (var e = [], a, b = 0; b < d.C; b++)
                                                            for (a = 0; a < d.n; a++)
                                                                g(e, c.ceil(1e5 * c.random()) % 13, [b, a]);
                                                        return e
                                                    }
                                                }, s = function (k, s, q, t, y) {
                                                    var d = this, u, g, a, x = 0, w = t.Jd, r, h = 8;
                                                    function i(g, d) {
                                                        var a = {hb: d, k: 1, P: 0, n: 1, C: 1, a: 0, I: 0, c: 0, ob: l, s: l, pd: l, je: p.ce, z: {Z: 0, jb: 0}, i: f.Pc, gd: {}, ac: [], B: {}};
                                                        b.G(a, g);
                                                        a.i = b.Mc(a.i);
                                                        a.he = c.ceil(a.k / a.hb);
                                                        a.kf = function (c, b) {
                                                            c /= a.n;
                                                            b /= a.C;
                                                            var f = c + "x" + b;
                                                            if (!a.ac[f]) {
                                                                a.ac[f] = {ib: c, bb: b};
                                                                for (var d = 0; d < a.n; d++)
                                                                    for (var e = 0; e < a.C; e++)
                                                                        a.ac[f][e + "," + d] = {e: e * b, u: d * c + c, v: e * b + b, f: d * c}
                                                            }
                                                            return a.ac[f]
                                                        };
                                                        if (a.lc) {
                                                            a.lc = i(a.lc, d);
                                                            a.s = e
                                                        }
                                                        return a
                                                    }
                                                    function o(B, h, a, w, o, m) {
                                                        var z = this, u, v = {}, i = {}, n = [], f, d, s, q = a.z.Z || 0, r = a.z.jb || 0, g = a.kf(o, m), p = C(a), D = p.length - 1, t = a.k + a.P * D, x = w + t, k = a.s, y;
                                                        x += 50;
                                                        function C(a) {
                                                            var b = a.je(a);
                                                            return a.pd ? b.reverse() : b
                                                        }
                                                        z.td = x;
                                                        z.Yb = function (d) {
                                                            d -= w;
                                                            var e = d < t;
                                                            if (e || y) {
                                                                y = e;
                                                                if (!k)
                                                                    d = t - d;
                                                                var f = c.ceil(d / a.hb);
                                                                b.j(i, function (a, e) {
                                                                    var d = c.max(f, a.cf);
                                                                    d = c.min(d, a.length - 1);
                                                                    if (a.Lc != d) {
                                                                        if (!a.Lc && !k)
                                                                            b.H(n[e]);
                                                                        else
                                                                            d == a.ef && k && b.T(n[e]);
                                                                        a.Lc = d;
                                                                        b.K(n[e], a[d])
                                                                    }
                                                                })
                                                            }
                                                        };
                                                        h = b.gb(h);
                                                        b.wb(h, j);
                                                        if (b.tb()) {
                                                            var E = !h["no-image"], A = b.Ze(h);
                                                            b.j(A, function (a) {
                                                                (E || a["jssor-slider"]) && b.Jb(a, b.Jb(a), e)
                                                            })
                                                        }
                                                        b.j(p, function (h, j) {
                                                            b.j(h, function (G) {
                                                                var K = G[0], J = G[1], t = K + "," + J, n = l, p = l, x = l;
                                                                if (q && J % 2) {
                                                                    if (q & 3)
                                                                        n = !n;
                                                                    if (q & 12)
                                                                        p = !p;
                                                                    if (q & 16)
                                                                        x = !x
                                                                }
                                                                if (r && K % 2) {
                                                                    if (r & 3)
                                                                        n = !n;
                                                                    if (r & 12)
                                                                        p = !p;
                                                                    if (r & 16)
                                                                        x = !x
                                                                }
                                                                a.e = a.e || a.c & 4;
                                                                a.v = a.v || a.c & 8;
                                                                a.f = a.f || a.c & 1;
                                                                a.u = a.u || a.c & 2;
                                                                var E = p ? a.v : a.e, B = p ? a.e : a.v, D = n ? a.u : a.f, C = n ? a.f : a.u;
                                                                a.c = E || B || D || C;
                                                                s = {};
                                                                d = {e: 0, f: 0, a: 1, ib: o, bb: m};
                                                                f = b.G({}, d);
                                                                u = b.G({}, g[t]);
                                                                if (a.a)
                                                                    d.a = 2 - a.a;
                                                                if (a.V) {
                                                                    d.V = a.V;
                                                                    f.V = 0
                                                                }
                                                                var I = a.n * a.C > 1 || a.c;
                                                                if (a.I || a.U) {
                                                                    var H = e;
                                                                    if (b.tb())
                                                                        if (a.n * a.C > 1)
                                                                            H = l;
                                                                        else
                                                                            I = l;
                                                                    if (H) {
                                                                        d.I = a.I ? a.I - 1 : 1;
                                                                        f.I = 1;
                                                                        if (b.tb() || b.qd())
                                                                            d.I = c.min(d.I, 2);
                                                                        var N = a.U || 0;
                                                                        d.U = N * 360 * (x ? -1 : 1);
                                                                        f.U = 0
                                                                    }
                                                                }
                                                                if (I) {
                                                                    var h = u.Vb = {};
                                                                    if (a.c) {
                                                                        var w = a.zf || 1;
                                                                        if (E && B) {
                                                                            h.e = g.bb / 2 * w;
                                                                            h.v = -h.e
                                                                        } else if (E)
                                                                            h.v = -g.bb * w;
                                                                        else if (B)
                                                                            h.e = g.bb * w;
                                                                        if (D && C) {
                                                                            h.f = g.ib / 2 * w;
                                                                            h.u = -h.f
                                                                        } else if (D)
                                                                            h.u = -g.ib * w;
                                                                        else if (C)
                                                                            h.f = g.ib * w
                                                                    }
                                                                    s.c = u;
                                                                    f.c = g[t]
                                                                }
                                                                var L = n ? 1 : -1, M = p ? 1 : -1;
                                                                if (a.x)
                                                                    d.f += o * a.x * L;
                                                                if (a.y)
                                                                    d.e += m * a.y * M;
                                                                b.j(d, function (a, c) {
                                                                    if (b.fd(a))
                                                                        if (a != f[c])
                                                                            s[c] = a - f[c]
                                                                });
                                                                v[t] = k ? f : d;
                                                                var F = a.he, A = c.round(j * a.P / a.hb);
                                                                i[t] = new Array(A);
                                                                i[t].cf = A;
                                                                i[t].ef = A + F - 1;
                                                                for (var z = 0; z <= F; z++) {
                                                                    var y = b.Ad(f, s, z / F, a.i, a.B, a.gd, {ob: a.ob, kb: o, mb: m});
                                                                    y.V = y.V || 1;
                                                                    i[t].push(y)
                                                                }
                                                            })
                                                        });
                                                        p.reverse();
                                                        b.j(p, function (a) {
                                                            b.j(a, function (c) {
                                                                var f = c[0], e = c[1], d = f + "," + e, a = h;
                                                                if (e || f)
                                                                    a = b.gb(h);
                                                                b.K(a, v[d]);
                                                                b.qb(a, "hidden");
                                                                b.F(a, "absolute");
                                                                B.hf(a);
                                                                n[d] = a;
                                                                b.H(a, !k)
                                                            })
                                                        })
                                                    }
                                                    function v() {
                                                        var b = this, c = 0;
                                                        m.call(b, 0, u);
                                                        b.Nb = function (d, b) {
                                                            if (b - c > h) {
                                                                c = b;
                                                                a && a.Yb(b);
                                                                g && g.Yb(b)
                                                            }
                                                        };
                                                        b.Tc = r
                                                    }
                                                    d.tf = function () {
                                                        var a = 0, b = t.xb, d = b.length;
                                                        if (w)
                                                            a = x++ % d;
                                                        else
                                                            a = c.floor(c.random() * d);
                                                        b[a] && (b[a].sb = a);
                                                        return b[a]
                                                    };
                                                    d.bf = function (w, x, l, m, b) {
                                                        r = b;
                                                        b = i(b, h);
                                                        var j = m.cd, f = l.cd;
                                                        j["no-image"] = !m.Sb;
                                                        f["no-image"] = !l.Sb;
                                                        var n = j, p = f, v = b, e = b.lc || i({}, h);
                                                        if (!b.s) {
                                                            n = f;
                                                            p = j
                                                        }
                                                        var t = e.Kb || 0;
                                                        g = new o(k, p, e, c.max(t - e.hb, 0), s, q);
                                                        a = new o(k, n, v, c.max(e.hb - t, 0), s, q);
                                                        g.Yb(0);
                                                        a.Yb(0);
                                                        u = c.max(g.td, a.td);
                                                        d.sb = w
                                                    };
                                                    d.Ab = function () {
                                                        k.Ab();
                                                        g = j;
                                                        a = j
                                                    };
                                                    d.Ve = function () {
                                                        var b = j;
                                                        if (a)
                                                            b = new v;
                                                        return b
                                                    };
                                                    if (b.tb() || b.qd() || y && b.xf() < 537)
                                                        h = 16;
                                                    n.call(d);
                                                    m.call(d, -1e7, 1e7)
                                                }, i = function (p, fc) {
                                                    var d = this;
                                                    function Bc() {
                                                        var a = this;
                                                        m.call(a, -1e8, 2e8);
                                                        a.wf = function () {
                                                            var b = a.yb(), d = c.floor(b), f = t(d), e = b - c.floor(b);
                                                            return{sb: f, vf: d, Fb: e}
                                                        };
                                                        a.Nb = function (b, a) {
                                                            var f = c.floor(a);
                                                            if (f != a && a > b)
                                                                f++;
                                                            Ub(f, e);
                                                            d.o(i.sf, t(a), t(b), a, b)
                                                        }
                                                    }
                                                    function Ac() {
                                                        var a = this;
                                                        m.call(a, 0, 0, {Jc: q});
                                                        b.j(C, function (b) {
                                                            D & 1 && b.Te(q);
                                                            a.dc(b);
                                                            b.Kb(ib / bc)
                                                        })
                                                    }
                                                    function zc() {
                                                        var a = this, b = Tb.rb;
                                                        m.call(a, -1, 2, {i: f.ad, Nd: {Fb: Zb}, Jc: q}, b, {Fb: 1}, {Fb: -2});
                                                        a.Mb = b
                                                    }
                                                    function nc(o, n) {
                                                        var b = this, f, g, h, k, c;
                                                        m.call(b, -1e8, 2e8, {xd: 100});
                                                        b.Bd = function () {
                                                            M = e;
                                                            S = j;
                                                            d.o(i.qf, t(w.X()), w.X())
                                                        };
                                                        b.dd = function () {
                                                            M = l;
                                                            k = l;
                                                            var a = w.wf();
                                                            d.o(i.pf, t(w.X()), w.X());
                                                            !a.Fb && Dc(a.vf, s)
                                                        };
                                                        b.Nb = function (i, e) {
                                                            var b;
                                                            if (k)
                                                                b = c;
                                                            else {
                                                                b = g;
                                                                if (h) {
                                                                    var d = e / h;
                                                                    b = a.nf(d) * (g - f) + f
                                                                }
                                                            }
                                                            w.ab(b)
                                                        };
                                                        b.Lb = function (a, d, c, e) {
                                                            f = a;
                                                            g = d;
                                                            h = c;
                                                            w.ab(a);
                                                            b.ab(0);
                                                            b.Hc(c, e)
                                                        };
                                                        b.ff = function (a) {
                                                            k = e;
                                                            c = a;
                                                            b.Gc(a, j, e)
                                                        };
                                                        b.Re = function (a) {
                                                            c = a
                                                        };
                                                        w = new Bc;
                                                        w.Sc(o);
                                                        w.Sc(n)
                                                    }
                                                    function pc() {
                                                        var c = this, a = Xb();
                                                        b.L(a, 0);
                                                        b.fb(a, "pointerEvents", "none");
                                                        c.rb = a;
                                                        c.hf = function (c) {
                                                            b.O(a, c);
                                                            b.H(a)
                                                        };
                                                        c.Ab = function () {
                                                            b.T(a);
                                                            b.Wc(a)
                                                        }
                                                    }
                                                    function xc(o, g) {
                                                        var f = this, r, L, v, k, y = [], x, B, W, G, Q, F, h, w, p;
                                                        m.call(f, -u, u + 1, {});
                                                        function E(a) {
                                                            r && r.bd();
                                                            T(o, a, 0);
                                                            F = e;
                                                            r = new I.R(o, I, b.Yd(b.p(o, "idle")) || lc);
                                                            r.ab(0)
                                                        }
                                                        function Z() {
                                                            r.oc < I.oc && E()
                                                        }
                                                        function M(p, r, o) {
                                                            if (!G) {
                                                                G = e;
                                                                if (k && o) {
                                                                    var h = o.width, c = o.height, n = h, m = c;
                                                                    if (h && c && a.Db) {
                                                                        if (a.Db & 3 && (!(a.Db & 4) || h > K || c > J)) {
                                                                            var j = l, q = K / J * c / h;
                                                                            if (a.Db & 1)
                                                                                j = q > 1;
                                                                            else if (a.Db & 2)
                                                                                j = q < 1;
                                                                            n = j ? h * J / c : K;
                                                                            m = j ? J : c * K / h
                                                                        }
                                                                        b.q(k, n);
                                                                        b.r(k, m);
                                                                        b.M(k, (J - m) / 2);
                                                                        b.N(k, (K - n) / 2)
                                                                    }
                                                                    b.F(k, "absolute");
                                                                    d.o(i.ye, g)
                                                                }
                                                            }
                                                            b.T(r);
                                                            p && p(f)
                                                        }
                                                        function Y(b, c, d, e) {
                                                            if (e == S && s == g && N)
                                                                if (!Cc) {
                                                                    var a = t(b);
                                                                    A.bf(a, g, c, f, d);
                                                                    c.we();
                                                                    U.Kb(a - U.vd() - 1);
                                                                    U.ab(a);
                                                                    z.Lb(b, b, 0)
                                                                }
                                                        }
                                                        function cb(b) {
                                                            if (b == S && s == g) {
                                                                if (!h) {
                                                                    var a = j;
                                                                    if (A)
                                                                        if (A.sb == g)
                                                                            a = A.Ve();
                                                                        else
                                                                            A.Ab();
                                                                    Z();
                                                                    h = new vc(o, g, a, r);
                                                                    h.ld(p)
                                                                }
                                                                !h.Fc() && h.zc()
                                                            }
                                                        }
                                                        function R(d, e, l) {
                                                            if (d == g) {
                                                                if (d != e)
                                                                    C[e] && C[e].ve();
                                                                else
                                                                    !l && h && h.ue();
                                                                p && p.ed();
                                                                var m = S = b.Y();
                                                                f.Cb(b.S(j, cb, m))
                                                            } else {
                                                                var k = c.min(g, d), i = c.max(g, d), o = c.min(i - k, k + q - i), n = u + a.te - 1;
                                                                (!Q || o <= n) && f.Cb()
                                                            }
                                                        }
                                                        function db() {
                                                            if (s == g && h) {
                                                                h.vb();
                                                                p && p.se();
                                                                p && p.re();
                                                                h.yd()
                                                            }
                                                        }
                                                        function eb() {
                                                            s == g && h && h.vb()
                                                        }
                                                        function ab(a) {
                                                            !P && d.o(i.qe, g, a)
                                                        }
                                                        function O() {
                                                            p = w.pInstance;
                                                            h && h.ld(p)
                                                        }
                                                        f.Cb = function (c, a) {
                                                            a = a || v;
                                                            if (y.length && !G) {
                                                                b.H(a);
                                                                if (!W) {
                                                                    W = e;
                                                                    d.o(i.pe, g);
                                                                    b.j(y, function (a) {
                                                                        if (!b.J(a, "src")) {
                                                                            a.src = b.p(a, "src2");
                                                                            b.W(a, a["display-origin"])
                                                                        }
                                                                    })
                                                                }
                                                                b.Xd(y, k, b.S(j, M, c, a))
                                                            } else
                                                                M(c, a)
                                                        };
                                                        f.oe = function () {
                                                            var h = g;
                                                            if (a.Hd < 0)
                                                                h -= q;
                                                            var d = h + a.Hd * tc;
                                                            if (D & 2)
                                                                d = t(d);
                                                            if (!(D & 1))
                                                                d = c.max(0, c.min(d, q - u));
                                                            if (d != g) {
                                                                if (A) {
                                                                    var e = A.tf(q);
                                                                    if (e) {
                                                                        var i = S = b.Y(), f = C[t(d)];
                                                                        return f.Cb(b.S(j, Y, d, f, e, i), v)
                                                                    }
                                                                }
                                                                bb(d)
                                                            }
                                                        };
                                                        f.Ac = function () {
                                                            R(g, g, e)
                                                        };
                                                        f.ve = function () {
                                                            p && p.se();
                                                            p && p.re();
                                                            f.sd();
                                                            h && h.ne();
                                                            h = j;
                                                            E()
                                                        };
                                                        f.we = function () {
                                                            b.T(o)
                                                        };
                                                        f.sd = function () {
                                                            b.H(o)
                                                        };
                                                        f.me = function () {
                                                            p && p.ed()
                                                        };
                                                        function T(a, c, d) {
                                                            if (b.J(a, "jssor-slider"))
                                                                return;
                                                            if (!F) {
                                                                if (a.tagName == "IMG") {
                                                                    y.push(a);
                                                                    if (!b.J(a, "src")) {
                                                                        Q = e;
                                                                        a["display-origin"] = b.W(a);
                                                                        b.T(a)
                                                                    }
                                                                }
                                                                b.tb() && b.L(a, (b.L(a) || 0) + 1)
                                                            }
                                                            var f = b.Xb(a);
                                                            b.j(f, function (f) {
                                                                var h = f.tagName, i = b.p(f, "u");
                                                                if (i == "player" && !w) {
                                                                    w = f;
                                                                    if (w.pInstance)
                                                                        O();
                                                                    else
                                                                        b.g(w, "dataavailable", O)
                                                                }
                                                                if (i == "caption") {
                                                                    if (c) {
                                                                        b.Oc(f, b.p(f, "to"));
                                                                        b.lf(f, b.p(f, "bf"));
                                                                        b.p(f, "3d") && b.We(f, "preserve-3d")
                                                                    } else if (!b.md()) {
                                                                        var g = b.gb(f, l, e);
                                                                        b.Rb(g, f, a);
                                                                        b.Qb(f, a);
                                                                        f = g;
                                                                        c = e
                                                                    }
                                                                } else if (!F && !d && !k) {
                                                                    if (h == "A") {
                                                                        if (b.p(f, "u") == "image")
                                                                            k = b.jf(f, "IMG");
                                                                        else
                                                                            k = b.E(f, "image", e);
                                                                        if (k) {
                                                                            x = f;
                                                                            b.W(x, "block");
                                                                            b.K(x, V);
                                                                            B = b.gb(x, e);
                                                                            b.F(x, "relative");
                                                                            b.Jb(B, 0);
                                                                            b.fb(B, "backgroundColor", "#000")
                                                                        }
                                                                    } else if (h == "IMG" && b.p(f, "u") == "image")
                                                                        k = f;
                                                                    if (k) {
                                                                        k.border = 0;
                                                                        b.K(k, V)
                                                                    }
                                                                }
                                                                T(f, c, d + 1)
                                                            })
                                                        }
                                                        f.ec = function (c, b) {
                                                            var a = u - b;
                                                            Zb(L, a)
                                                        };
                                                        f.sb = g;
                                                        n.call(f);
                                                        b.Xe(o, b.p(o, "p"));
                                                        b.ge(o, b.p(o, "po"));
                                                        var H = b.E(o, "thumb", e);
                                                        if (H) {
                                                            f.le = b.gb(H);
                                                            b.T(H)
                                                        }
                                                        b.H(o);
                                                        v = b.gb(fb);
                                                        b.L(v, 1e3);
                                                        b.g(o, "click", ab);
                                                        E(e);
                                                        f.Sb = k;
                                                        f.Rc = B;
                                                        f.cd = o;
                                                        f.Mb = L = o;
                                                        b.O(L, v);
                                                        d.Gb(203, R);
                                                        d.Gb(28, eb);
                                                        d.Gb(24, db)
                                                    }
                                                    function vc(y, g, p, q) {
                                                        var a = this, n = 0, u = 0, h, j, f, c, k, t, r, o = C[g];
                                                        m.call(a, 0, 0);
                                                        function v() {
                                                            b.Wc(L);
                                                            cc && k && o.Rc && b.O(L, o.Rc);
                                                            b.H(L, !k && o.Sb)
                                                        }
                                                        function w() {
                                                            a.zc()
                                                        }
                                                        function x(b) {
                                                            r = b;
                                                            a.vb();
                                                            a.zc()
                                                        }
                                                        a.zc = function () {
                                                            var b = a.yb();
                                                            if (!B && !M && !r && s == g) {
                                                                if (!b) {
                                                                    if (h && !k) {
                                                                        k = e;
                                                                        a.yd(e);
                                                                        d.o(i.ke, g, n, u, h, c)
                                                                    }
                                                                    v()
                                                                }
                                                                var l, p = i.Uc;
                                                                if (b != c)
                                                                    if (b == f)
                                                                        l = c;
                                                                    else if (b == j)
                                                                        l = f;
                                                                    else if (!b)
                                                                        l = j;
                                                                    else
                                                                        l = a.Zc();
                                                                d.o(p, g, b, n, j, f, c);
                                                                var m = N && (!E || F);
                                                                if (b == c)
                                                                    (f != c && !(E & 12) || m) && o.oe();
                                                                else
                                                                    (m || b != f) && a.Hc(l, w)
                                                            }
                                                        };
                                                        a.ue = function () {
                                                            f == c && f == a.yb() && a.ab(j)
                                                        };
                                                        a.ne = function () {
                                                            A && A.sb == g && A.Ab();
                                                            var b = a.yb();
                                                            b < c && d.o(i.Uc, g, -b - 1, n, j, f, c)
                                                        };
                                                        a.yd = function (a) {
                                                            p && b.qb(jb, a && p.Tc.Ff ? "" : "hidden")
                                                        };
                                                        a.ec = function (b, a) {
                                                            if (k && a >= h) {
                                                                k = l;
                                                                v();
                                                                o.sd();
                                                                A.Ab();
                                                                d.o(i.Se, g, n, u, h, c)
                                                            }
                                                            d.o(i.ie, g, a, n, j, f, c)
                                                        };
                                                        a.ld = function (a) {
                                                            if (a && !t) {
                                                                t = a;
                                                                a.Gb($JssorPlayer$.Od, x)
                                                            }
                                                        };
                                                        p && a.dc(p);
                                                        h = a.fc();
                                                        a.dc(q);
                                                        j = h + q.Vc;
                                                        f = h + q.Yc;
                                                        c = a.fc()
                                                    }
                                                    function Kb(a, c, d) {
                                                        b.N(a, c);
                                                        b.M(a, d)
                                                    }
                                                    function Zb(c, b) {
                                                        var a = x > 0 ? x : eb, d = zb * b * (a & 1), e = Ab * b * (a >> 1 & 1);
                                                        Kb(c, d, e)
                                                    }
                                                    function Pb() {
                                                        pb = M;
                                                        Ib = z.Zc();
                                                        G = w.X()
                                                    }
                                                    function gc() {
                                                        Pb();
                                                        if (B || !F && E & 12) {
                                                            z.vb();
                                                            d.o(i.xe)
                                                        }
                                                    }
                                                    function ec(f) {
                                                        if (!B && (F || !(E & 12)) && !z.Fc()) {
                                                            var d = w.X(), b = c.ceil(G);
                                                            if (f && c.abs(H) >= a.Ic) {
                                                                b = c.ceil(d);
                                                                b += hb
                                                            }
                                                            if (!(D & 1))
                                                                b = c.min(q - u, c.max(b, 0));
                                                            var e = c.abs(b - d);
                                                            e = 1 - c.pow(1 - e, 5);
                                                            if (!P && pb)
                                                                z.Md(Ib);
                                                            else if (d == b) {
                                                                sb.me();
                                                                sb.Ac()
                                                            } else
                                                                z.Lb(d, b, e * Vb)
                                                        }
                                                    }
                                                    function Hb(a) {
                                                        !b.p(b.hc(a), "nodrag") && b.Zb(a)
                                                    }
                                                    function rc(a) {
                                                        Yb(a, 1)
                                                    }
                                                    function Yb(a, c) {
                                                        a = b.Cd(a);
                                                        var k = b.hc(a);
                                                        if (!O && !b.p(k, "nodrag") && sc() && (!c || a.touches.length == 1)) {
                                                            B = e;
                                                            yb = l;
                                                            S = j;
                                                            b.g(g, c ? "touchmove" : "mousemove", Bb);
                                                            b.Y();
                                                            P = 0;
                                                            gc();
                                                            if (!pb)
                                                                x = 0;
                                                            if (c) {
                                                                var h = a.touches[0];
                                                                ub = h.clientX;
                                                                vb = h.clientY
                                                            } else {
                                                                var f = b.Fd(a);
                                                                ub = f.x;
                                                                vb = f.y
                                                            }
                                                            H = 0;
                                                            gb = 0;
                                                            hb = 0;
                                                            d.o(i.ze, t(G), G, a)
                                                        }
                                                    }
                                                    function Bb(d) {
                                                        if (B) {
                                                            d = b.Cd(d);
                                                            var f;
                                                            if (d.type != "mousemove") {
                                                                var l = d.touches[0];
                                                                f = {x: l.clientX, y: l.clientY}
                                                            } else
                                                                f = b.Fd(d);
                                                            if (f) {
                                                                var j = f.x - ub, k = f.y - vb;
                                                                if (c.floor(G) != G)
                                                                    x = x || eb & O;
                                                                if ((j || k) && !x) {
                                                                    if (O == 3)
                                                                        if (c.abs(k) > c.abs(j))
                                                                            x = 2;
                                                                        else
                                                                            x = 1;
                                                                    else
                                                                        x = O;
                                                                    if (mb && x == 1 && c.abs(k) - c.abs(j) > 3)
                                                                        yb = e
                                                                }
                                                                if (x) {
                                                                    var a = k, i = Ab;
                                                                    if (x == 1) {
                                                                        a = j;
                                                                        i = zb
                                                                    }
                                                                    if (!(D & 1)) {
                                                                        if (a > 0) {
                                                                            var g = i * s, h = a - g;
                                                                            if (h > 0)
                                                                                a = g + c.sqrt(h) * 5
                                                                        }
                                                                        if (a < 0) {
                                                                            var g = i * (q - u - s), h = -a - g;
                                                                            if (h > 0)
                                                                                a = -g - c.sqrt(h) * 5
                                                                        }
                                                                    }
                                                                    if (H - gb < -2)
                                                                        hb = 0;
                                                                    else if (H - gb > 2)
                                                                        hb = -1;
                                                                    gb = H;
                                                                    H = a;
                                                                    rb = G - H / i / (Y || 1);
                                                                    if (H && x && !yb) {
                                                                        b.Zb(d);
                                                                        if (!M)
                                                                            z.ff(rb);
                                                                        else
                                                                            z.Re(rb)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    function ab() {
                                                        qc();
                                                        if (B) {
                                                            B = l;
                                                            b.Y();
                                                            b.Q(g, "mousemove", Bb);
                                                            b.Q(g, "touchmove", Bb);
                                                            P = H;
                                                            z.vb();
                                                            var a = w.X();
                                                            d.o(i.Qe, t(a), a, t(G), G);
                                                            E & 12 && Pb();
                                                            ec(e)
                                                        }
                                                    }
                                                    function jc(c) {
                                                        if (P) {
                                                            b.gf(c);
                                                            var a = b.hc(c);
                                                            while (a && v !== a) {
                                                                a.tagName == "A" && b.Zb(c);
                                                                try {
                                                                    a = a.parentNode
                                                                } catch (d) {
                                                                    break
                                                                }
                                                            }
                                                        }
                                                    }
                                                    function Jb(a) {
                                                        C[s];
                                                        s = t(a);
                                                        sb = C[s];
                                                        Ub(a);
                                                        return s
                                                    }
                                                    function Dc(a, b) {
                                                        x = 0;
                                                        Jb(a);
                                                        d.o(i.Ae, t(a), b)
                                                    }
                                                    function Ub(a, c) {
                                                        wb = a;
                                                        b.j(T, function (b) {
                                                            b.qc(t(a), a, c)
                                                        })
                                                    }
                                                    function sc() {
                                                        var b = i.Ec || 0, a = X;
                                                        if (mb)
                                                            a & 1 && (a &= 1);
                                                        i.Ec |= a;
                                                        return O = a & ~b
                                                    }
                                                    function qc() {
                                                        if (O) {
                                                            i.Ec &= ~X;
                                                            O = 0
                                                        }
                                                    }
                                                    function Xb() {
                                                        var a = b.lb();
                                                        b.K(a, V);
                                                        b.F(a, "absolute");
                                                        return a
                                                    }
                                                    function t(a) {
                                                        return(a % q + q) % q
                                                    }
                                                    function kc(b, d) {
                                                        if (d)
                                                            if (!D) {
                                                                b = c.min(c.max(b + wb, 0), q - u);
                                                                d = l
                                                            } else if (D & 2) {
                                                                b = t(b + wb);
                                                                d = l
                                                            }
                                                        bb(b, a.tc, d)
                                                    }
                                                    function xb() {
                                                        b.j(T, function (a) {
                                                            a.xc(a.Ob.Gf <= F)
                                                        })
                                                    }
                                                    function hc() {
                                                        if (!F) {
                                                            F = 1;
                                                            xb();
                                                            if (!B) {
                                                                E & 12 && ec();
                                                                E & 3 && C[s].Ac()
                                                            }
                                                        }
                                                    }
                                                    function Ec() {
                                                        if (F) {
                                                            F = 0;
                                                            xb();
                                                            B || !(E & 12) || gc()
                                                        }
                                                    }
                                                    function ic() {
                                                        V = {ib: K, bb: J, e: 0, f: 0};
                                                        b.j(Q, function (a) {
                                                            b.K(a, V);
                                                            b.F(a, "absolute");
                                                            b.qb(a, "hidden");
                                                            b.T(a)
                                                        });
                                                        b.K(fb, V)
                                                    }
                                                    function ob(b, a) {
                                                        bb(b, a, e)
                                                    }
                                                    function bb(g, f, j) {
                                                        if (Rb && (!B && (F || !(E & 12)) || a.jd)) {
                                                            M = e;
                                                            B = l;
                                                            z.vb();
                                                            if (f == k)
                                                                f = Vb;
                                                            var d = Cb.yb(), b = g;
                                                            if (j) {
                                                                b = d + g;
                                                                if (g > 0)
                                                                    b = c.ceil(b);
                                                                else
                                                                    b = c.floor(b)
                                                            }
                                                            if (D & 2)
                                                                b = t(b);
                                                            if (!(D & 1))
                                                                b = c.max(0, c.min(b, q - u));
                                                            var i = (b - d) % q;
                                                            b = d + i;
                                                            var h = d == b ? 0 : f * c.abs(i);
                                                            h = c.min(h, f * u * 1.5);
                                                            z.Lb(d, b, h || 1)
                                                        }
                                                    }
                                                    d.Pe = bb;
                                                    d.Gc = function () {
                                                        if (!N) {
                                                            N = e;
                                                            C[s] && C[s].Ac()
                                                        }
                                                    };
                                                    d.Ne = function () {
                                                        return P
                                                    };
                                                    function W() {
                                                        return b.q(y || p)
                                                    }
                                                    function lb() {
                                                        return b.r(y || p)
                                                    }
                                                    d.kb = W;
                                                    d.mb = lb;
                                                    function Eb(c, d) {
                                                        if (c == k)
                                                            return b.q(p);
                                                        if (!y) {
                                                            var a = b.lb(g);
                                                            b.Nc(a, b.Nc(p));
                                                            b.Wb(a, b.Wb(p));
                                                            b.W(a, "block");
                                                            b.F(a, "relative");
                                                            b.M(a, 0);
                                                            b.N(a, 0);
                                                            b.qb(a, "visible");
                                                            y = b.lb(g);
                                                            b.F(y, "absolute");
                                                            b.M(y, 0);
                                                            b.N(y, 0);
                                                            b.q(y, b.q(p));
                                                            b.r(y, b.r(p));
                                                            b.Oc(y, "0 0");
                                                            b.O(y, a);
                                                            var h = b.Xb(p);
                                                            b.O(p, y);
                                                            b.fb(p, "backgroundImage", "");
                                                            b.j(h, function (c) {
                                                                b.O(b.p(c, "noscale") ? p : a, c);
                                                                b.p(c, "autocenter") && Mb.push(c)
                                                            })
                                                        }
                                                        Y = c / (d ? b.r : b.q)(y);
                                                        b.Ye(y, Y);
                                                        var f = d ? Y * W() : c, e = d ? c : Y * lb();
                                                        b.q(p, f);
                                                        b.r(p, e);
                                                        b.j(Mb, function (a) {
                                                            var c = b.Zd(b.p(a, "autocenter"));
                                                            b.ae(a, c)
                                                        })
                                                    }
                                                    d.Me = Eb;
                                                    d.Ed = function (a) {
                                                        var d = c.ceil(t(ib / bc)), b = t(a - s + d);
                                                        if (b > u) {
                                                            if (a - s > q / 2)
                                                                a -= q;
                                                            else if (a - s <= -q / 2)
                                                                a += q
                                                        } else
                                                            a = s + b - d;
                                                        return a
                                                    };
                                                    n.call(d);
                                                    d.rb = p = b.Bb(p);
                                                    var a = b.G({Db: 0, te: 1, uc: 1, vc: 0, wc: l, Pb: 1, Eb: e, jd: e, Hd: 1, Id: 3e3, rd: 1, tc: 500, nf: f.Ce, Ic: 20, hd: 0, n: 1, sc: 0, Le: 1, cc: 1, od: 1}, fc);
                                                    a.Eb = a.Eb && b.uf();
                                                    if (a.Ke != k)
                                                        a.Id = a.Ke;
                                                    if (a.Je != k)
                                                        a.sc = a.Je;
                                                    var eb = a.cc & 3, tc = (a.cc & 4) / -4 || 1, kb = a.Oe, I = b.G({R: r, Eb: a.Eb}, a.Af);
                                                    I.xb = I.xb || I.Bf;
                                                    var Fb = a.Ef, Z = a.Ie, db = a.He, R = !a.Le, y, v = b.E(p, "slides", R), fb = b.E(p, "loading", R) || b.lb(g), Nb = b.E(p, "navigator", R), dc = b.E(p, "arrowleft", R), ac = b.E(p, "arrowright", R), Lb = b.E(p, "thumbnavigator", R), oc = b.q(v), mc = b.r(v), V, Q = [], uc = b.Xb(v);
                                                    b.j(uc, function (a) {
                                                        if (a.tagName == "DIV" && !b.p(a, "u"))
                                                            Q.push(a);
                                                        else
                                                            b.tb() && b.L(a, (b.L(a) || 0) + 1)
                                                    });
                                                    var s = -1, wb, sb, q = Q.length, K = a.Ge || oc, J = a.Fe || mc, Wb = a.hd, zb = K + Wb, Ab = J + Wb, bc = eb & 1 ? zb : Ab, u = c.min(a.n, q), jb, x, O, yb, T = [], Qb, Sb, Ob, cc, Cc, N, E = a.rd, lc = a.Id, Vb = a.tc, qb, tb, ib, Rb = u < q, D = Rb ? a.Pb : 0, X, P, F = 1, M, B, S, ub = 0, vb = 0, H, gb, hb, Cb, w, U, z, Tb = new pc, Y, Mb = [];
                                                    if (a.Eb)
                                                        Kb = function (a, c, d) {
                                                            b.wb(a, {nb: c, pb: d})
                                                        };
                                                    N = a.wc;
                                                    d.Ob = fc;
                                                    ic();
                                                    b.J(p, "jssor-slider", e);
                                                    b.L(v, b.L(v) || 0);
                                                    b.F(v, "absolute");
                                                    jb = b.gb(v, e);
                                                    b.Rb(jb, v);
                                                    if (kb) {
                                                        cc = kb.Df;
                                                        qb = kb.R;
                                                        tb = u == 1 && q > 1 && qb && (!b.md() || b.wd() >= 8)
                                                    }
                                                    ib = tb || u >= q || !(D & 1) ? 0 : a.sc;
                                                    X = (u > 1 || ib ? eb : -1) & a.od;
                                                    var Gb = v, C = [], A, L, Db = b.mf(), mb = Db.of, G, pb, Ib, rb;
                                                    Db.kd && b.fb(Gb, Db.kd, ([j, "pan-y", "pan-x", "none"])[X] || "");
                                                    U = new zc;
                                                    if (tb)
                                                        A = new qb(Tb, K, J, kb, mb);
                                                    b.O(jb, U.Mb);
                                                    b.qb(v, "hidden");
                                                    L = Xb();
                                                    b.fb(L, "backgroundColor", "#000");
                                                    b.Jb(L, 0);
                                                    b.Rb(L, Gb.firstChild, Gb);
                                                    for (var cb = 0; cb < Q.length; cb++) {
                                                        var wc = Q[cb], yc = new xc(wc, cb);
                                                        C.push(yc)
                                                    }
                                                    b.T(fb);
                                                    Cb = new Ac;
                                                    z = new nc(Cb, U);
                                                    if (X) {
                                                        b.g(v, "mousedown", Yb);
                                                        b.g(v, "touchstart", rc);
                                                        b.g(v, "dragstart", Hb);
                                                        b.g(v, "selectstart", Hb);
                                                        b.g(g, "mouseup", ab);
                                                        b.g(g, "touchend", ab);
                                                        b.g(g, "touchcancel", ab);
                                                        b.g(h, "blur", ab)
                                                    }
                                                    E &= mb ? 10 : 5;
                                                    if (Nb && Fb) {
                                                        Qb = new Fb.R(Nb, Fb, W(), lb());
                                                        T.push(Qb)
                                                    }
                                                    if (Z && dc && ac) {
                                                        Z.Pb = D;
                                                        Z.n = u;
                                                        Sb = new Z.R(dc, ac, Z, W(), lb());
                                                        T.push(Sb)
                                                    }
                                                    if (Lb && db) {
                                                        db.vc = a.vc;
                                                        Ob = new db.R(Lb, db);
                                                        T.push(Ob)
                                                    }
                                                    b.j(T, function (a) {
                                                        a.kc(q, C, fb);
                                                        a.Gb(o.pc, kc)
                                                    });
                                                    b.fb(p, "visibility", "visible");
                                                    Eb(W());
                                                    b.g(v, "click", jc);
                                                    b.g(p, "mouseout", b.mc(hc, p));
                                                    b.g(p, "mouseover", b.mc(Ec, p));
                                                    xb();
                                                    a.uc && b.g(g, "keydown", function (b) {
                                                        if (b.keyCode == 37)
                                                            ob(-a.uc);
                                                        else
                                                            b.keyCode == 39 && ob(a.uc)
                                                    });
                                                    var nb = a.vc;
                                                    if (!(D & 1))
                                                        nb = c.max(0, c.min(nb, q - u));
                                                    z.Lb(nb, nb, 0)
                                                };
                                                i.qe = 21;
                                                i.ze = 22;
                                                i.Qe = 23;
                                                i.qf = 24;
                                                i.pf = 25;
                                                i.pe = 26;
                                                i.ye = 27;
                                                i.xe = 28;
                                                i.sf = 202;
                                                i.Ae = 203;
                                                i.ke = 206;
                                                i.Se = 207;
                                                i.ie = 208;
                                                i.Uc = 209;
                                                var o = {pc: 1};
                                                var t = function (a, g, h) {
                                                    var c = this;
                                                    n.call(c);
                                                    var r, q, d, f, i;
                                                    b.q(a);
                                                    b.r(a);
                                                    function k(a) {
                                                        c.o(o.pc, a, e)
                                                    }
                                                    function p(c) {
                                                        b.H(a, c || !h.Pb && d == 0);
                                                        b.H(g, c || !h.Pb && d >= q - h.n);
                                                        r = c
                                                    }
                                                    c.qc = function (b, a, c) {
                                                        if (c)
                                                            d = a;
                                                        else {
                                                            d = b;
                                                            p(r)
                                                        }
                                                    };
                                                    c.xc = p;
                                                    var m;
                                                    c.kc = function (c) {
                                                        q = c;
                                                        d = 0;
                                                        if (!m) {
                                                            b.g(a, "click", b.S(j, k, -i));
                                                            b.g(g, "click", b.S(j, k, i));
                                                            b.Cc(a);
                                                            b.Cc(g);
                                                            m = e
                                                        }
                                                    };
                                                    c.Ob = f = b.G({Be: 1}, h);
                                                    i = f.Be;
                                                    if (f.yc == l) {
                                                        b.J(a, "noscale", e);
                                                        b.J(g, "noscale", e)
                                                    }
                                                    if (f.zb) {
                                                        b.J(a, "autocenter", f.zb);
                                                        b.J(g, "autocenter", f.zb)
                                                    }
                                                }, q = function (g, B) {
                                                    var h = this, z, p, a, v = [], x, w, d, q, r, u, t, m, s, f, k;
                                                    n.call(h);
                                                    g = b.Bb(g);
                                                    function A(n, f) {
                                                        var g = this, c, m, l;
                                                        function q() {
                                                            m.ee(p == f)
                                                        }
                                                        function i(e) {
                                                            if (e || !s.Ne()) {
                                                                var a = d - f % d, b = s.Ed((f + a) / d - 1), c = b * d + d - a;
                                                                h.o(o.pc, c)
                                                            }
                                                        }
                                                        g.sb = f;
                                                        g.Kc = q;
                                                        l = n.le || n.Sb || b.lb();
                                                        g.Mb = c = b.Wd(k, "thumbnailtemplate", l, e);
                                                        m = b.Cc(c);
                                                        a.nc & 1 && b.g(c, "click", b.S(j, i, 0));
                                                        a.nc & 2 && b.g(c, "mouseover", b.mc(b.S(j, i, 1), c))
                                                    }
                                                    h.qc = function (b, e, f) {
                                                        var a = p;
                                                        p = b;
                                                        a != -1 && v[a].Kc();
                                                        v[b].Kc();
                                                        !f && s.Pe(s.Ed(c.floor(e / d)))
                                                    };
                                                    h.xc = function (a) {
                                                        b.H(g, a)
                                                    };
                                                    var y;
                                                    h.kc = function (D, C) {
                                                        if (!y) {
                                                            z = D;
                                                            c.ceil(z / d);
                                                            p = -1;
                                                            m = c.min(m, C.length);
                                                            var h = a.bc & 1, n = u + (u + q) * (d - 1) * (1 - h), k = t + (t + r) * (d - 1) * h, B = n + (n + q) * (m - 1) * h, o = k + (k + r) * (m - 1) * (1 - h);
                                                            b.F(f, "absolute");
                                                            b.qb(f, "hidden");
                                                            a.zb & 1 && b.N(f, (x - B) / 2);
                                                            a.zb & 2 && b.M(f, (w - o) / 2);
                                                            b.q(f, B);
                                                            b.r(f, o);
                                                            var j = [];
                                                            b.j(C, function (l, g) {
                                                                var i = new A(l, g), e = i.Mb, a = c.floor(g / d), k = g % d;
                                                                b.N(e, (u + q) * k * (1 - h));
                                                                b.M(e, (t + r) * k * h);
                                                                if (!j[a]) {
                                                                    j[a] = b.lb();
                                                                    b.O(f, j[a])
                                                                }
                                                                b.O(j[a], e);
                                                                v.push(i)
                                                            });
                                                            var E = b.G({wc: l, jd: l, Ge: n, Fe: k, hd: q * h + r * (1 - h), Ic: 12, tc: 200, rd: 1, cc: a.bc, od: a.Cf || a.yf ? 0 : a.bc}, a);
                                                            s = new i(g, E);
                                                            y = e
                                                        }
                                                    };
                                                    h.Ob = a = b.G({jc: 0, gc: 0, n: 1, bc: 1, zb: 3, nc: 1}, B);
                                                    x = b.q(g);
                                                    w = b.r(g);
                                                    f = b.E(g, "slides", e);
                                                    k = b.E(f, "prototype");
                                                    u = b.q(k);
                                                    t = b.r(k);
                                                    b.Qb(k, f);
                                                    d = a.C || 1;
                                                    q = a.jc;
                                                    r = a.gc;
                                                    m = a.n;
                                                    a.yc == l && b.J(g, "noscale", e)
                                                };
                                                function r(e, d, c) {
                                                    var a = this;
                                                    m.call(a, 0, c);
                                                    a.bd = b.Qc;
                                                    a.Vc = 0;
                                                    a.Yc = c
                                                }
                                                jssor_1_slider_init = function () {
                                                    var g = [{k: 1200, x: .3, B: {f: [.3, .7]}, i: {f: d.l, a: d.m}, a: 2}, {k: 1200, x: -.3, s: e, i: {f: d.l, a: d.m}, a: 2}, {k: 1200, x: -.3, B: {f: [.3, .7]}, i: {f: d.l, a: d.m}, a: 2}, {k: 1200, x: .3, s: e, i: {f: d.l, a: d.m}, a: 2}, {k: 1200, y: .3, B: {e: [.3, .7]}, i: {e: d.l, a: d.m}, a: 2}, {k: 1200, y: -.3, s: e, i: {e: d.l, a: d.m}, a: 2}, {k: 1200, y: -.3, B: {e: [.3, .7]}, i: {e: d.l, a: d.m}, a: 2}, {k: 1200, y: .3, s: e, i: {e: d.l, a: d.m}, a: 2}, {k: 1200, x: .3, n: 2, B: {f: [.3, .7]}, z: {Z: 3}, i: {f: d.l, a: d.m}, a: 2}, {k: 1200, x: .3, n: 2, s: e, z: {Z: 3}, i: {f: d.l, a: d.m}, a: 2}, {k: 1200, y: .3, C: 2, B: {e: [.3, .7]}, z: {jb: 12}, i: {e: d.l, a: d.m}, a: 2}, {k: 1200, y: .3, C: 2, s: e, z: {jb: 12}, i: {e: d.l, a: d.m}, a: 2}, {k: 1200, y: .3, n: 2, B: {e: [.3, .7]}, z: {Z: 12}, i: {e: d.l, a: d.m}, a: 2}, {k: 1200, y: -.3, n: 2, s: e, z: {Z: 12}, i: {e: d.l, a: d.m}, a: 2}, {k: 1200, x: .3, C: 2, B: {f: [.3, .7]}, z: {jb: 3}, i: {f: d.l, a: d.m}, a: 2}, {k: 1200, x: -.3, C: 2, s: e, z: {jb: 3}, i: {f: d.l, a: d.m}, a: 2}, {k: 1200, x: .3, y: .3, n: 2, C: 2, B: {f: [.3, .7], e: [.3, .7]}, z: {Z: 3, jb: 12}, i: {f: d.l, e: d.l, a: d.m}, a: 2}, {k: 1200, x: .3, y: .3, n: 2, C: 2, B: {f: [.3, .7], e: [.3, .7]}, s: e, z: {Z: 3, jb: 12}, i: {f: d.l, e: d.l, a: d.m}, a: 2}, {k: 1200, P: 20, c: 3, i: {c: d.l, a: d.m}, a: 2}, {k: 1200, P: 20, c: 3, s: e, i: {c: d.ud, a: d.m}, a: 2}, {k: 1200, P: 20, c: 12, i: {c: d.l, a: d.m}, a: 2}, {k: 1200, P: 20, c: 12, s: e, i: {c: d.ud, a: d.m}, a: 2}], j = {wc: e, Oe: {R: s, xb: g, Jd: 1}, Ie: {R: t}, He: {R: q, n: 10, jc: 8, gc: 8, sc: 360}}, f = new i("jssor_1", j);
                                                    function a() {
                                                        var b = f.rb.parentNode.clientWidth;
                                                        if (b) {
                                                            b = c.min(b, 800);
                                                            f.Me(b)
                                                        } else
                                                            h.setTimeout(a, 30)
                                                    }
                                                    a();
                                                    b.g(h, "load", a);
                                                    b.g(h, "resize", a);
                                                    b.g(h, "orientationchange", a)
                                                }
                                            })(window, document, Math, null, true, false)

                                        </script>

                                        <style>

                                            .jssora05l,.jssora05r{display:block;position:absolute;width:40px;height:40px;cursor:pointer;background:url('img/a17.png') no-repeat;overflow:hidden}.jssora05l{background-position:-10px -40px}.jssora05r{background-position:-70px -40px}.jssora05l:hover{background-position:-130px -40px}.jssora05r:hover{background-position:-190px -40px}.jssora05l.jssora05ldn{background-position:-250px -40px}.jssora05r.jssora05rdn{background-position:-310px -40px}.jssort01 .p{position:absolute;top:0;left:0;width:72px;height:72px}.jssort01 .t{position:absolute;top:0;left:0;width:100%;height:100%;border:none}.jssort01 .w{position:absolute;top:0;left:0;width:100%;height:100%}.jssort01 .c{position:absolute;top:0;left:0;width:68px;height:68px;border:#000 2px solid;box-sizing:content-box;background:url('img/t01.png') -800px -800px no-repeat;_background:none}.jssort01 .pav .c{top:2px;_top:0;left:2px;_left:0;width:68px;height:68px;border:#000 0 solid;_border:#fff 2px solid;background-position:50% 50%}.jssort01 .p:hover .c{top:0;left:0;width:70px;height:70px;border:#fff 1px solid;background-position:50% 50%}.jssort01 .p.pdn .c{background-position:50% 50%;width:68px;height:68px;border:#000 2px solid}* html .jssort01 .c,* html .jssort01 .pdn .c,* html .jssort01 .pav .c{width:72px;height:72px}

                                        </style>


                                        <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 800px; height: 456px; overflow: hidden; visibility: hidden; background-color: #24262e;">


                                            <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 800px; height: 356px; overflow: hidden;">

                                                <%

                                                    if (video.isEmpty() == false || video == null) {
                                                        String v = null;
                                                        for (int x = 0; x < video.size(); x++) {
                                                            v = testimonial.getFolderName() + "/" + video.get(x).getFileName();


                                                %>

                                                <div data-p="144.50" style="display: none;">
                                                    <video>
                                                        <source src="<%=v%>" type="video/mp4">
                                                        <source src="<%=v%>" type="video/ogg">
                                                    </video>

                                                </div>

                                                <%                                                                }
                                                    }

                                                %>  

                                                <%                                                            if (image.isEmpty() == false || image == null) {
                                                        String s;
                                                        for (int x = 0; x < image.size(); x++) {
                                                            s = testimonial.getFolderName() + "/" + image.get(x).getFileName();


                                                %>

                                                <div data-p="144.50" style="display: none;">
                                                    <img data-u="image" src="<%=s%>" />
                                                    <img data-u="thumb" src="<%=s%>" />
                                                </div>

                                                <%                                        }
                                                    }
                                                %>
                                            </div>
                                            <!-- Thumbnail Navigator -->
                                            <div data-u="thumbnavigator" class="jssort01" style="position:absolute;left:0px;bottom:0px;width:800px;height:100px;" data-autocenter="1">
                                                <!-- Thumbnail Item Skin Begin -->
                                                <div data-u="slides" style="cursor: default;">
                                                    <div data-u="prototype" class="p">
                                                        <div class="w">
                                                            <div data-u="thumbnailtemplate" class="t"></div>
                                                        </div>
                                                        <div class="c"></div>
                                                    </div>
                                                </div>
                                                <!-- Thumbnail Item Skin End -->
                                            </div>
                                            <!-- Arrow Navigator -->
                                            <span data-u="arrowleft" class="jssora05l" style="top:158px;left:8px;width:40px;height:40px;"></span>
                                            <span data-u="arrowright" class="jssora05r" style="top:158px;right:8px;width:40px;height:40px;"></span>
                                        </div>
                                        <script>
                                            jssor_1_slider_init();</script>


                                        <div class="fb-status-container fb-white-bg">
                                            <div class="fb-time-action like-info">

                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </section>

                                <section class="panel">
                                    <div class="panel-body">
                                        <div class="fb-user-thumb">


                                            <div class="clearfix"></div>

                                        </div>
                                    </div>
                                </section>

                            </div> </div>
                    <div class="col-md-4">
                        <section class="panel">

                            <header class="panel-heading">
                                Description
                            </header>

                            <div class="panel-body">
                                <p><br>
                                    <%=testimonial.getMessage()%>                        
                                </p>
                                <br/>

                                <br/>

                                <h5 class="bold">Uploaded by</h5>
                                <p><%=testimonial.getCitizen().getUser().getUsername()%></p>
                                <br>

                                <h5 class="bold">Date Uploaded</h5>
                                <p><%=testimonial.getDateUploaded()%></p>
                                <br>

                                <h5 class="bold">Location</h5>
                                <p><%=testimonial.getLocation()%></p>
                                <br>

                                <h5 class="bold">Location Details</h5>
                                <p><%=testimonial.getLocationdetails()%></p>
                                <br>

                                <h5 class="bold">Other Documents</h5>
                                <ul class="list-unstyled p-files">

                                    <%
                                        if (docs.isEmpty() == false || image == null) {
                                            String d;
                                            for (int x = 0; x < docs.size(); x++) {
                                                d = testimonial.getFolderName() + "/" + docs.get(x).getFileName();

                                    %>

                                    <li><a href="<%=d%>"><i class="fa fa-file-text"></i> <%out.print(docs.get(x).getFileName());%></a></li>

                                    <%

                                            }
                                        }

                                    %>  

                                </ul>
                                <br/>

                                <h5 class="bold">Linked Project</h5>
                                <%if (testimonial.getProject().getId() == null || testimonial.getProject().getId().equalsIgnoreCase("")) {%>
                                <p>Testimonial is still not linked to any project</p> 
                                <%} else {

                                    Project project = (Project) request.getAttribute("Project");
                                %>

                                <a href="Citizen_OpenProjectLink?idd=<%=project.getId()%>"> <%out.print(project.getId() + " - " + project.getName());%> </a>                                
                                <%}%>
                                <br>



                            </div>

                        </section>
                    </div>

                    <br>

                    <center>
                        <button type="button" onclick="history.go(-1)" class="btn btn-default" >Back</button>                                    
                    </center>        
                    <br><br>
                </div>
                <% if (rList.size() >= 1) {%>
                <% for (Reply r : rList) {%>
                <section class="panel">
                    <header class="panel-heading">
                        Reply
                    </header>
                    <br>
                    <div class="panel-body">
                        <div class="form-group">

                            <label class="col-sm-2 col-sm-2 control-label">Sender: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=r.getSender()%>">
                                <br>
                            </div>
                            <label class="col-sm-2 col-sm-2 control-label">Date Sent: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" readonly style="background: white; border:0px;"  name="subject" value="<%=r.getDateSent()%>">
                                <br>
                            </div>
                            <label class="col-sm-2 col-sm-2 control-label">Message </label>
                            <div class="col-sm-10">
                                <textarea class="wysihtml5 form-control" rows="7" name="content" readonly style="resize: none; background: white; border:0px; "><%=r.getMessage()%></textarea>
                            </div>

                        </div>
                    </div>
                </section>
                <%}%>
                <%}%>
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
