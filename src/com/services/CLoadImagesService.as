package com.services
{
	import com.consts.CConst;
	import com.events.CAppEvent;
	import com.models.CImageModel;
	import com.signals.CCreateImageCollageSignal;
	import com.signals.CCompleteLoadImageSignal;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;

	public class CLoadImagesService implements ILoadImagesService
	{
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var 	mLoadCompleteSignal				:CCompleteLoadImageSignal,
					mDispatcher						:IEventDispatcher;
					
					
		///////////------- PRIVATE SECTION
		private var _mTotal:uint,
					_mLoaded:uint;
		
		public function CLoadImagesService() { }
		
		public function loadImages(urls:Array, waitAllComplete:Boolean = false):void{
			_mLoaded = 0;
			_mTotal = urls.length;
			var loader:Loader;
			for (var i:int = 0; i < _mTotal; i++) {
				loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadHandler, false, 0, true);
				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler, false, 0, true);
				loader.load(new URLRequest(urls[i]));
			}
		}
		
		//--------------------------------------------------------------------------
		//
		// HANDLERS SECTION 
		//
		//--------------------------------------------------------------------------
		private function onImageLoadHandler(event:Event):void {
			var info:LoaderInfo = LoaderInfo(event.currentTarget);
			info.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onImageLoadHandler);
			info.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
			_mLoaded++;
			mLoadCompleteSignal.dispatch(Bitmap(info.content));
		}
		
		private function onErrorHandler(event:ErrorEvent):void {
			throw new Error("bad link or internet disconnect");
		}
	}
}