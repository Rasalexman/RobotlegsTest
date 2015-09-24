package com.view
{
	import com.consts.CConst;
	
	import flash.display.Bitmap;
	
	public class CHorizontalImage extends CCollageImage
	{
		public function CHorizontalImage(image:Bitmap) {
			image.width=CConst.DEFAULT_CELL_WIDTH;
			image.scaleY=image.scaleX;
			super(image, CConst.HORIZONTAL_IMG_TYPE);
		}
	}
}