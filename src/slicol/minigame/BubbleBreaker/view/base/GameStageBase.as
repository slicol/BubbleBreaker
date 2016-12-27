package slicol.minigame.BubbleBreaker.view.base
{
	import slicol.minigame.BubbleBreaker.i.IBubble;
	import slicol.minigame.BubbleBreaker.i.IGameOver;
	import slicol.minigame.BubbleBreaker.i.IGameStage;
	import slicol.minigame.BubbleBreaker.i.IStagePanel;
	import slicol.minigame.BubbleBreaker.i.IStageView;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	import slicol.minigame.BubbleBreaker.vo.BubbleVO;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	
	
	public class GameStageBase implements IGameStage
	{
		public static var WIDTH:int = 640;
		public static var HEIGHT:int = 960;
		
		protected var stagePanel:IStagePanel;
		protected var winGameOver:IGameOver;
		protected var stageView:IStageView;
		protected var classBubble:Class;
		private var m_width:Number;
		private var m_height:Number;
		
		private var arrBubble:Array;
		private var modeList:Array = GameModel.getInstance().modeList;

		public function GameStageBase(w:Number = 0, h:Number = 0)
		{
			super();
			m_width = w;
			m_height = h;
			
			if(m_width == 0)
			{
				m_width = WIDTH;
			}
			
			if(m_height == 0)
			{
				m_height = WIDTH;
			}
		}
		
		
		public function init(stageView:IStageView, stagePanel:IStagePanel, 
							 winGameOver:IGameOver, classBubble:Class):void
		{
			this.stagePanel = stagePanel;
			this.winGameOver = winGameOver;
			this.stageView = stageView;
			this.classBubble = classBubble;
			
			updateLayout();
			
		}
		
		public function load(w:int,h:int,bubbles:Array):void
		{
			this.winGameOver.visible = false;
			this.stageView.visible = true;
			
			if(this.arrBubble != null)
			{
				if(this.arrBubble.length != w 
					|| this.arrBubble[0].length != h)
				{
					resize(w,h);
				}
			}
			else
			{
				resize(w,h);
			}
			
			reload(w,h,bubbles);
		}
		
		private function reload(w:int,h:int,bubbles:Array):void
		{
			var x:int;
			var y:int;
			
			for(x = 0; x < w; ++x)
			{
				for(y = 0; y < h; ++y)
				{
					var vo:BubbleVO = new BubbleVO(x,y,bubbles[x][y]);
					var view:IBubble = arrBubble[x][y];
					view.vo = vo;
				}
			}
		}
		
		private function resize(w:int,h:int):void
		{
			var x:int;
			var y:int;
			var view:IBubble;
			
			if(this.arrBubble != null)
			{
				for(x = 0; x < this.arrBubble.length; ++x)
				{
					var arrCol:Array = this.arrBubble[x];
					for(y = 0; y < arrCol.length; ++y)
					{
						view = this.arrBubble[x][y];
						this.stageView.removeBubble(view);
					}
				}						
			}
			
			this.arrBubble = new Array(w);
			for(x = 0; x < w; ++x)
			{
				this.arrBubble[x] = new Array(h);
				for(y = 0; y < h; ++y)
				{
					view = createBubble();
					view.x = x * view.width;
					view.y = y * view.height;
					this.stageView.addBubble(view);
					this.arrBubble[x][y] = view;
					
				}
			}
			
			this.stageView.width = w * view.width;
			this.stageView.height = h * view.height;

			updateLayout();
		}
		
		public function updateLayout():void
		{
			//this.width = Math.max(this.stageView.width, this.stagePanel.width) + 20;
			//this.height = this.stageView.height + this.stagePanel.height + 50;
			
			this.stageView.x = (this.width - this.stageView.width) / 2;
			this.stageView.y = 10;
			
			this.stagePanel.x = (this.width - this.stagePanel.width) / 2;
			this.stagePanel.y = this.stageView.y + this.stageView.height + 10;
			
			this.winGameOver.x = (this.width - this.winGameOver.width) / 2;
			this.winGameOver.y = (this.stageView.height - this.winGameOver.height) / 2 + this.stageView.y ;
		}
		
		
		public function get width():Number
		{
			return m_width;
		}
		
		public function get height():Number
		{
			return m_height;
		}
		
		public function createBubble():IBubble
		{
			return new classBubble;
		}
		
		public function setBubble(x:int,y:int,value:int):void
		{
			var view:IBubble = arrBubble[x][y];
			view.value = value;
		}
		
		public function markBubble(x:int,y:int, mark:Boolean):void
		{
			var view:IBubble = arrBubble[x][y];
			view.mark = mark;
		}
		
		public function showStepScore(score:int):void
		{
			this.stagePanel.showStepScore(score);
		}
		
		public function showStageScore(score:int):void
		{
			this.stagePanel.showStageScore(score);
		}
		
		public function showGameOver(stageScore:int,stageRank:int,stageMode:int):void
		{
			this.winGameOver.show(stageScore,stageRank,stageMode);
		}
		

		
	}
}