package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.getDefinitionByName;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.display.Sprite;
	import flash.events.MouseEvent;	
	
	// awesome preloader goes here
	public class aState_00_Preloader extends MovieClip
	{
		[Embed(source="nokiafc22.ttf",fontFamily="system",embedAsCFF="false")] protected var junk:String;
		private var _textLoad:TextField;					// loading.... click to start
		private var _barBg:Sprite;							// loading bar bg
		private var _bar:Sprite;							// loading bar
		private var myURL:String = "www.sakurati.com";		// my bloody redirect url
		private var _neato:Boolean = true;					// for final adjust it
		private var _loaded:Boolean = false;				// did everything load
		private var tmp2:Bitmap;							// stage bg
		private var _timer:Number = 0;						// wait for a few seconds before aaslog starts
		private var _timerOver:Boolean = false;
		public function aState_00_Preloader() 
		{		
			tmp2 = new Bitmap(new BitmapData(stage.stageWidth,stage.stageHeight,true,0xffc1eaff));
			addChild(tmp2);
			
			_barBg = new Sprite();	
			_barBg.graphics.lineStyle(1, 0x5F2E2E, 1);
			_barBg.graphics.beginFill(0xBC7A7A);//----------color
			_barBg.graphics.drawRect(0,0,701,10);
			_barBg.graphics.endFill();
			_barBg.x = 50-1;
			_barBg.y = 500 - 20;
			addChild(_barBg);
			
			_bar = new Sprite();	
			//_bar.graphics.lineStyle(0.1, 0x000000, 1, false);
			_bar.graphics.beginFill(0x804040);//----------color
			_bar.graphics.drawRect(0,0,1,9);
			_bar.graphics.endFill();
			_bar.x = 50;
			_bar.y = 500 - 20+1;			
			addChild(_bar);
			
			_textLoad = new TextField();
			_textLoad.defaultTextFormat = new TextFormat("system", 16, 0x804040,null, null, null, null, null, "center");
			_textLoad.embedFonts = true;
			_textLoad.selectable = false;
			_textLoad.multiline = false;
			//_textLoad.antiAliasType = "advanced";
			_textLoad.x = 0;//(800-130)/2;
			_textLoad.y = 460-2;//460
			_textLoad.width = 800;
			_textLoad.height = 40;
			_textLoad.text = "Loading";
			
			addChild(_textLoad);
			
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			
			//---------------site lock begin--------------------------------------
			var tmp:Bitmap;
			var url:String=stage.loaderInfo.url;
			var urlStart:Number = url.indexOf("://")+3;
			var urlEnd:Number = url.indexOf("/", urlStart);
			var domain:String = url.substring(urlStart, urlEnd);
			var LastDot:Number = domain.lastIndexOf(".")-1;
			var domEnd:Number = domain.lastIndexOf(".", LastDot)+1;
			domain = domain.substring(domEnd, domain.length);
			/*if (domain != "sakurati.com") 			
			{
				_neato = false;
				tmp = new Bitmap(new BitmapData(stage.stageWidth,stage.stageHeight,true,0xFFFFFFFF));
				addChild(tmp);
				
				var fmt:TextFormat = new TextFormat();
				fmt.color = 0x000000;
				fmt.size = 20;
				fmt.align = "center";
				fmt.bold = true;
				fmt.font = "tahoma";
				
				var txt:TextField = new TextField();
				txt.width = tmp.width-16;
				txt.height = tmp.height - 16;
				txt.x = 0;
				txt.y = 200;
				txt.multiline = true;
				txt.wordWrap = true;
				txt.defaultTextFormat = fmt;
				txt.text = "Seems like the game is at a place its not supposed to be! \nJust click anywhere, or copy - paste this URL into your browser.\n\n"+myURL+"\n\n Click to play the game.  Thanks, and have fun !\n"+domain;
				addChild(txt);
				
				txt.addEventListener(MouseEvent.CLICK,goToMyURL);
				tmp.addEventListener(MouseEvent.CLICK,goToMyURL);
				return;				
			}*/
			//-----------site lock end-------------------------------------------------
		}
		
		//=================================
		//     go to me url
		//=================================
		private function goToMyURL(event:MouseEvent=null):void
		{
			navigateToURL(new URLRequest("http://"+myURL));
		}
		
		//=================================
		//       progress update
		//=================================
		private function progress(e:ProgressEvent):void 
		{
			//_text.text = String(Math.floor((stage.loaderInfo.bytesLoaded/stage.loaderInfo.bytesTotal)*100))+"%";			
			_bar.scaleX = Math.floor((stage.loaderInfo.bytesLoaded/stage.loaderInfo.bytesTotal)*700);
		}
		
		//=================================
		//  check frames
		//=================================
		private function checkFrame(e:Event):void 
		{			
			if (currentFrame == totalFrames) 
			{				
				if (!_loaded)
				{
					_loaded = true;
					stage.addEventListener(MouseEvent.CLICK, onClick);
					loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
					//_textLoad.text = "- Click to Continue -";
					_textLoad.text = "- Click to Continue -";
					_timer = 1;
				}
			}
		}
		
		//=================================
		//  on click: after loading completes this happens
		//=================================
		private function onClick(e:MouseEvent):void 
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);		
			stop();
			stage.removeEventListener(MouseEvent.CLICK, onClick);	
			startup();
		}
		
		//=================================
		//   after clicking or timer goes to aaslog
		//=================================
		private function startup():void 
		{
			if (_neato)
			{
				removeChild(_bar);
				removeChild(_barBg);
				removeChild(_textLoad);
				removeChild(tmp2);
				
				var mainClass:Class = getDefinitionByName("AClock") as Class;
				addChild(new mainClass() as DisplayObject);
			}
		}
	}
}