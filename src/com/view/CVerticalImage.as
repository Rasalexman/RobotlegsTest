package com.view
{
	import com.consts.CConst;
	
	import flash.display.Bitmap;
	
	public class CVerticalImage extends CCollageImage
	{
		public function CVerticalImage(image:Bitmap) {
			image.height=CConst.DEFAULT_CELL_HEIGHT;
			image.scaleX=image.scaleY;
			super(image, CConst.VERTICAL_IMG_TYPE);
		}
	}
}