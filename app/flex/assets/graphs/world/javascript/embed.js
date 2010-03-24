    var title = "Gapminder World (March 19, 2010)";
    		
		function reloadPage(){
			window.location.hash = "";
		//	window.location.reload();
		}
		// embed the application
		var so; // swfObject stuff
		function embedApplication(url){
			so = new SWFObject(url, "uid" , "100%", "100%", "7", "#FFFFFF", false,"high", null, "noflash.html");
			so.setProxy(null, 'javascript/swfobject_js_gateway.swf');
			so.addVariable('chartTitle', title);
			so.addVariable('href', escape(window.location.href));
            so.addVariable("wmode", "opaque");
			so.addParam("scale", "default");
            so.addParam("wmode", "opaque");
			so.write("flashcontent");
			
		}
		// called from flash. updates browser history.
		function updateUrl(newUrl){
			if (newUrl.length > 1 ) {
				//window.runtime.trace("Location read from JS: " + window.htmlLoader.location);
				//window.runtime.trace('updateUrl called, newUrl: ' + newUrl);
				updateHash(newUrl);
		    }
		}
		// IE history fix
		var lastHash;
		var intId = 0;
		function hashSetter(){
			clearInterval(intId);
			if (window.location.hash == "#" && lastHash != undefined && lastHash != "#") {
				window.location.hash=lastHash;
				lastHash = undefined;
			}
		}
		// send url changes to flash movie
		function historyChange(change){
			if (change.length > 1) {
				//window.runtime.trace('historyChange invoked with change: ' + change);
				so.call('onHashChanged', change);
				lastHash=change;
			}else{
				intId = setInterval(hashSetter, 1000);
			}
		}

		
		
		function openURL(url){
			//window.runtime.trace('openURL called with URL: ' + url);
			var win = window.open(url,"_blank");
			if (win == undefined){
				so.call("onPopUpBlocked", url);
			}
		}
	
