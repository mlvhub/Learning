
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
  
  public function testSixPlusEightEqualsFourteen()
  {
    $sum = Calculator::sum(6, 8);
    $expected = 14;
		$this->assertEquals($expected, $sum);		
  }

} 
