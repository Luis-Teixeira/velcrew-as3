/* AS3
	Copyright 2010 __ Velcrew __.
*/
package com.velcrew.utils {
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Luis Teixeira
	 *	@since  04.02.2010
	 */

	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	
	import com.velcrew.events.LoadAndReceivedEvent;

	public class LoadAndReceived extends Sprite {
		
		private var _url 						: String;
		private var _method						: String;
		private var _requestVars 				: Object;
		
		private var _urlVariables 				: URLVariables;
		private var _loader						: URLLoader;// = new URLLoader();
		private var _request					: URLRequest;// = new URLRequest();
		
		public function LoadAndReceived(url:String, requestVars:Object = null, method:String = "POST"){
			super();
			
			_url = url;		
			
			_requestVars = requestVars;
			_urlVariables = new URLVariables();
						
			for (var varName:String in requestVars) {
				//trace("Sent " + varName + " as: " + requestVars[varName]);
				_urlVariables[varName] = requestVars[varName];
			}
		
			method == "POST" ? _method = URLRequestMethod.POST : _method = URLRequestMethod.GET
			
			_request = new URLRequest();
			_request.url = _url;
			_request.method = _method;
			
			if(_requestVars) _request.data = _urlVariables;
						
			_loader = new URLLoader();
			_loader.dataFormat = URLLoaderDataFormat.TEXT;
			_loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
		    _loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
		    _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		    _loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		
			try
			{
				_loader.load(_request);
			}
			catch (error:Error)
			{
				trace("Unable to load URL");
			}
		
		}
		
		private function loaderCompleteHandler(e:Event):void
		{
			dispatchEvent(new LoadAndReceivedEvent(LoadAndReceivedEvent.LOAD_COMPLETE,e.target.data));
		//	trace("merda" + e.target.data)
		//	var xxml:XML = new XML(e.target.data)
		
		}
		private function httpStatusHandler (e:Event):void
		{
			//trace("httpStatusHandler:" + e);
		}
		
		private function securityErrorHandler (e:Event):void
		{
			//trace("securityErrorHandler:" + e);
			dispatchEvent(new LoadAndReceivedEvent(LoadAndReceivedEvent.LOAD_FAILD,"securityErrorHandler: "+e));
		}
		
		private function ioErrorHandler(e:Event):void
		{
			//trace("ioErrorHandler: " + e);
			dispatchEvent(new LoadAndReceivedEvent(LoadAndReceivedEvent.LOAD_FAILD,"ioErrorHandler: "+e));
		}
	}
}
