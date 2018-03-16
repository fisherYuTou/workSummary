<div class="container" style="margin-top: 5em;">
    <div class="dropdown" id="myDropdown" >
        <button id="serverIp" style="width:200px;" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        </button>
        <ul id="t123" class="dropdown-menu" aria-labelledby="dropdownMenu1">
            <#list serverInfo as server>
                <li id="${server.ip}"><a href="#">${server.ip}</a></li>
            </#list>
        </ul>
    </div>
    <div id="serverDetail"></div>
</div>

<script type="text/javascript">
    $(function(){
        var serverIp = $(".dropdown-menu li:first-child").attr("id");
        $("#serverIp").html(serverIp);
        $("#serverDetail").load("serverDetail",{ip: serverIp});


        $('#t123 li').on('click',function(){
            var serverIp = $(this).text();
            $("#serverIp").html(serverIp);
            $("#serverDetail").load("serverDetail",{ip: serverIp});
        })


    })
</script>
