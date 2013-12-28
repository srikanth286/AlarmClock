package
{
	import org.flixel.*;
	[SWF(width="800", height="380", backgroundColor="0xffffff")]//640 480  840x480  600x480, 700x440 0xc1eaff
	//[Frame(factoryClass="aState_00_Preloader")] // add this in the end	
	// the place where the game starts
	public class AClock extends FlxGame
	{
		public function AClock():void
		{
			var _scl:int =2;
			
			super(800/_scl,380/_scl,ClockState,_scl,60,60); 		// game poster
			forceDebugger = true; 										// do u want to see the flixel debugger
			FlxG.volume = 1;
			FlxG.mouse.show();
		}
	}
}

