package com.models
{
	public class CDataModel
	{
		private var _mXmlUrls:Array;
		
		public function CDataModel() {}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		public function get mXmlUrls():Array {
			return _mXmlUrls;
		}

		public function addDataXML(value:Array):void {
			_mXmlUrls = value;
		}
		
		
		
	}
}