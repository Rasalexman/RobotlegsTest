package
{
	import com.consts.CConst;
	import com.controllers.CAddImageCommand;
	import com.controllers.CCreateImageCollageCommand;
	import com.controllers.CCompleteLoadImageCommand;
	import com.controllers.CStartLoadImagesCommand;
	import com.controllers.CRecalculateCommand;
	import com.mediators.CCollageImageMediator;
	import com.mediators.ICollageble;
	import com.models.CImageModel;
	import com.services.CLoadImagesService;
	import com.services.ILoadImagesService;
	import com.signals.CAddImageSignal;
	import com.signals.CCreateImageCollageSignal;
	import com.signals.CCompleteLoadImageSignal;
	import com.signals.CStartLoadImagesSignal;
	import com.signals.CRecalculateSignal;
	
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.extensions.signalCommandMap.impl.SignalCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;

	/**
	 * ...
	 * @author Alexander M.
	 */
	
	public class CAppConfig // implements IConfig
	{
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var 	mInjector:IInjector,
				   	mediatorMap:IMediatorMap,
					//commandMap:IEventCommandMap,
					contextView:ContextView,
					context:IContext,
					dispatcher:IEventDispatcher;
		
		[PostConstruct]
		public function configure():void {
			
			mInjector.map(ISignalCommandMap).toSingleton(SignalCommandMap);
			
			// MODEL
			mInjector.map(CImageModel).asSingleton();
			
			// SERVICE TO LOAD AN IMAGES
			mInjector.map(ILoadImagesService).toSingleton(CLoadImagesService);
			
			// COMMANDS FOR STANDART FLASH MODEL
			/*
			commandMap.map(Event.INIT).toCommand(CLoadImagesCommand);
			commandMap.map(CAppEvent.LOAD_COMPLETE).toCommand(CLoadCompleteCommand);
			commandMap.map(CAppEvent.CREATE_COLLAGE).toCommand(CCreateImageCollageCommand);
			commandMap.map(CAppEvent.ADD_IMAGE).toCommand(CAddImageCommand);
			commandMap.map(CAppEvent.RECALCULATE).toCommand(CRecalculateCommand);
			*/
			
			// EXTENDED EVENT MODEL - SIGNALS
			var instance:ISignalCommandMap = mInjector.getInstance(ISignalCommandMap);
			instance.map(CStartLoadImagesSignal).toCommand(CStartLoadImagesCommand);
			instance.map(CCompleteLoadImageSignal).toCommand(CCompleteLoadImageCommand);
			instance.map(CCreateImageCollageSignal).toCommand(CCreateImageCollageCommand);
			instance.map(CAddImageSignal).toCommand(CAddImageCommand);
			instance.map(CRecalculateSignal).toCommand(CRecalculateCommand);
			
			// MEDIATORS
			mediatorMap.map( ICollageble ).toMediator( CCollageImageMediator );
			
			context.afterInitializing(initContext);
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------
		private function initContext():void {
			// 
			mInjector.getInstance(CStartLoadImagesSignal).dispatch(CConst.FILES_LIST);
			//dispatcher.dispatchEvent(new Event(Event.INIT));
		}
	}
}