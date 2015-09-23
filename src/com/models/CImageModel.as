package com.models
{
	import flash.display.Bitmap;
		
	public class CImageModel
	{
		public function CImageModel() { }
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		public function addImages(value:Bitmap):void {
			if (!_images)
				_images = new Vector.<Bitmap>();
			_images.push(value);
		}
		
		public function get indexClick():int{
			return _indexClick;
		}
		
		public function set indexClick(value:int):void{
			_indexClick = value;
		}
		
		public function getRawImage(i:int):Bitmap{
			return _images.removeAt(i);
		}
		
		public function get totalCount():int{
			return _images.length;
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------
		
		private var _images:Vector.<Bitmap>;
		private var _indexClick:int = -1;
	}
}