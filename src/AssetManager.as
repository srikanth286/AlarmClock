package 
{
	public class AssetManager
	{
		[Embed(source="data/snd.swf",symbol = "clik")] public static var clkSnd:Class;
		[Embed(source = "data/img_cur.png")] public static var ImgCursor:Class;
		//[Embed(source = "data/myArrow.png")] public static var arrowImg:Class;	
		[Embed(source = "data/arrow2.png")] public static var arrowImg:Class;	
		
		// explosion files
		[Embed(source= "data/015_miniBulletWall.png")] public static var miniBulletWallMap:Class;
		[Embed(source= "data/016_brick_grenade.png")] public static var grenadeMap:Class;
		[Embed(source= "data/017_brick_mole.png")] public static var moleMap:Class;
		[Embed(source= "data/018_brick_moleExplosion.png")] public static var moleExplosionMap:Class;
		[Embed(source= "data/019_brick_rocketLauncherTest.png")] public static var rocketExploMap:Class;
		[Embed(source= "data/020_brick_giantBrick.png")] public static var giantBrickMap:Class;
		[Embed(source= "data/012_mediumExplosion.png")] public static var explosion72:Class;
		[Embed(source= "data/011_smallExplosion.png")] public static var explosion50:Class;
		[Embed(source = "data/013_largeExplosion.png")] public static var explosion170:Class;
		[Embed(source = "data/pow.png")] public static var powImg:Class;		
		[Embed(source = "data/wham.png")] public static var whamImg:Class;	
		
		[Embed(source= "data/021_particle.png")] public static var particleImg:Class;
		[Embed(source = "data/tnt.png")] public static var tntImg:Class;
		[Embed(source = "data/pumpkin.png")] public static var pumpkinImg:Class;
		[Embed(source = "data/sheet014.png")] public static var playerImg:Class;//()()()()()()()()()()()()()()()()()()()()sheet014
		[Embed(source = "data/playerPointer.png")] public static var playerPointerImg:Class;
		[Embed(source = "data/hats 60x30.png")] public static var allHatsImg:Class;
		[Embed(source = "data/hat.png")] public static var hatImg:Class;//<<<<<<<<<<<<<<<<<<<remove later
		[Embed(source = "data/yhats.png")] public static var testhatImg:Class;//<<<<<<<<<<<<<<<<<<<remove later  ()()()()
		[Embed(source = "data/weapons sheet4 100x50.png")] public static var handImg:Class;
		[Embed(source = "data/brickShield.png")] public static var imgBrick:Class;// brick shield
		[Embed(source = "data/001_tiles3.png")] public static var tileImg:Class;
		//[Embed(source = "data/002_tileBorder.png")] public static var tileBorderImg:Class;//autotiles_alt.png
		[Embed(source = "data/p25.png")] public static var imgMap:Class;//remove later <<<<<<<<<<		
		[Embed(source = "data/024_sliderButton.png")] public static var sliderButtonImg:Class;
		[Embed(source = "data/025_sliderBg.png")] public static var sliderBgImg:Class;
		[Embed(source = "data/026_menuButton150x30.png")] public static var menuButton150Img:Class;
		[Embed(source = "data/027_menuButton100x30.png")] public static var menuButton100Img:Class;
		[Embed(source = "data/028_menuButton30x30.png")] public static var menuButton30Img:Class;		
		[Embed(source = "data/029_healthBarBg.png")] public static var healthbarBgImg:Class;		
		[Embed(source = "data/030_healthBarFg.png")] public static var healthbarFgImg:Class;		
		[Embed(source = "data/crosshair.png")] public static var crosshairImg:Class;
		[Embed(source = "data/flameParticles.png")] public static var flameParticlesImg:Class;
		[Embed(source = "data/menuwood3.png")] public static var woodenMenuImg:Class;
		[Embed(source = "data/menuwoodFG.png")] public static var woodenMenuFGImg:Class;
		[Embed(source = "data/healthColors.png")] public static var healthColorsImg:Class;
		[Embed(source = "data/cloud.png")] public static var cloudImg:Class;
		[Embed(source = "data/031_wave.png")] public static var waveImg:Class;
		[Embed(source = "data/032_leftDoor.png")] public static var leftDoorImg:Class;
		[Embed(source = "data/033_rightDoor.png")] public static var rightDoorImg:Class;
		[Embed(source = "data/034_CustomizeLvlBg2.png")] public static var customiseLvlBgImg:Class;
		[Embed(source = "data/035_pageSelect.png")] public static var pageSelectorImg:Class;
		[Embed(source = "data/036_sliderButton.png")] public static var dummySliderImg:Class;
		[Embed(source = "data/037_wave2.png")] public static var wave2Img:Class;
		[Embed(source = "data/002_alternateTiles.png")] public static var alternateTilesImg:Class;
		[Embed(source = "data/ropes.png")] public static var ropesDecorateImg:Class;
		[Embed(source = "data/038_customisedJoingame.png")] public static var joinGameBgImg:Class;
		[Embed(source = "data/039_customisedJoingameFG.png")] public static var joinGameFgImg:Class;
		[Embed(source = "data/040_joinGameSelectors.png")] public static var joinGameSelectorsImg:Class;
		[Embed(source = "data/041_levelSelectors.png")] public static var levelSelectorsImg:Class;
		[Embed(source = "data/042_timeBg.png")] public static var timeBgImg:Class;
		[Embed(source = "data/playerParticle.png")] public static var playerParticleImg:Class;
		//[Embed(source = "data/croctown.png")] public static var gameBgImg:Class;
		[Embed(source= "data/014_editorCursor.png")] public static var editorCurImg:Class;
		
		//tests
		//[Embed(source = "data/ilkke.png")] public static var ilkkeImg:Class;//remove later <<<<<<<<<<
		//[Embed(source = "data/green_ball.png")] public static var greenImg:Class;//remove later <<<<<<<<<<
		
		//weapon list
		[Embed(source = "data/022_weaponList3.png")] public static var weaponListImg:Class;
		[Embed(source = "data/023_weaponListsSlider.png")] public static var weaponListSliderImg:Class;
		
		//shoot button
		[Embed(source = "data/shootButton2.png")] public static var shootButtonImg:Class;
		
		// Dialog box images		
		[Embed(source = "data/008_dialogBg.png")] public static var dialogBgImg:Class;
		[Embed(source = "data/009_dialogButtons.png")] public static var dialogButtonImg:Class;
		
		// jump wave
		[Embed(source = "data/010_doubleJump44x7.png")] public static var jumpSmokeImg:Class;
		
		//bullets
		[Embed(source = "data/shotgunBullet.png")] public static var shootgunBulletImg:Class;
		[Embed(source = "data/machinegunBullet.png")] public static var machinegunBulletImg:Class;
		[Embed(source = "data/meteor2.png")] public static var meteorImg:Class;
		[Embed(source = "data/rocket.png")] public static var rocketImg:Class;
		[Embed(source = "data/hadukenfire65x60.png")] public static var hadukenFireImg:Class;
		[Embed(source = "data/grenade2.png")] public static var grenadeImg:Class;
		[Embed(source = "data/spikey1.png")] public static var fractalGrenadeImg:Class;
		[Embed(source = "data/smallerSpikey.png")] public static var smallerFractalGrenadeImg:Class;
		[Embed(source = "data/skull32x50.png")] public static var bouncySkullImg:Class;
		[Embed(source = "data/skii 42x31.png")] public static var skiiImg:Class;
		[Embed(source = "data/drill31x25.png")] public static var drillImg:Class;
		
		//right editor menu vars
		[Embed(source = "data/003_colorTileMenu.png")] public static var tileMenuImg:Class;
		[Embed(source = "data/004_colorTileSelect.png")] public static var tileSelectImg:Class;
		[Embed(source = "data/007_editorUpButtons.png")] public static var UpButtonsImg:Class;
		public function AssetManager():void 
		{
			//nothing lol
		}
	}	
}


