/* AS3
	Copyright 2009 __velcrew__.
		www.velcrew.com
*/
package com.velcrew.utils
{	
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign
	import flash.geom.Rectangle;
	
	import lt.uza.ui.Scale9BitmapSprite;
	
	 /**
	 *	ToolTip width Scale9Bitmap
	 *	
	 *	depedencies lt.uza.ui.Scale9BitmapSprite 
	 *
	 *	---------------------------------	
	 *	
	 *	ToolTip V 0.4 
	 *	
	 *	some new setters - width of tooltip (u change da width of texfield)
	 *	
	 *	wantExpande - if youwant your tooltip change height. delete ;fault = true;
	 *	
	 *	TootTip V 0.3
	 *	
	 *	some small changes in construtor. 
	 *	
	 *	font family param ,change position with color font param
	 *	
	 *	and resolve issue with font embebed - now is possible to set true or false in last param
	 *	
	 *	---------------------------------
	 *	
	 *	TootlTip V 0.2
	 *	
	 *	add @param color 	
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
	public class ToolTip extends Sprite {
		

		public  var _msg 	  	 : String;
		public  var _tpWidth 	 : Number;
		public  var _tpHeight 	 : Number;

		//var for mensage ballon
		private var _msgBox		 : Sprite;
		private var _box 		 : BitmapData;
		private var _xini 		 : Number;
		private var _yini 		 : Number;
		private var _w	  		 : Number;
		private var _h 			 : Number;
		private var _msgBoxArea  : Rectangle;
		private var _msgBoxBG	 : Scale9BitmapSprite;
		private var _text 		 : TextField;
		private var _formatText  : TextFormat;
		private var _color 		 : int;
		private var _font 		 : String;
		private var _size 	 	 : Number;
		private var _embebed	 : Boolean;
		
		private var _ratio		 : int = 3;
		private var _wantExpande : Boolean = true;
		private var _widthText 	 : Number;
		
			
		public function ToolTip(box:BitmapData,xini:int,yini:int,w:int,h:int,msg:String = "",color:int = 0x000000 , size:Number = 14,font:String = "Verdana",embebed:Boolean = false)
		{
			_box = box;
			_xini = xini;
			_yini = yini;
			_w = w;
			_h = h;
			_color = color;
			_font = font;
			_size = size;
			_msg = msg;
			_embebed = embebed;
			_widthText = w;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			
			
		}
		
		private function init(e:Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME,addMovement);
			
			_msgBoxArea = new Rectangle(_xini,_yini,_w,_h);
			_msgBoxBG = new Scale9BitmapSprite(_box,_msgBoxArea);
			_msgBox = new Sprite();
			
			_formatText = new TextFormat();
			_formatText.font = _font;
			_formatText.size = _size;
			_formatText.color = _color;
			
			_formatText.align = TextFormatAlign.CENTER;
			
			_text = new TextField();
//			_text.x = _xini;
			_text.x = 0;
			_text.y = _yini;
			_text.width = _widthText ;
			_text.multiline = true;
			_text.wordWrap = true;
			_text.antiAliasType	= flash.text.AntiAliasType.ADVANCED;
			_text.autoSize = TextFieldAutoSize.CENTER
//			_text.autoSize = TextFieldAutoSize.LEFT;
			_text.defaultTextFormat = _formatText;
			
			if(_embebed)_text.embedFonts = true;
			
			_text.selectable = false;
			_text.htmlText = _msg;
			
		
			_msgBox.addChild(_msgBoxBG);
			_msgBoxBG.addChild(_text);
			
			//addChild(_text)
			
			if(_wantExpande)_msgBoxBG.height =  _h + _text.height + 5;
					
			_msgBoxBG.width = _msgBox.width 
					
			_tpWidth = _msgBox.width;
			_tpHeight= _msgBox.height;
			
			addChild(_msgBox);
			//fixPosition();
			
		}
		
		private function fixPosition():void
		{
			var mc = parent as Sprite;
			
			if(mc.mouseX < stage.stageWidth/2)
				x = mc.mouseX;
			else
				x = mc.mouseX-width;
			if(mc.mouseY < stage.stageHeight/2)
				y = mc.mouseY + height- _ratio*2;
			else
				y = mc.mouseY-height;
		}
		
		private function addMovement(evt:Event):void
		{
			var mc = parent as Sprite;
			if(x == 0) visible = false;
			else visible = true;
			
			if(mc.mouseX < stage.stageWidth/2)
				x = mc.mouseX;
			else
				x = mc.mouseX - width + _ratio*2;
			if(mc.mouseY < stage.stageHeight/2)
				y = mc.mouseY + height - _ratio*2;
			else
				y = mc.mouseY - height;
				
			if(x > stage.stageWidth-width)
				x = stage.stageWidth-width;
			if(x < _ratio*2)
				x = _ratio*2;
		}
		
		public function set widthText(value:Number) : void { 
			_widthText = value; 
		}
		
		public function set wantExpande(value:Boolean) : void { 
			_wantExpande = value; 
		}
		
		public function onRemovedFromStage(e:Event) : void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			removeEventListener(Event.ENTER_FRAME,addMovement);
			
		}	
		
	}
	
}
