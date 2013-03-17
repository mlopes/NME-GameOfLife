package org.games.life;

class Life
{

    private var grid:Array<Array<Int>>;

    public function new()
    {
        grid = new Array();
    }

    public function getNextGenerationCellState(parentCellStatus:Int, numberOfNeighbours:Int):Int
    {
        if(parentCellStatus == 1 && numberOfNeighbours == 2) {
            return 1;
        }

        if(numberOfNeighbours == 3) {
            return 1;
        }
        return 0;
    }

    public function updateGrid(newGrid:Array<Array<Int>>):Void
    {
        grid = newGrid;
    }

    public function countNeighbours(x:Int, y:Int):Int
    {
        var neighboursCount:Int = 0;

        for (yIndex in getStartCoordinate(y)...getEndCoordinate(y, grid.length)) {
            for (xIndex in getStartCoordinate(x)...getEndCoordinate(x, grid[yIndex].length)) {
                if(isCellUnderTest(x, y, xIndex, yIndex)) {
                    continue;
                }
                if(isCellAlive(xIndex, yIndex)) {
                    neighboursCount ++;
                }
            }
        }
        return neighboursCount;
    }

    public function evolve():Array<Array<Int>>
    {
        var newGrid:Array<Array<Int>> = new Array();

        for (yIndex in 0...grid.length) {
            newGrid[yIndex] = new Array();
            for (xIndex in 0...grid[yIndex].length) {
                newGrid[yIndex][xIndex] = getNextGenerationCellState(
                    grid[yIndex][xIndex],
                    countNeighbours(xIndex, yIndex));
            }
        }
        return newGrid;
    }

    private function getStartCoordinate(coordinate:Int):Int
    {
        return coordinate == 0 ? coordinate : coordinate - 1;
    }

    private function getEndCoordinate(coordinate:Int, arrayLenght:Int):Int
    {
        return coordinate >= arrayLenght - 1 ? arrayLenght : coordinate + 2;
    }

    private function isCellUnderTest(x:Int, y:Int, currentX:Int, currentY:Int):Bool
    {
        return currentX == x && currentY == y;
    }

    private function isCellAlive(x:Int, y:Int):Bool
    {
        return grid[y][x] == 1;
    }

}