package com.events
{
	import flash.events.Event;

	public class CAppEvent  extends Event
	{
		
		///////// CONSTS
		public static const IMAGE_CLICK				:String = "imageClick",
							LOAD_DATA				:String = "dataLoading",
							LOAD_IMAGE_COMPLETE		:String = "loadComplete",
							CREATE_COLLAGE			:String = "createCollage",
							ADD_IMAGE				:String = "addImage",
							RECALCULATE_COLLAGE		:String = "recalculateCollage";
		
		private var _mData:*;
		
		public function CAppEvent(type:String, data:* = null) {
			super(type);
			_mData = data;
		}
		
		override public function clone():Event {
			return new CAppEvent(type, _mData);
		}
		
		override public function toString():String {
			return formatToString("CAppEvent", "type", "data");
		}
		
		public function get data():* { return _mData; }
		
		
	}
}