package
{
	import com.consts.CConst;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="800", height="500", frameRate="60", backgroundColor="#101015")] 
	public class RobotlegsGallery extends Sprite
	{
		private var _mContext:CAppContext;
		
		public function RobotlegsGallery() {
			if (stage) onAddedToStageHandler();
			else this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStageHandler, false, 0, true);
		}
		
		private function onAddedToStageHandler(e:Event = null):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStageHandler);
			
			CConst.DEFAULT_CELL_WIDTH = stage.stageWidth / CConst.COLUMN;
			CConst.DEFAULT_CELL_HEIGHT = stage.stageHeight / CConst.ROWS;
			
			this._mContext = new CAppContext(this);
			
			///---------- EXTRA TASK FOR COMPARING AND SORTING--------------////////
			var arr1:Array = [1,2,1,1,3,8,7,6];
			var arr2:Array = [1,1,2,11,4,10,9,4,5,9,11,0];
			arr1.sort(sortIntArr);
			arr2.sort(sortIntArr);
			trace(compareTwoArraysWithSameOrders(arr1, arr2));
		}
		
		// Function return new comparing between two arrays (n+m) and sort it in the same way
		private function compareTwoArraysWithSameOrders(arr1:Array, arr2:Array):Array{
			var comparedArr:Array = [];
			
			for each(var item:Object in arr1) {
				comparedArr.push(item);
			}
			for each(item in arr2) {
				comparedArr.push(item);
			}
			
			comparedArr.sort(sortIntArr);
			
			return comparedArr;
		}
		
		private function sortIntArr(arg1:int, arg2:int):int{
			if(arg1 > arg2){
				return 1;
			}else{
				return -1;
			}
			return 0;
		}
	}
}