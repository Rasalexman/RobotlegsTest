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
		private var	_mBitmap:Bitmap;		// CURRENT BTM IMG
		
		public function CCollageImage(image:Bitmap) {
			super();
			mouseChildren = false;
			buttonMode = true;
			_mBitmap = image;
			scaleImg();
			this.addChild(_mBitmap);
		}
	
		protected function scaleImg():void{
			_mBitmap.width=CConst.DEFAULT_CELL_WIDTH;
			_mBitmap.scaleY=_mBitmap.scaleX;
			
			if(_mBitmap.height>CConst.DEFAULT_CELL_HEIGHT){
				_mBitmap.height=CConst.DEFAULT_CELL_HEIGHT;
				_mBitmap.scaleX=_mBitmap.scaleY;
			}
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
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