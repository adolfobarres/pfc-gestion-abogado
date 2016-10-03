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

    <asset:stylesheet src="bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="DataTables/media/css/dataTables.bootstrap.min.css"/>
    <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="login.css"/>

    <asset:javascript src="application.js"/>
    <asset:javascript src="DataTables/media/js/dataTables.bootstrap.min.js"/>
    <asset:javascript src="login.js"/>
    <g:layoutHead/>

    <style>
        body{padding-bottom: 50px;}
    </style>
</head>
<body>

<div class="row">
    <div class="large-12 columns"><g:layoutBody/></div>
</div>


<g:render template="/layouts/footer"/>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>



</body>
</html>
