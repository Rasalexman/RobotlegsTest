package com.configures
{
	import com.events.CAppEvent;
	import com.signals.CLoadingDataSignal;
	
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.extensions.signalCommandMap.impl.SignalCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;

	/**
	 * ...
	 * @author Alexander M.
	 */
	
	public class CAppConfig
	{
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var 	mInjector:IInjector,
					context:IContext;
		
		[PostConstruct]
		public function configure():void {
			// INITIALIZE EXTENSION FOR SIGNALS
			mInjector.map(ISignalCommandMap).toSingleton(SignalCommandMap);		
			// MAIN STARTING FUNCTION
			context.afterInitializing(initContext);
		}
		
		//--------------------------------------------------------------------------
		//
		// START SECTION 
		//
		//--------------------------------------------------------------------------
		private function initContext():void {
			// EVENT TO START APPLICATION
			mInjector.getInstance(CLoadingDataSignal).dispatch(CAppEvent.LOAD_DATA);
			//dispatcher.dispatchEvent(new Event(Event.INIT));
		}
	}
}