package com.controllers
{
	import com.services.ILoadDataService;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class CLoadDataCommand extends Command
	{
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var 	mLoadDataService:ILoadDataService,
					mSignalParam:String;
		
		public function CLoadDataCommand() {}
		
		override public function execute():void {
			trace("CStartLoadDataCommand execute event",mSignalParam);
			mLoadDataService.loadStaticData();
		}
	}
}