package  
{
	import flash.text.AntiAliasType;
	import flash.text.TextDisplayMode;
	import org.flixel.*;
	public class ClockState extends FlxState
	{		
		[Embed(source = "n128 16.ttf", fontFamily = "n128", embedAsCFF = "false")] protected var fonter9:String;//16 
		[Embed(source = "snd.swf", symbol = "a11.wav")] public static var a11:Class;
		[Embed(source = "snd.swf", symbol = "a12.wav")] public static var a12:Class;
		[Embed(source = "snd.swf", symbol = "a13.wav")] public static var a13:Class;
		[Embed(source = "snd.swf", symbol = "a14.wav")] public static var a14:Class;
		[Embed(source = "snd.swf", symbol = "a15.wav")] public static var a15:Class;
		
		private var clkHrs:FlxText;
		private var clkMins:FlxText;
		private var clkSecs:FlxText;
		private var clkAm:FlxText;
		private var clkDots:FlxText;
		
		private var clk:FlxText;
		
		//private var cDate:Date;
		private var cHrs:String;
		private var cMins:String;
		private var cSecs:String;
		private var cms:String;
		private var cAm:String;
		private var _cDummy:FlxPoint;
		
		private var sHour:FlxSprite;
		private var sMin:FlxSprite;
		private var sSec:FlxSprite;
		private var sAm:FlxSprite;
		
		private var kHour:FlxSprite;
		private var kMin:FlxSprite;
		private var kSec:FlxSprite;
		private var kAm:FlxSprite;
		
		private var zx:FlxSprite;
		private var zy:FlxSprite;
		
		private var Sliders:FlxGroup;
		private var sounds:FlxGroup;
		private var m:FlxSprite;//mouse
		
		override public function create():void
		{
			FlxG.bgColor = 0x20c1eaff;//20
			Sliders = new FlxGroup;
			
			_cDummy = new FlxPoint(58, 20);//change this  0, 20			
			clkHrs = new FlxText(_cDummy.x,_cDummy.y,128,"08",true).setFormat("n128",64,0x804040, "left", 0x552B2B);add(clkHrs);
			clkDots = new FlxText(_cDummy.x+60,_cDummy.y-6,128,":     :",true).setFormat("n128",64,0x804040, "left", 0x552B2B);add(clkDots);
			clkMins = new FlxText(_cDummy.x+74,_cDummy.y,128,"20",true).setFormat("n128",64,0x804040, "left", 0x552B2B);add(clkMins);
			clkSecs = new FlxText(_cDummy.x +148, _cDummy.y,128, "10",true).setFormat("n128", 64, 0x804040, "left", 0x552B2B); add(clkSecs);
			clkAm = new FlxText(_cDummy.x +220, _cDummy.y,128, "AM",true).setFormat("n128", 64, 0x804040, "left", 0x552B2B); add(clkAm);
			
			clk = new FlxText(0, 80, FlxG.width, "", true).setFormat("n128", 64, 0x804040, "center", 0x552B2B);
			add(clk);
			clk.text = "12:30:12 AM";
			
			sHour = new FlxSprite(_cDummy.x-1-1, _cDummy.y+110).makeGraphic(60+5, 10, 0xff315764); add(sHour);
			sMin = new FlxSprite(_cDummy.x+73-1-3, _cDummy.y+110).makeGraphic(60+10-1, 10, 0xff315764); add(sMin);
			sSec = new FlxSprite(_cDummy.x+147-1-3, _cDummy.y+110).makeGraphic(60+10-1, 10, 0xff315764); add(sSec);
			sAm = new FlxSprite(_cDummy.x + 221-1-3, _cDummy.y + 110).makeGraphic(60+10, 10, 0xff315764); add(sAm);
			
			kHour = new FlxSprite(_cDummy.x - 1, _cDummy.y + 110 + 1).makeGraphic(8, 8, 0xffffffff); add(kHour); kHour.health = 1;
			kMin = new FlxSprite(_cDummy.x + 73-3, _cDummy.y + 110 + 1).makeGraphic(8, 8, 0xffffffff); add(kMin); kMin.health = 2;
			kSec = new FlxSprite(_cDummy.x + 147-3, _cDummy.y + 110 + 1).makeGraphic(8, 8, 0xffffffff); add(kSec); kSec.health = 3;
			kAm = new FlxSprite(_cDummy.x + 221-3, _cDummy.y + 110 + 1).makeGraphic(8, 8, 0xffffffff); add(kAm); kAm.health = 4;
			
			trace(kHour.x, kSec.x, kMin.x, kAm.x);
			
			sounds = new FlxGroup;
			for (i = 0; i < 5; i++)
				sounds.add(new FlxSprite(_cDummy.x+100+i*20, 160).makeGraphic(16, 20, 0xffffffff));
				
			for (i = 0; i < 5; i++)
				sounds.members[i].health = i + 1;
			add(sounds);
			
			Sliders.add(kHour);
			Sliders.add(kMin);
			Sliders.add(kSec);
			Sliders.add(kAm);			
			
			m = new FlxSprite(0, 0).makeGraphic(1, 1, 0x00000000); add(m);			
			
			zx = new FlxSprite(0, 0).makeGraphic(1, FlxG.height, 0xff000000); add(zx);
			zy = new FlxSprite(0, 0).makeGraphic(FlxG.width, 1, 0xff000000); add(zy);			
			zx.alpha = zy.alpha = 0;			
			
			FlxG.watch(FlxG.mouse, "x", "mouseX");
			FlxG.watch(FlxG.mouse, "y", "mouseY");		
			FlxG.watch(sMin, "x", "HrX");		
			FlxG.watch(sSec, "y", "HrY");		
			FlxG.volume = 1;
			//FlxG.play(a15);
		}
		
		private var x:Number = 0;
		override public function update():void 
		{
			/*x += FlxG.elapsed;
			if (x > 0.5)
			{
				x = 0;
				FlxG.play(a13);
			}*/
			var cDate:Date = new Date();
			if (cDate.getHours() > 11)
			{
				cHrs = String(cDate.getHours() - 12);
				cAm = "PM";
			}
			else 
			{
				cHrs = String(cDate.getHours());
				cAm = "AM";
			}
			if (cHrs.length < 2) cHrs = "0" + cHrs;		
			if (cHrs == "00") cHrs = "12";
			cMins = String(cDate.getMinutes());
			if (cMins.length < 2) cMins = "0" +cMins;
			cSecs = String(cDate.getSeconds());
			if (cSecs.length < 2) cSecs = "0" + cSecs;
			cms = String(cDate.getMilliseconds());
			
			clkHrs.text = cHrs;
			clkMins.text = cMins;
			clkSecs.text = cSecs;
			clkAm.text = cAm;
			
			clkDots.alpha = int(cms) / 1000;
			currentTime = cHrs + ":" + cMins + ":" + cSecs+" "+cAm ;
			/*cms = cms.slice(0, 1);
			if (cSecs.length < 1) cms = "0";*/
			//clk.text = cHrs + ":" + cMins + ":" + cSecs+" "+cAm ;
			
			m.x = zx.x = FlxG.mouse.x;
			m.y = zy.y = FlxG.mouse.y;
			
			kHour.color = kSec.color = kMin.color = kAm.color = 0x837005;
			
			if (FlxG.mouse.justReleased()) 
			{
				dragable = false;
			}
			
			FlxG.overlap(m, Sliders, sliderMove);
			
			if (dragable)
			{
				Sliders.members[sliderNum - 1].color = 0xF2BD1C;
				Sliders.members[sliderNum - 1].x = FlxG.mouse.x + dx;
			}
			
			if (kHour.x < 52+5) kHour.x = 52+5; if(kHour.x>=117-5)kHour.x = 117-5;
			if (kMin.x < 131-3) kMin.x = 131-3; if(kMin.x>=191-3-1)kMin.x = 191-3-1;
			if (kSec.x < 205-3) kSec.x = 205-3; if(kSec.x>=265-3-1)kSec.x = 265-3-1;
			if (kAm.x < 279-3) kAm.x = 279-3; if(kAm.x>=339-3)kAm.x = 339-3;
			
			f_hrs = String(Disp(52, 112, kHour, 5));
			f_mins = String(Disp(128, 189, kMin, 1));
			f_secs = String(Disp(202, 189, kSec, 1));
			if (kAm.x >= 276 && kAm.x < 311) f_am = "AM";
			else f_am = "PM";
			if (f_hrs.length < 2) f_hrs = "0" + f_hrs;			
			if (f_mins.length < 2) f_mins = "0" +f_mins;
			if (f_secs.length < 2) f_secs = "0" + f_secs;
			
			clk.text = f_hrs + ":" + f_mins + ":" + f_secs + " " + f_am;
			
			//clk.text = "12:30:12 AM";
			
			if (currentTime == clk.text)
			{
				ring = true;
			}
			if (FlxG.keys.justPressed("Q")) ring = true;
			if (FlxG.keys.justPressed("SPACE")) ring = false;
			
			if (ring)
			{
				timer += FlxG.elapsed;
				if (timer > 0.2) 
				{
					timer = 0;
					if(sndSelkt == 1)FlxG.play(a11);
					if(sndSelkt == 2)FlxG.play(a12);
					if(sndSelkt == 3)FlxG.play(a13);
					if(sndSelkt == 4)FlxG.play(a14);
					if(sndSelkt == 5)FlxG.play(a15);
				}
			}
			
			for (i = 0; i < 5; i++)
				if(sndSelkt != sounds.members[i].health)
					sounds.members[i].color = 0x8B0739;
					
			sounds.members[sndSelkt - 1].color = 0xDE0C5A;
			FlxG.overlap(m, sounds, soundKlik);
			
			super.update();
		}
		
		private function soundKlik(_m:FlxSprite, _s:FlxSprite):void 
		{
			_s.color = 0xDE0C5A;
			if (FlxG.mouse.justPressed())
			{
				sndSelkt = _s.health;
				if(sndSelkt == 1)FlxG.play(a11);
				if(sndSelkt == 2)FlxG.play(a12);
				if(sndSelkt == 3)FlxG.play(a13);
				if(sndSelkt == 4)FlxG.play(a14);
				if(sndSelkt == 5)FlxG.play(a15);
			}
		}
		
		private var dx:int;
		private var dragable:Boolean = false;
		private var sliderNum:int;
		private var i:int = 0;
		private var f_hrs:String;
		private var f_mins:String;
		private var f_secs:String;
		private var f_am:String;
		private var currentTime:String;
		private var ring:Boolean;
		private var timer:Number = 0;
		private var sndSelkt:int = 1;
		
		private function sliderMove(_m:FlxSprite, _s:FlxSprite):void 
		{			
			_s.color = 0xF2BD1C;
			if (FlxG.mouse.justPressed())
			{
				dx = _s.x - FlxG.mouse.x;
				dragable = true;
				sliderNum = _s.health;
			}			
		}
		
		private function Disp(lowerLimit:int, upperLimit:int, _t:FlxSprite, itr:int):int 
		{
			return (_t.x - lowerLimit) / itr;
		}
	}
}