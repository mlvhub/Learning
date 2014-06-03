package org.mlopez

import org.scalatest.{WordSpec, Matchers}

class ListSpec extends WordSpec with Matchers {
  "List" should {

    "Concat another list correctly" in {
      val list1 = List(1, 2)
      val list2 = List(3, 4)
      list1 ++ list2 should be (List(1,2,3,4))
    }

    "Update an index with a value properly" in {
      val list1 = List(1,2,3,5)
      list1 updated (3, 4) should be (List(1,2,3,4))
    }

    "Map correctly" in {
      val list1 = List(1, 3, 5, 7)
      list1 map { x => x + 1 } should be (List(2, 4, 6, 8))
    }

    "Pack properly" in {
      val list = List("a", "a", "b", "b", "c", "a")
      ListHelper pack list should be (List(List("a", "a"), List("b", "b"), List("c"), List("a")))
    }

    "Enconde properly" in {
      val list = List("a", "a", "b", "b", "c", "a")
      ListHelper encode list should be (List(("a",2), ("b", 2), ("c", 1), ("a", 1)))
    }

  }
}
