package com.mediators
{
	import flash.display.Sprite;

	public interface ICollageble
	{
		function getXOVByIndex(ind:int):Number;
		function getYOVByIndex(ind:int):Number;
		function get view():Sprite;
	}
}