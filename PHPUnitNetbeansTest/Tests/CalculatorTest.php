<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CalculatorTest
 *
 * @author mlopez
 */
class CalculatorTest extends PHPUnit_Framework_TestCase {
    //put your code here
    public function testFivePlusSixEqualsEleven() {
        $sum = Calculator::sum(5, 6);
        $this->assertEquals($sum, 11);
    }
}
