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

        $("#mgcaravans1").click(function(){
            ws.send("mgcaravans1");
            });

        $("#mgacaravans2").click(function(){
            ws.send("mgacaravans2");
            });

        $("#ardbrin").click(function(){
            ws.send("ardbrin");
            });

	$("#sonparc").click(function(){
            ws.send("snparcf");
            });

      });
