/* AS3
	Copyright 2010 __ Velcrew __.
*/
package com.velcrew.events {
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Luis Teixeira
	 *	@since  04.02.2010
	 */
	
	import flash.events.Event;

	public class LoadAndReceivedEvent extends Event {
		
		
			public static const LOAD_COMPLETE		: String = "load_complete";
			public static const LOAD_FAILD			: String = "load_faild";
			

			public var file 						: String = "";
			public var data	 						: * = null;
		
		public function LoadAndReceivedEvent(type:String, _data:* = null, bubbles:Boolean=true, cancelable:Boolean=false){
			
			super(type, bubbles, cancelable);
			this.data = _data;
		}
		
		override public function clone() : Event {
			return new LoadAndReceivedEvent(type, data, bubbles, cancelable);
		}
	}
	
}