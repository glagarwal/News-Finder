<%-- 
    Document   : result
    Created on : Feb 5, 2019, 10:29:42 PM
    Author     : Gaurav Agarwal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="org.json.JSONObject" %>
<%@page import="edu.uga.gaurav.newsfinder_gaurav_agarwal.NewsFinder" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="search for the news you want to know">
    <meta name="author" content="Gaurav Agarwal">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News Finder</title>
    <!-- CDNs - Bootstrap’s compiled CSS and JS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
    <!-- CDNs - versions of jQuery and Popper.js from Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <!-- jQuery CDN -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script> -->

    <!-- link external css -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

    <h2 class="page-heading"><img src="images/globe-icon.png" class="imgIcon"></img> News Finder</h2>
    <div class="container" id="result">
        Please wait...
    </div>

    <!-- Footer -->
    <footer class="page-footer font-small blue">

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">© 2019 Copyright: Gaurav Agarwal |
            Powered by <a href="https://newsapi.org/" target="_blank">News API</a>
        </div>
        <!-- Copyright -->

    </footer>
    <!-- Footer -->

    <!-- call external javascript -->
    <script type="text/javascript" src="js/main.js"></script>
    <%
        String res = NewsFinder.callWS(request.getParameter("q"), request.getParameter("from"), request.getParameter("to"));        
        JSONObject jsonObj = new JSONObject(res);
    %>
    <script>
        $(document).ready(function () {
            var responseJson = <%= jsonObj%>;
            console.log(responseJson);
            displayResult(responseJson);
        });
        function displayResult(response) {
            var resultNode = $('#result');
            var article = '<div class="row">'
                           + '<h4>Showing news results for: <strong><i><%=request.getParameter("q")%></i></strong></h4>'
                           + '</div><br/>';
            response.articles.forEach(element => {
                article = article+ 
                            '<div class="nf-article row">'
                                +'<div class="col-2">'
                                    +'<img src='+element.urlToImage+' class="nf-small-img" />'
                                +'</div>'
                                +'<div class="col-10">'
                                +   '<div class="row">'
                                +       '<h6>'+element.title+'</h6>'
                                +   '</div>'
                                +   '<div class="row">'
                                +       '<span class="nf-publish-date">'+element.publishedAt+'</span>'
                                +   '</div>'
                                +   '<div class="row">'
                                +       '<span class="nf-description">'+element.description+'</span>'
                                +   '</div>'
                                +   '<div class="row">'
                                +       '<a href='+element.url+'>Read More>></a>'
                                +   '</div>'
                                +'</div>'
                            +'</div>';
            });
            resultNode.html(article);            
        }
    </script>
</body>

</html>