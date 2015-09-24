package com.configures
{
	import com.mediators.CCollageImageMediator;
	import com.mediators.ICollageble;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

	public class CMediatorsConfig
	{
		[Inject]
		public var 	mediatorMap:IMediatorMap;
		
		[PostConstruct]
		public function configure():void {
			// MEDIATORS
			mediatorMap.map( ICollageble ).toMediator( CCollageImageMediator );
		}
	}
}