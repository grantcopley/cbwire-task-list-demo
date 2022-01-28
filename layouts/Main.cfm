<cfoutput>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Todo</title>

    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>

    #wireStyles()#

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
</head>

<body class="bg-gray-800">
    #wire( "TaskList" )#

	#wireScripts()#
</body>
</html>
</cfoutput>