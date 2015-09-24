package com.view
{
	import com.consts.CConst;
	
	import flash.display.Bitmap;

	public class CImagesFactory
	{
		private static var _mInstance:CImagesFactory;
		
		public function CImagesFactory(prvm:PrivateManager)
		{
		}
		
		
		// SIMPLE FACTORY BY ASPECT RATION OF IMAGE
		public function getImageByAspectRation(btm:Bitmap):CCollageImage{
			var collageImage:CCollageImage;
			
			var type:String = (btm.height>btm.width) ? CConst.VERTICAL_IMG_TYPE : CConst.HORIZONTAL_IMG_TYPE;
			
			switch(type){
				case CConst.VERTICAL_IMG_TYPE:
					collageImage = new CVerticalImage(btm);
					break;
				
				default: 
					collageImage = new CHorizontalImage(btm);
					break;
			}
			
			return collageImage;
		}
		
		public static function get instance():CImagesFactory{
			return _mInstance = _mInstance == null ? new CImagesFactory(new PrivateManager()) : _mInstance;
		}
	}
}
class PrivateManager{}