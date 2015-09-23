package com.mediators
{
	import com.events.CAppEvent;
	import com.greensock.TweenLite;
	import com.models.CImageModel;
	import com.signals.CAddImageSignal;
	import com.view.CCollageImage;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.System;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.contextView.ContextView;
	
	public class CCollageImageMediator extends Mediator
	{
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var mImage					:CCollageImage,
				   mAddSignal				:CAddImageSignal,
				   mContextView				:ContextView,
				   mImageModel				:CImageModel;
		
		public function CCollageImageMediator() { }
		
		override public function initialize():void {
			eventMap.mapListener(mImage, MouseEvent.CLICK, clickHandler, MouseEvent, false, 0, true);
			eventMap.mapListener(mImage, Event.ADDED_TO_STAGE, onAddedToStageHandler, Event, false, 0, true);
		}
						
		//--------------------------------------------------------------------------
		//
		// EVENT HANDLERS
		//
		//--------------------------------------------------------------------------
		private function clickHandler(event:MouseEvent):void {
			mImage.buttonMode = mImage.mouseEnabled = false;
			TweenLite.to(mImage, 0.5, {alpha:0, onComplete:onFadeOutCompleteHandler});
		}
		private function onAddedToStageHandler(e:Event):void {
			TweenLite.from(mImage, 0.5, {alpha:0});
		}
		private function onFadeOutCompleteHandler(...params:Array):void{	
			// DESTROY BITMAP
			mImage.destroyBitmap();
			// SEND SIGNALS
			mAddSignal.dispatch(CAppEvent.ADD_IMAGE);
			
			// ДЛЯ СТАНДАРТНОЙ МОДЕЛИ СОБЫТИЙ 
			//eventDispatcher.dispatchEvent(new CAppEvent(CAppEvent.ADD_IMAGE));
			
			// REMOVE AND DESTROY 
			mContextView.view.removeChild(mImage);						
		}
		
		//--------------------------------------------------------------------------
		//
		// DESTROY SECTION 
		//
		//--------------------------------------------------------------------------
		override public function destroy():void{
			eventMap.unmapListener(mImage, MouseEvent.CLICK, clickHandler);
			eventMap.unmapListener(mImage, Event.ADDED_TO_STAGE, onAddedToStageHandler);
			
			mImage = null;
			mImageModel = null;
			mAddSignal = null;
			
			super.destroy();
			System.gc(); // FAST MEMORY CLEANING WE CAN RUN System.gc() BY ANOTHER WAY e.g.: BY COMMAND OR SMTH ELSE
		}
	}
}