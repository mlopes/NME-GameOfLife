import massive.munit.TestSuite;

import ExampleTest;
import org.games.lifeTest.LifeTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(ExampleTest);
		add(org.games.lifeTest.LifeTest);
	}
}
