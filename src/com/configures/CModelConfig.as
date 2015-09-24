package com.configures
{
	import com.models.CDataModel;
	import com.models.CImageModel;
	
	import robotlegs.bender.framework.api.IInjector;

	public class CModelConfig
	{
		[Inject]
		public var 	mInjector:IInjector;
		
		[PostConstruct]
		public function configure():void {
			// MODEL
			mInjector.map(CDataModel).asSingleton();
			mInjector.map(CImageModel).asSingleton();
		}
	}
}