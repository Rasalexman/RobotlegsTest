package test
{
	import com.controllers.CLoadDataCommand;
	import com.controllers.CStartLoadImagesCommand;
	import com.models.CDataModel;
	import com.services.CLoadDataService;
	import com.services.CLoadImagesService;
	import com.services.ILoadDataService;
	import com.services.ILoadImagesService;
	import com.signals.CCompleteLoadImageSignal;
	import com.signals.CLoadingDataSignal;
	import com.signals.CStartLoadImagesSignal;
	
	import flash.display.Sprite;
	
	import org.flexunit.assertThat;
	
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.extensions.signalCommandMap.impl.SignalCommandMap;

	public class RobotlegGallaryTest
	{		
		
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private var robotGallery:CAppContext;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		
		[Before]
		public function before():void
		{
			robotGallery = new CAppContext(new Sprite());
		}
		
		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/
		
		[Test( description = "This tests trying to get some static data xml" )]  
		public function testToGetStaticData():void
		{
			trace("TEST OR RUN");
			robotGallery.context.injector.map(ISignalCommandMap).toSingleton(SignalCommandMap);
			robotGallery.context.injector.map(ILoadDataService).toSingleton(CLoadDataService);
			robotGallery.context.injector.map(ILoadImagesService).toSingleton(CLoadImagesService);
			
			robotGallery.context.injector.getInstance(ISignalCommandMap).map(CStartLoadImagesSignal).toCommand(CStartLoadImagesCommand);
			robotGallery.context.injector.getInstance(ISignalCommandMap).map(CLoadingDataSignal).toCommand(CLoadDataCommand);
			robotGallery.context.injector.getInstance(ISignalCommandMap).map(CCompleteLoadImageSignal).toCommand(null);
			
			// MODEL
			robotGallery.context.injector.map(CDataModel).asSingleton();
			robotGallery.context.injector.getInstance(CLoadingDataSignal).dispatch("HELLO_TEST");
			
			var actual:Array = robotGallery.context.injector.getInstance(CDataModel).mXmlUrls;
			
			org.flexunit.assertThat(actual == null);
			//assertThat(actual);
		}
				
		[Test]
		public function testingLoadingDataCommand():void
		{
			trace("TEST OR testingLoadingDataCommand");
			//robotGallery.context.injector.getInstance(CLoadingDataSignal).dispatch("HELLO_TEST");
			//assertEquals(CAppEvent.LOAD_DATA);
		}
	}
}