package com.controllers
{
	import com.services.ILoadImagesService;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class CStartLoadImagesCommand extends Command
	{
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var 	mLoadImageService:ILoadImagesService,
					mSignalUrlsParam:Array;
		
		public function CStartLoadImagesCommand()	{ }
		
		override public function execute():void {
			//trace("CStartLoadImagesCommand execute event",mSignalUrlsParam);
			mLoadImageService.loadImages(mSignalUrlsParam);
		}
	}
}