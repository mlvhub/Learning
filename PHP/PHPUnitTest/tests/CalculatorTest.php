
<?php

require('../src/Calculator.php');

class CalculatorTest extends PHPUnit_Framework_TestCase
{

	public function testFivePlusSixIsEleven()
	{
		$sum = Calculator::sum(5, 6);
		$expected = 11;
		$this->assertEquals($expected, $sum);		
	}

} 
