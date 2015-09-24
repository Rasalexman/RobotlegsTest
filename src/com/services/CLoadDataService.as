package com.services
{
	import com.consts.CConst;
	import com.models.CDataModel;
	import com.signals.CStartLoadImagesSignal;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class CLoadDataService implements ILoadDataService
	{
		[Inject]
		public var 	mDataModel					:CDataModel,
					mStartLoadImagesSignal		:CStartLoadImagesSignal;
		
		public function CLoadDataService(){ }
		
		public function loadStaticData():void{
			var urlReq:URLRequest = new URLRequest(CConst.XML_URL);
			var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, onXMLLoadComplete, false, 0, true);
			xmlLoader.load(urlReq);
		}
		
		private function onXMLLoadComplete(event:Event):void {
			var urlLoader:URLLoader = URLLoader(event.currentTarget);
			urlLoader.removeEventListener(Event.COMPLETE, onXMLLoadComplete);
			var xmlData:XML = XML(urlLoader.data);
			var xmlList:XMLList = xmlData.children();
			var linksArr:Array = [];
			var xmlLink:XML;
			for (var i:int = 0; i < xmlList.length(); i++) {
				xmlLink = xmlList[i];
				linksArr[i] = String(xmlLink.@link);
			}
			mDataModel.addDataXML(linksArr);
			mStartLoadImagesSignal.dispatch(linksArr);
		}
	}
}