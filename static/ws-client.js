$(document).ready(function(){

        var WEBSOCKET_ROUTE = "/ws";

        if(window.location.protocol == "http:"){
            //localhost
            var ws = new WebSocket("ws://" + window.location.host + WEBSOCKET_ROUTE);
            }
        else if(window.location.protocol == "https:"){
            //Dataplicity
            var ws = new WebSocket("wss://" + window.location.host + WEBSOCKET_ROUTE);
            }

        ws.onopen = function(evt) {
            $("#ws-status").html("Connected");
            };

        ws.onmessage = function(evt) {
            };

        ws.onclose = function(evt) {
            $("#ws-status").html("Disconnected");
            };

        $("#reload").click(function(){
            ws.send("reload");
            });

        $("#Preset1").click(function(){
            ws.send("Preset1");
            });

        $("#Preset2").click(function(){
            ws.send("Preset2");
            });

        $("#Preset3").click(function(){
            ws.send("Preset3");
            });

	$("#Preset4").click(function(){
            ws.send("Preset4");
            });
	
	$("#Preset5").click(function(){
            ws.send("Preset5");
            });

        $("#Preset6").click(function(){
            ws.send("Preset6");
            });

	$("#Preset7").click(function(){
            ws.send("Preset7");
            });
	
	$("#Preset8").click(function(){
            ws.send("Preset8");
            });

      });
