    var title = "Gapminder World Downloaded: 2009-04-27";
    		
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
			so.addParam("scale", "default");
			so.write("flashcontent");
			window.runtime.trace("embedApplication");
			
		}
		
		// called initially by movie
		function getCurrentHash(){
			 return unFocus.History.getCurrent();
		}
		// called from flash. updates browser history.
		function updateUrl(newUrl){
			if (newUrl.length > 1 ) {
				unFocus.History.addHistory(newUrl);
		//		window.runtime.trace("updateURL: " + newUrl);
				window.updateHash(newUrl);
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
				window.runtime.trace("Calling onHashChanged, change=" + change); 
				so.call('onHashChanged', change);
				lastHash=change;
			}else{
				intId = setInterval(hashSetter, 1000);
			}
		}

		// start listening to the url
		//unFocus.History.addEventListener('historyChange', historyChange);
		
		
		function openURL(url){
			var win = window.open(url,"_blank");
			if (win == undefined){
				so.call("onPopUpBlocked", url);
			}
		}
	
