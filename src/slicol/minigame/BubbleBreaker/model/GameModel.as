package slicol.minigame.BubbleBreaker.model
{
	import slicol.minigame.BubbleBreaker.i.IGameStage;
	import slicol.minigame.BubbleBreaker.vo.StageVO;
	
	//[Bindable]
	public class GameModel
	{
		private static var instance : GameModel;
		
		public var view:IGameStage;
		public var voStage:StageVO;
		
		public var modeList:Array = new Array("标准","连续","位移","大挪移");
		
		
		public function GameModel()
		{
	         if ( instance != null )
			 {
			 	throw new Error( "Only one GameModel instance should be instantiated" );	
			 }
		}
  
		public static function getInstance() : GameModel 
		{
			if ( instance == null )
			{
				instance = new GameModel();
				instance.initialize();
			}
  			return instance;
		}
		
		private function initialize():void
		{
			
		}
		
		public function start():void
		{
			view.load(voStage.width, voStage.height, voStage.data);
		}
		
		public function init(w:int,h:int,typeCount:int,mode:int):void
		{
			var x:int;
			var y:int;
			
			var arrBubble:Array = new Array(w);
			var arrMark:Array = new Array(w);
			
			for(x = 0; x < w; ++x)
			{
				arrBubble[x] = new Array(h);
				arrMark[x] = new Array(h);
				
				for(y = 0; y < h; ++y)
				{
					var value:int = 1 + Math.random() * (typeCount - 1);
					arrBubble[x][y] = value;
					arrMark[x][x] = false;
				}
			}
			
			this.voStage = new StageVO;
			this.voStage.data = arrBubble;
			this.voStage.mark = arrMark;
			this.voStage.width = w;
			this.voStage.height = h;
			this.voStage.mode = mode;
		}
			
			
		public function isSelected(x:int,y:int):Boolean
		{
			return this.voStage.mark[x][y];
		}
		
		public function updateScore():void
		{
			this.voStage.stageScore += this.voStage.stepScore;
			this.view.showStageScore(this.voStage.stageScore);
		}

		public function clearSelected():void
		{
			var x:int;
			var y:int;
			var i:int;
			var j:int;
			var newCount:int;
			var v:int;
			var w:int = this.voStage.width;
			var h:int = this.voStage.height;

			for(x = 0; x < w; ++x)
			{
				for(y = h - 1; y >= 0;)
				{
					if(this.voStage.mark[x][y] == true)
					{
						for(i = y; i > 0; --i)
						{
							move(x,i - 1,x,i);
						}
						clear(x,i);
					}
					else
					{
						--y;
					}
				}				
			}	
				
			if(this.voStage.mode == StageVO.SM_COMPLEX)
			{
				this.makeComplexClear();
			}
			
			if(this.voStage.mode == StageVO.SM_STANDARD_SERIES)
			{
				this.makeSeriesClear();
			}
			
			if(this.voStage.mode == StageVO.SM_COMPLEX_SERIES)
			{
				this.makeSeriesClear();
				this.makeComplexClear();
			}
		}
		
		public function makeSeriesClear():void
		{
			var x:int;
			var y:int;
			var i:int;
			var zeroCount:int;
			var newCount:int;
			var v:int;
			var w:int = this.voStage.width;
			var h:int = this.voStage.height;
			
			//Series
			for(x = w - 1; x >= 0;)
			{
				if(this.voStage.data[x][h - 1] == 0)
				{
					newCount = 1 + Math.random() * (h - 1);
					for(y = h - 1; y >= 0; --y)
					{
						for(i = x; i > 0; --i)
						{
							move(i - 1,y,i,y);
						}
						
						if(y > h - newCount)
						{
							v = 1 + Math.random() * (this.voStage.typeCount - 1);
							setValue(i,y,v);
						}
						else
						{
							clear(i,y);
						}
					}
				}
				else
				{
					--x;
				}
			}			
		}
		
		public function makeComplexClear():void
		{
			var x:int;
			var y:int;
			var i:int;
			var zeroCount:int;
			var w:int = this.voStage.width;
			var h:int = this.voStage.height;
			
			
			for(y = 0; y < h; ++y)
			{
				zeroCount = 0;
				for(x = w - 1; x >= 0;)
				{
					if(this.voStage.data[x][y] == 0)
					{
						for(i = x; i > 0; --i)
						{
							move(i - 1,y,i,y);
						}
						clear(i,y);
						++zeroCount;
						if(zeroCount > x)
						{
							break;
						}
					}
					else
					{
						--x;
						zeroCount = 0;
					}
				}
			}				
		}
		
		public function cancelSelected():void
		{
			var x:int;
			var y:int;
			var w:int = this.voStage.width;
			var h:int = this.voStage.height;

			for(x = 0; x < w; ++x)
			{
				for(y = h - 1; y >= 0; --y)
				{
					if(this.voStage.mark[x][y] == 1)
					{
						this.cancelMark(x,y);
					}
				}
			}	
		}
		
		public function isNull(x:int,y:int):Boolean
		{
			return this.voStage.data[x][y] == 0;
		}
		
		public function select(x:int,y:int):void
		{
			var v:int = this.voStage.data[x][y];
			
			this.voStage.markCount = 0;
			mark(x,y,v);
			if(this.voStage.markCount < 2)
			{
				cancelMark(x,y);
				this.voStage.markCount = 0;
			}
			else
			{
				this.voStage.stepScore = this.voStage.markCount * (this.voStage.markCount - 1);
				this.view.showStepScore(this.voStage.stepScore);
			}
		}
		
		public function mark(x:int,y:int,v:int):Boolean
		{
			if(x >= this.voStage.width) return false;
			if(x < 0) return false;
			if(y >= this.voStage.height) return false;
			if(y < 0) return false;
			
			if(this.voStage.mark[x][y])
			{
				return false;
			}
			
			if(this.voStage.data[x][y] != v)
			{
				return false;
			}
			
			this.voStage.mark[x][y] = true;
			this.view.markBubble(x,y,true);
			this.voStage.markCount++;
			
			mark(x+1,y,v);
			mark(x-1,y,v);
			mark(x,y+1,v);
			mark(x,y-1,v)
			
			return true;			
		}
		
		public function cancelMark(x:int,y:int):void
		{
			this.voStage.mark[x][y] = false;
			this.view.markBubble(x,y,false);
		}
		
		public function move(x1:int,y1:int,x2:int,y2:int):void
		{
			var v:int = this.voStage.data[x1][y1];
			var m:Boolean = this.voStage.mark[x1][y1];
			
			this.voStage.data[x2][y2] = v;
			this.view.setBubble(x2,y2,v);
			
			this.voStage.mark[x2][y2] = m;
			this.view.markBubble(x2,y2,m);
		}
		
		public function clear(x:int,y:int):void
		{
			this.voStage.data[x][y] = 0;
			this.view.setBubble(x,y,0);
			
			this.voStage.mark[x][y] = false;
			this.view.markBubble(x,y,false);
		}
		
		public function setValue(x:int,y:int,v:int):void
		{
			this.voStage.data[x][y] = v;
			this.view.setBubble(x,y,v);
			
			this.voStage.mark[x][y] = false;
			this.view.markBubble(x,y,false);
		}
		
		
		public function getValue(x:int,y:int):int
		{
			if(x >= this.voStage.width) return 0;
			if(x < 0) return 0;
			if(y >= this.voStage.height) return 0;
			if(y < 0) return 0;
			return this.voStage.data[x][y];
		}
		
		
		public function isGameOver():Boolean
		{
			var x:int;
			var y:int;
			var w:int = this.voStage.width;
			var h:int = this.voStage.height;

			for(x = 0; x < w; ++x)
			{
				for(y = h - 1; y >= 0; --y)
				{
					var v:int = this.voStage.data[x][y];
					if(v > 0)
					{
						if(v == this.getValue(x - 1,y) 
						|| v == this.getValue(x + 1,y)
						|| v == this.getValue(x,y - 1)
						|| v == this.getValue(x,y + 1))
						{
							return false;
						}
					}
				}
			}
			return true;	
		}
		
		
		public function showGameOver():void
		{
			this.view.showGameOver(
				this.voStage.stageScore, 
				this.voStage.stageRank,
				this.voStage.mode);
		}
		

	}
}