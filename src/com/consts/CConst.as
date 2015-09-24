package com.consts
{
	

	public class CConst
	{
		public function CConst() {
			throw new Error("class cannot be initialized");
		}
		
		public static const 	
			HORIZONTAL_IMG_TYPE:String = "horizontal_image_type",
			VERTICAL_IMG_TYPE:String = "vertical_image_type",
			
			XML_URL:String = "http://dancehalldancer.widetide.ru/data/links.xml",
			
			ANIMATION_FADE_TIME:Number = 0.5,
			ANIMATION_MOVE_TIME:Number = 0.2,
			
			COLUMN:uint = 4,
			ROWS:uint = 3;
		
		public static var 	DEFAULT_CELL_WIDTH:Number = 200,
							DEFAULT_CELL_HEIGHT:Number = 160;
		
		}
}