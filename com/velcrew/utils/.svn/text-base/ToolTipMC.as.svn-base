/* AS3
	Copyright 2009 __velcrew__.
		www.velcrew.com
*/
package com.velcrew.utils
{	
	
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import lt.uza.ui.Scale9BitmapSprite;
	
	 /**
	 *	ToolTip width Scale9Bitmap
	 *	
	 *	depedencies lt.uza.ui.Scale9BitmapSprite 
	 *	
	 *	ToolTip V 0.3  *
	 *	
	 *	add @param mc to a MovieClip to put tip as movieClip
	 *		
	 *	change name 	
	 *	
	 *	ToolTip V 0.2
	 *	
	 *	add @param color for format text	
	 *	
	 *	---------------------------------
	 *	
	 *	TootlTip V 0.1
	 *	
	 *	---------------------------------
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Luis Teixeira
	 *	@since  08.04.2009
	 */
	public class ToolTipMC extends Sprite {
		

		public  var _msg 	  	 : String;
		public  var _tpWidth 	 : Number;
		public  var _tpHeight 	 : Number;

		//var for mensage ballon
		private var _msgBox		 : Sprite;
		private var _box 		 : BitmapData;
		private var _boxMC		 : Sprite;
		private var _xini 		 : Number;
		private var _yini 		 : Number;
		private var _w	  		 : Number;
		private var _h 			 : Number;
		private var _msgBoxArea  : Rectangle;
		private var _msgBoxBG	 : Scale9BitmapSprite;
		
		public var mc : Sprite;
			
		public function ToolTipMC(box:BitmapData,boxMC:MovieClip,xini:int,yini:int,w:int,h:int) 
		{
			_box = box;
			_boxMC = mc = boxMC;
			_xini = xini;
			_yini = yini;
			_w = w;
			_h = h;
						
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_msgBoxArea = new Rectangle(_xini,_yini,_w,_h);
			_msgBoxBG = new Scale9BitmapSprite(_box,_msgBoxArea);
			_msgBox = new Sprite();
			
			_msgBox.addChild(_msgBoxBG);
			
			_boxMC.x = _xini;
			_boxMC.y = _yini;
			_msgBoxBG.addChild(_boxMC);
			
			_msgBoxBG.height = _h + _boxMC.height + 5;
			//_msgBoxBG.height = _h + 190;
			_msgBoxBG.width =  _w + _boxMC.width - 117;
			
			_tpWidth  = _msgBox.width;
			_tpHeight = _msgBox.height;
			
			addChild(_msgBox);
			
		}
	
	}
	
}
