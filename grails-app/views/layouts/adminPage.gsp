<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="sigab.css"/>
    <asset:stylesheet src="bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="DataTables/media/css/dataTables.bootstrap.min.css"/>
    <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="fullcalendar/fullcalendar.min.css"/>


    <asset:javascript src="application.js"/>
    <asset:javascript src="DataTables/media/js/dataTables.bootstrap.min.js"/>
    <asset:javascript src="moments/moments.js"/>
    <asset:javascript src="fullcalendar/fullcalendar.min.js"/>
    <asset:javascript src="fullcalendar/lang/es.js"/>
    <g:layoutHead/>

    <style>
        body{padding-bottom: 50px;}
    </style>
</head>
<body>




<g:render template="/layouts/headerAdmin"/>

<div class="container-fluid">
<div class="row">
   <div class="col-lg-12"><g:layoutBody/></div>
</div>
</div>


<g:render template="/layouts/footer"/>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>


</body>
</html>
