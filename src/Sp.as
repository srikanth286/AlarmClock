package 
{
	import org.flixel.*;
	//level select for join game
	public class  cObject_07_JoinRoomSelect extends FlxGroup
	{
		public var health:int;			// to check for num in menu state
		public var select:FlxSprite;	// the select sprite
		private var Name:FlxText;		// the name text
		
		[Embed(source="data/099_font.ttf",fontFamily="lou",embedAsCFF="false")] protected var fonter:String;
		public function cObject_07_JoinRoomSelect(X:int,Y:int,Health:int,playerName:String,LevelName:String,Players:String,LevelID:String,ID:String):void 
		{
			super();
			select = new FlxSprite(X, Y);//.makeGraphic(540, 22, 0xffffffff);//20
			select.loadGraphic(AssetManager.joinGameSelectorsImg, true, false, 540, 22);
			select.addAnimation("off", [0]);
			select.addAnimation("on", [1]);
			select.addAnimation("clicked", [2]);
			select.play("off");
			select.health = Health;
			select.bobName = LevelID;
			select.extraName = ID;
			add(select);
			
			var k:int = 0;
			var i:int = 0;
			var l:String = LevelName;		
			var n:String = playerName;
			if (n.length > 17) n = n.slice(0, 17);
			else
			{
				k = 17 - n.length;
				for (i = 0; i < k; i++)
					n = n + " ";
			}			
			if (l.length > 17) l = l.slice(0, 17);
			else
			{
				k = 17 - l.length;
				for (i = 0; i < k; i++)
					l = l + " ";
			}
			
			Name = new FlxText(X, Y , 540, "").setFormat("lou", 16, 0xEAEAEA, "left");
			Name.text = " " + n + "   " + l + "   " + Players;
			add(Name);
			
		}
		
		//=================================
		//       update
		//=================================
		override public function update():void 
		{
			Name.y = select.y+2;
			
			if (select.y < 83 || select.y > 425)	
			{
				select.alpha = 0;
				Name.alpha = 0;
			}
			else 
			{
				select.alpha = 1;
				Name.alpha = 1;
			}
			super.update();
		}
	}
}