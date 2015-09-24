package com.controllers
{
	import com.consts.CConst;
	import com.greensock.TweenLite;
	import com.view.CCollageImage;
	
	import flash.display.DisplayObjectContainer;
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.contextView.ContextView;
	
	public class CRecalculateCommand extends Command
	{
		
		[Inject]
		public var mContextView:ContextView;
		
		public function CRecalculateCommand(){	}
		
		override public function execute():void {
			var collageImg:CCollageImage;
			var view:DisplayObjectContainer = mContextView.view;
			var imgLen:uint = view.numChildren;
			
			var xov:Number;
			var yov:Number;
			for (var i:int = 0; i < imgLen; i++) {
				collageImg = CCollageImage(view.getChildAt(i));				
				xov = collageImg.getXOVByIndex(i);
				yov = collageImg.getYOVByIndex(i);
				TweenLite.to(collageImg, CConst.ANIMATION_MOVE_TIME, {x:xov, y:yov});
			}
		}
	}
}