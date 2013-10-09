/* AS3
	Copyright 2010 __ Velcrew __.
*/
package com.velcrew.events 
{
	import flash.events.Event;
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Luis Teixeira
	 *	@since  18.01.2010
	 */

	public class SlideShowEvent extends Event {
		
			/**
			* Dispatched when the slideshow init
			*/
			public static const SLIDESHOW_INIT			: String = "onInit";

			/**
		    * Dispatched when the slideshow starts playing
		    */
			public static const SLIDESHOW_STARTED		: String = "onStart";
			/**
		    * Dispatched when the slideshow Paused
		    */
			public static const SLIDESHOW_PAUSED		: String = "onPause";
			/**
	    	* Dispatched when the slideshow still rolling 
	    	*/
			public static const SLIDESHOW_ROLLING 		: String = "onRolling";
			/**
		    * Dispatched when the slideshow img loaded
		    */
			public static const SLIDESHOW_IMG_LOADED	: String = "onImgLoaded";
			/**
	    	* Dispatched when the video ended playing 
			*/

			public var file 						: String = "";
			public var params 						: Object = null ;
		
		public function SlideShowEvent(type:String,_params:Object = null, bubbles:Boolean=true, cancelable:Boolean=false){
			
			super(type, bubbles, cancelable);
			this.params = _params;
		}
		
		override public function clone() : Event {
			return new SlideShowEvent(type, params, bubbles, cancelable);
		}
	}
	
}
