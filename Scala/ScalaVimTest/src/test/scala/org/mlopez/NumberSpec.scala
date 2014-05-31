package org.mlopez

import org.scalatest.{WordSpec, Matchers}

class NumberSpec extends WordSpec with Matchers {
  "Number" should {
    "add properly" in {
      Number(5) plus Number(10) should be (Number(15))
      Number(8) plus Number(-10) should be (Number(-2))
    }
  }
}
