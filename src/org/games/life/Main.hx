package org.games.life;

import com.eclecticdesignstudio.motion.Actuate;
import nme.display.StageAlign;
import nme.display.StageQuality;
import nme.display.StageScaleMode;
import nme.events.Event;
import nme.Lib;

import org.games.life.Game;

class Main
{

	public function new()
	{
		#if (flash9 || flash10)
		haxe.Log.trace = function(v,?pos) { untyped __global__["trace"](pos.className+"#"+pos.methodName+"("+pos.lineNumber+"):",v); }
		#elseif flash
		haxe.Log.trace = function(v,?pos) { flash.Lib.trace(pos.className+"#"+pos.methodName+"("+pos.lineNumber+"): "+v); }
		#end

		initialize();
		start();
	}


	public function initialize ():Void {
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.stage.addEventListener (Event.ACTIVATE, stage_onActivate);
		Lib.current.stage.addEventListener (Event.DEACTIVATE, stage_onDeactivate);
	}

	// Event Handlers
	private function stage_onActivate (event:Event):Void {
		Actuate.resumeAll ();
	}


	private function stage_onDeactivate (event:Event):Void {
		Actuate.pauseAll ();
	}

	private function start():Void
	{
		var game:Game = new Game();
		Lib.current.stage.addChild(game);
		game.start();
	}
}
