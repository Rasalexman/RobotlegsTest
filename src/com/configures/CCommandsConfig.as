package com.configures
{
	import com.controllers.CAddImageCommand;
	import com.controllers.CCompleteLoadImageCommand;
	import com.controllers.CCreateImageCollageCommand;
	import com.controllers.CLoadDataCommand;
	import com.controllers.CRecalculateCommand;
	import com.controllers.CStartLoadImagesCommand;
	import com.signals.CAddImageSignal;
	import com.signals.CCompleteLoadImageSignal;
	import com.signals.CCreateImageCollageSignal;
	import com.signals.CLoadingDataSignal;
	import com.signals.CRecalculateSignal;
	import com.signals.CStartLoadImagesSignal;
	
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;

	public class CCommandsConfig
	{
		[Inject]
		public var 	mSignalCommandMap:ISignalCommandMap;
					
		[PostConstruct]
		public function configure():void {
			// EXTENDED EVENT MODEL - SIGNALS
			mSignalCommandMap.map(CLoadingDataSignal).toCommand(CLoadDataCommand);
			mSignalCommandMap.map(CStartLoadImagesSignal).toCommand(CStartLoadImagesCommand);
			mSignalCommandMap.map(CCompleteLoadImageSignal).toCommand(CCompleteLoadImageCommand);
			mSignalCommandMap.map(CCreateImageCollageSignal).toCommand(CCreateImageCollageCommand);
			mSignalCommandMap.map(CAddImageSignal).toCommand(CAddImageCommand);
			mSignalCommandMap.map(CRecalculateSignal).toCommand(CRecalculateCommand);
		}
	}
}