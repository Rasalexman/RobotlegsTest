package com.controllers
{
	import com.events.CAppEvent;
	import com.models.CImageModel;
	import com.signals.CRecalculateSignal;
	import com.view.CCollageImage;
	import com.view.CImagesFactory;
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.contextView.ContextView;
	
	public class CCreateImageCollageCommand extends Command
	{
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var 	mImageModel				:CImageModel,
					mRecSignal				:CRecalculateSignal,
					mContextView			:ContextView;
		
		public function CCreateImageCollageCommand() { }
		
		override public function execute():void {
			//trace("CCreateImageContentCommand execute");
			var i:int = mImageModel.totalCount;
			var collageImg:CCollageImage;
			
			while(i--){
				collageImg = CImagesFactory.instance.getImageByAspectRation(mImageModel.getRawImage(i));
				collageImg.x = collageImg.getXOVByIndex(mContextView.view.numChildren);
				collageImg.y = collageImg.getYOVByIndex(mContextView.view.numChildren);				
				mContextView.view.addChild(collageImg);
			}
			
			mRecSignal.dispatch(CAppEvent.RECALCULATE_COLLAGE);
		}
	}
}