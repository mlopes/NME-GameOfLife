package org.games.life;

import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.TimerEvent;
import nme.utils.Timer;
import org.games.life.Life;

class Game extends Sprite
{
    private var life:Life;
    private var timer:Timer;
    private var gridView:Sprite;

    public function new():Void
    {
        super();
        gridView = new Sprite();
    }

    public function start():Void
    {
        life = new Life();
        life.updateGrid(getRandomGeneratedGrid());

        timer = new Timer(500, 0);
        timer.addEventListener(TimerEvent.TIMER, tick);
        render(life.getGrid());
        timer.start();
    }

    private function tick(e:TimerEvent):Void
    {
        life.updateGrid(life.evolve());
        render(life.getGrid());
    }

    private function render(grid:Array<Array<Int>>):Void
    {
        var newGridView:Sprite = new Sprite();
        newGridView.x = 0;
        newGridView.y = 0;

        for (yIndex in 0...grid.length) {
            for (xIndex in 0...grid[yIndex].length) {
                if(grid[yIndex][xIndex] == 1) {
                    var filledCell:Sprite = new Sprite();
                    filledCell.addChild(new Bitmap(Assets.getBitmapData('images/cell.png')));
                    filledCell.x = xIndex * 16;
                    filledCell.y = yIndex * 16;
                    newGridView.addChild(filledCell);
                }
            }
        }
        if(contains(gridView)) {
            removeChild(gridView);
        }
        gridView = newGridView;
        addChild(gridView);
    }

    private function getRandomGeneratedGrid(gridWidth:Int = 40, gridHeight:Int = 30):Array<Array<Int>>
    {
        var randomGrid:Array<Array<Int>> = new Array();

        for (yIndex in 0...gridHeight) {
            randomGrid[yIndex] = new Array();
            for (xIndex in 0...gridWidth) {
                if(Std.random(11) > 5) {
                    randomGrid[yIndex][xIndex] = 1;
                } else {
                    randomGrid[yIndex][xIndex] = 0;
                }
            }
        }
        return randomGrid;
    }
}