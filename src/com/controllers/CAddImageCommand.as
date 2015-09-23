package com.controllers
{
	import com.consts.CConst;
	import com.signals.CStartLoadImagesSignal;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class CAddImageCommand extends Command
	{
		[Inject]
		public var 	mLoadImageSignal	:CStartLoadImagesSignal;
		
		public function CAddImageCommand(){	}
		
		override public function execute():void {
			// HERE WE CAN DOWNLOAD OR GET ANOTHER IMAGES URLS FROM MODEL OR SMTH ELSE
			// IN THIS CASE I DOWNLOAD ONLY IMAGE URLS THAT I GET FROM STATIC
			var randomLoadingImageURL:String = CConst.FILES_LIST[random(0, CConst.FILES_LIST.length-1)];
			mLoadImageSignal.dispatch([randomLoadingImageURL]);
		}
		public function random(nMinimum:Number, nMaximum:Number = 0, nRoundToInterval:Number = 1):Number {
			if(nMinimum > nMaximum) {
				var nTemp:Number = nMinimum;
				nMinimum = nMaximum;
				nMaximum = nTemp;
			}
			var nDeltaRange:Number = (nMaximum - nMinimum) + (1 * nRoundToInterval);
			var nRandomNumber:Number = Math.random() * nDeltaRange;
			nRandomNumber += nMinimum;
			return Math.floor(nRandomNumber / nRoundToInterval) * nRoundToInterval;
		}
	}
}