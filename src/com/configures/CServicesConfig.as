package com.configures
{
	import com.services.CLoadDataService;
	import com.services.CLoadImagesService;
	import com.services.ILoadDataService;
	import com.services.ILoadImagesService;
	
	import robotlegs.bender.framework.api.IInjector;

	public class CServicesConfig
	{
		[Inject]
		public var 	mInjector:IInjector;
		
		[PostConstruct]
		public function configure():void {
			// SERVICES TO LOAD AN IMAGES
			mInjector.map(ILoadDataService).toSingleton(CLoadDataService);
			mInjector.map(ILoadImagesService).toSingleton(CLoadImagesService);
		}
	}
}