package com.signals
{
	import flash.display.Bitmap;
	
	import org.osflash.signals.Signal;
	
	public class CCompleteLoadImageSignal extends Signal
	{
		public function CCompleteLoadImageSignal() {
			super(Bitmap);
		}
	}
}