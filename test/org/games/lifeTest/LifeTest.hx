package org.games.lifeTest;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import org.games.life.Life;


class LifeTest
{

	private var life:Life;
	private var newGrid:Array<Array<Int>>;

	public function new()
	{

	}

	@BeforeClass
	public function beforeClass():Void
	{
	}

	@AfterClass
	public function afterClass():Void
	{
	}

	@Before
	public function setup():Void
	{
		life = new Life();
	}

	@After
	public function tearDown():Void
	{
	}

	@Test
	public function itReturnsFalseForLiveCellWithLessThanTwoNeighbours():Void
	{
		Assert.areEqual(0, life.getNextGenerationCellState(1, 0));
		Assert.areEqual(0, life.getNextGenerationCellState(1, 1));
	}

	@Test
	public function itReturnsTrueForLiveCellWithTwoOrThreeNeighbours():Void
	{
		Assert.areEqual(1, life.getNextGenerationCellState(1, 2));
		Assert.areEqual(1, life.getNextGenerationCellState(1, 3));
	}

	@Test
	public function itReturnsFalseForLiveCellWithMoreThanThreeNeighbours():Void
	{
		Assert.areEqual(0, life.getNextGenerationCellState(1, 4));
		Assert.areEqual(0, life.getNextGenerationCellState(1, 5));
		Assert.areEqual(0, life.getNextGenerationCellState(1, 6));
		Assert.areEqual(0, life.getNextGenerationCellState(1, 7));
		Assert.areEqual(0, life.getNextGenerationCellState(1, 8));
	}

	@Test
	public function itReturnsTrueForDeadCellWithThreeNeighbours():Void
	{
		Assert.areEqual(1, life.getNextGenerationCellState(0, 3));
	}

	@Test
	public function itReturnsFalseForDeadCellsWithOtherThanThreeNeighbours():Void
	{
		Assert.areEqual(0, life.getNextGenerationCellState(0, 2));
		Assert.areEqual(0, life.getNextGenerationCellState(0, 4));
	}

	@Test
	public function itReturnsOneForCellWithOneNeighbour():Void
	{
		newGrid = new Array();
		newGrid[0] = [0, 1, 0];
		newGrid[1] = [0, 0, 0];
		newGrid[2] = [0, 0, 0];

		life.updateGrid(newGrid);
		Assert.areEqual(1, life.countNeighbours(1, 1));
	}

	@Test
	public function itReturnsThreeForCellWithThreeNeighbours():Void
	{
		newGrid = new Array();
		newGrid[0] = [0, 1, 0];
		newGrid[1] = [1, 0, 0];
		newGrid[2] = [0, 0, 1];

		life.updateGrid(newGrid);
		Assert.areEqual(3, life.countNeighbours(1, 1));
	}

	@Test
	public function itReturnsFourForAnAliveCellWithFourNeighbours():Void
	{
		newGrid = new Array();
		newGrid[0] = [0, 1, 0];
		newGrid[1] = [1, 1, 0];
		newGrid[2] = [1, 0, 1];

		life.updateGrid(newGrid);
		Assert.areEqual(4, life.countNeighbours(1, 1));
	}

	@Test
	public function itDoesNotLookForNeighboursOutOfVerticalBounds():Void
	{
		newGrid = new Array();
		newGrid[0] = [0, 1, 0];
		newGrid[1] = [1, 1, 0];
		newGrid[2] = [1, 0, 1];

		life.updateGrid(newGrid);
		Assert.areEqual(2, life.countNeighbours(1, 0));
		Assert.areEqual(4, life.countNeighbours(1, 2));
	}

	@Test
	public function itDoesNotLookForNeighboursOutOfHorizontalBounds():Void
	{
		newGrid = new Array();
		newGrid[0] = [0, 1, 0];
		newGrid[1] = [1, 1, 0];
		newGrid[2] = [1, 0, 0];

		life.updateGrid(newGrid);
		Assert.areEqual(3, life.countNeighbours(0, 1));
		Assert.areEqual(2, life.countNeighbours(2, 1));
	}

	@Test
	public function itEvolves():Void
	{
		newGrid = new Array();
		newGrid[0] = [0, 1, 0];
		newGrid[1] = [1, 1, 0];
		newGrid[2] = [1, 0, 1];

		var evolvedGrid:Array<Array<Int>> = new Array();
		evolvedGrid[0] = [1, 1, 0];
		evolvedGrid[1] = [1, 0, 1];
		evolvedGrid[2] = [1, 0, 0];

		life.updateGrid(newGrid);
		Assert.areEqual(Std.string(evolvedGrid), Std.string(life.evolve()));

	}
}