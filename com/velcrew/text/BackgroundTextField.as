/* AS3
	Copyright 2009 __Velcrew__.
*/
package com.velcrew.text {
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Luis Teixeira
	 *	@since  15.11.2009
	 */
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;

	/**
	 * TextField with CSS background-color like property
	 * @author Devon O.
	 */
	public class BackgroundTextField extends Sprite {

		private var _bg:Sprite = new Sprite();
		private var _bgcolor:uint = 0xFFFFFF;
		private var _tf:TextField = new TextField();

		private var _changed:Boolean = false;

		public function BackgroundTextField():void {
			super();
			addChild(_tf);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}

		public function set text(value:String):void {
			_tf.text = value;
			_changed = true;
			requestRedraw();
		}

		public function get text():String {
			return _tf.text;
		}

		public function set htmlText(value:String):void {
			_tf.htmlText = value;
			_changed = true;
			requestRedraw();
		}

		public function get htmlText():String {
			return _tf.htmlText;
		}

		public function set multiline(value:Boolean):void {
			_tf.multiline = value;
		}

		public function get multiline():Boolean {
			return _tf.multiline;
		}

		public function set wordWrap(value:Boolean):void {
			_tf.wordWrap = value;
		}

		public function get wordWrap():Boolean {
			return _tf.wordWrap;
		}

		public function set defaultTextFormat(value:TextFormat):void {
			_tf.defaultTextFormat = value;
		}

		public function get defaultTextFormat():TextFormat {
			return _tf.defaultTextFormat;
		}

		public function set embedFonts(value:Boolean):void {
			_tf.embedFonts = value;
		}

		public function get embedFonts():Boolean {
			return _tf.embedFonts;
		}

		public function set styleSheet(value:StyleSheet):void {
			_tf.styleSheet = value;
			_changed = true;
			requestRedraw();
		}

		public function get styleSheet():StyleSheet {
			return _tf.styleSheet;
		}

		public function set selectable(value:Boolean):void {
			_tf.selectable = value;
		}

		public function get selectable():Boolean {
			return _tf.selectable;
		}

		public function set autoSize(value:String):void {
			_tf.autoSize = value;
		}

		public function get autoSize():String {
			return _tf.autoSize;
		}

		public function set backgroundColor(value:uint):void {
			_bgcolor = value;
			_changed = true;
			requestRedraw();
		}

		public function get backgroundColor():uint {
			return _bgcolor;
		}

		public function set mouseWheelEnbabled(value:Boolean):void {
			_tf.mouseWheelEnabled = value;
		}

		public function get mouseWheelEnbabled():Boolean {
			return _tf.mouseWheelEnabled;
		}

		public function set antiAliasType(value:String):void {
			_tf.antiAliasType = value;
		}

		public function get antiAliasType():String {
			return _tf.antiAliasType;
		}

		public function get textHeight():Number {
			return _tf.textHeight;
		}

		public function get textWidth():Number {
			return _tf.textWidth;
		}

		public function get length():int {
			return _tf.length;
		}

		public function setTextFormat(format:TextFormat, beginIndex:int = -1, endIndex:int = -1):void {
			_tf.setTextFormat(format, beginIndex, endIndex);
			_changed = true;
			requestRedraw();
		}

		public function set textColor(value:uint):void {
			_tf.textColor = value;
		}

		public function get textColor():uint {
			return _tf.textColor;
		}

		override public function set width(value:Number):void {
			_tf.width = value;
			_changed = true;
			requestRedraw();
		}

		override public function get width():Number {
			return _tf.width;
		}

		override public function set height(value:Number):void {
			_tf.height = value;
		}

		override public function get height():Number {
			return _tf.height;
		}

		override public function set mouseEnabled(value:Boolean):void {
			super.mouseEnabled = value;
			_tf.mouseEnabled = value;
		}

		private function drawBackground():void {
			if (contains(_bg)) {
				removeChild(_bg);
				_bg = new Sprite();
			}
			_bg.mouseChildren = false;
			_bg.mouseEnabled = false;
			var i:int = _tf.numLines;
			if (i > 0) {
				while (i--) {
					var met:TextLineMetrics = _tf.getLineMetrics(i);
					var lbg:Sprite = lineBackground(met.width, met.height);
					lbg.y = i * (lbg.height);
					lbg.x = met.x;
					_bg.addChild(lbg);
				}
				addChildAt(_bg, 0);
			}
			_changed = false;
		}

		private function lineBackground(w:Number, h:Number):Sprite {
			var s:Sprite = new Sprite();
			s.graphics.beginFill(_bgcolor);
			s.graphics.drawRect(0-4, 0-1, w+15, h);
//			s.graphics.drawRect(0-4, 0-1, w+15, h+1);
			s.graphics.endFill();
			return s;
		}

		private function requestRedraw():void {
			if (stage) {
				stage.invalidate();
			}
		}

		private function onAddedToStage(event:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener(Event.RENDER, onRender);
			if (_changed) {
				requestRedraw();
			}
		}

		private function onRender(event:Event):void {
			if (_changed) {
				drawBackground();
			}
		}

		private function onRemovedFromStage(event:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			stage.removeEventListener(Event.RENDER, onRender);
		}
	}
}