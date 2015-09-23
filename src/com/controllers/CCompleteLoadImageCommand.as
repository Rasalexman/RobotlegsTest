package com.controllers
{
	import com.events.CAppEvent;
	import com.models.CImageModel;
	import com.signals.CCreateImageCollageSignal;
	
	import flash.display.Bitmap;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class CCompleteLoadImageCommand extends Command
	{
		[Inject]
		public var 	mImageModel						:CImageModel,
					//mDispatcher						:IEventDispatcher,
					mCreateImageCollageSignal		:CCreateImageCollageSignal,
					mLoadedImagesParam				:Bitmap;
		
		public function CCompleteLoadImageCommand()	{	}
		
		override public function execute():void {
			mImageModel.addImages(mLoadedImagesParam);		
			mCreateImageCollageSignal.dispatch(CAppEvent.CREATE_COLLAGE);
			//mDispatcher.dispatchEvent(new CAppEvent(CAppEvent.CREATE_COLLAGE));
		}
	}
}