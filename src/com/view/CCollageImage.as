package com.view
{
	import com.consts.CConst;
	import com.mediators.ICollageble;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class CCollageImage extends Sprite implements ICollageble
	{
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------
		protected var	_mBitmap		:Bitmap,		// CURRENT BTM IMG
						_mImageType		:String;		// Image TYPE HOR / VERT
		
		public function CCollageImage(image:Bitmap, type:String = "") {
			super();
			mouseChildren = false;
			buttonMode = true;
			_mBitmap = image;
			_mImageType = type;
			this.addChild(_mBitmap);
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		public function get view():Sprite{ return this; }
		
		public function getXOVByIndex(ind:int):Number{
			return int(ind % CConst.COLUMN) * CConst.DEFAULT_CELL_WIDTH + ((CConst.DEFAULT_CELL_WIDTH - this.width)>>1);
		}
		public function getYOVByIndex(ind:int):Number{
			return int(ind / CConst.COLUMN) * CConst.DEFAULT_CELL_HEIGHT + ((CConst.DEFAULT_CELL_HEIGHT - this.height)>>1);
		}
		
		public function destroyBitmap():void {
			removeChild(_mBitmap);
			_mBitmap.bitmapData.dispose();
			_mBitmap = null;
		}
	}
}