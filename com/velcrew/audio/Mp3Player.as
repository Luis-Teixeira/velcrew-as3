package com.velcrew.audio
{
	/**
	 *	Class description.
	 *	
	 *	Mp3Player
	 *	
	 *	usage
	 *  
	 *	var player:Mp3Player = new Mp3Player();
	 *  player.play('blah.mp3');
	 *  
	 *	or
	 *  
	 *	var player:Mp3Player = new Mp3Player();
	 *  player.playlist = ['item1.mp3','item2.mp3'];
	 *  player.next();
	 *	
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author http://unformatt.com/news/as3-mp3-player/
	 *	@since  29.05.2009
	 */
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;		

	public class Mp3Player extends EventDispatcher {

		static public const EVENT_TIME_CHANGE:String = 'Mp3Player.TimeChange';
		static public const EVENT_VOLUME_CHANGE:String = 'Mp3Player.VolumeChange';
		static public const EVENT_PAN_CHANGE:String = 'Mp3Player.PanningChange';
		static public const EVENT_PAUSE:String = 'Mp3Player.Pause';
		static public const EVENT_UNPAUSE:String = 'Mp3Player.Unpause';
		static public const EVENT_PLAY:String = 'Mp3Player.Play';
		//
		public var playing:Boolean;
		public var playlist:Array;
		public var currentUrl:String;
		public var playlistIndex:int = -1;
		//
		protected var sound:Sound;
		protected var soundChannel:SoundChannel;
		protected var soundTrans:SoundTransform;
		protected var progressInt:Number;

		public function play( url:String ):void {
			clearInterval(progressInt);
			if ( sound ) {
				soundChannel.stop();
			}
			currentUrl = url;
			sound = new Sound();
			sound.addEventListener(Event.COMPLETE, onLoadSong);
			sound.addEventListener(Event.ID3, onId3Info);

			sound.load(new URLRequest(currentUrl));

			soundChannel = sound.play();
			if ( soundTrans ) {
				soundChannel.soundTransform = soundTrans;
			} else {
				soundTrans = soundChannel.soundTransform;
			}
			soundChannel.addEventListener(Event.COMPLETE, onSongEnd);
			playing = true;
			clearInterval(progressInt);
			progressInt = setInterval(updateProgress, 30);
			dispatchEvent(new Event(EVENT_PLAY));
		}
		public function pause():void {
			if ( soundChannel ) {
				soundChannel.stop();
				dispatchEvent(new Event(EVENT_PAUSE));
				playing = false;
			}
		}
		public function unpause():void {
			if ( playing ) return;
			if ( soundChannel.position < sound.length ) {
				soundChannel = sound.play(soundChannel.position);
				soundChannel.soundTransform = soundTrans;
			} else {
				soundChannel = sound.play();
			}
			dispatchEvent(new Event(EVENT_UNPAUSE));
			playing = true;
		}
		public function seek( percent:Number ):void {
			soundChannel.stop();
			soundChannel = sound.play(sound.length * percent);
			if(!playing)pause(); 
		}
		public function prev():void {
			playlistIndex--;
			if ( playlistIndex < 0 ) playlistIndex = playlist.length - 1;
			play(playlist[playlistIndex]);
		}
		public function next():void {
			playlistIndex++;
			if ( playlistIndex == playlist.length ) playlistIndex = 0;
			play(playlist[playlistIndex]);
		}
		public function get volume():Number {
			if (!soundTrans) return 0;
			return soundTrans.volume;
		}
		public function set volume( n:Number ):void {
			if ( !soundTrans ) return;
			soundTrans.volume = n;
			soundChannel.soundTransform = soundTrans;
			dispatchEvent(new Event(EVENT_VOLUME_CHANGE));
		}
		public function get pan():Number {
			if (!soundTrans) return 0;
			return soundTrans.pan;
		}
		public function set pan( n:Number ):void {
			if ( !soundTrans ) return;
			soundTrans.pan = n;
			soundChannel.soundTransform = soundTrans;
			dispatchEvent(new Event(EVENT_PAN_CHANGE));
		}
		public function get length():Number {
			return sound.length;
		}
		public function get time():Number {
			return soundChannel.position;
		}
		public function get timePretty():String {
			var secs:Number = soundChannel.position / 1000;
			var mins:Number = Math.floor(secs / 60);
			secs = Math.floor(secs % 60);
			return mins + ":" + (secs < 10 ? "0" : "") + secs;
		}
		public function get timePercent():Number {
			if ( !sound.length ) return 0;
			return soundChannel.position / sound.length;
		}
		protected function onLoadSong( e:Event ):void {
		}
		protected function onSongEnd( e:Event ):void {
			if ( playlist )
				next();
		}
		protected function onId3Info( e:Event ):void {
			dispatchEvent(new Event(Event.ID3, e.target.id3));
		}
		protected function updateProgress():void {
			dispatchEvent(new Event(EVENT_TIME_CHANGE));
			if ( timePercent >= .99 ) {
				onSongEnd(new Event(Event.COMPLETE));
				clearInterval(progressInt);
			}
		}
		
		public function killMp3() : void {
			
			soundChannel.stop()
			//sound.close();
			soundChannel = null;
			sound = null;
			clearInterval(progressInt);
		}
		
	}
}