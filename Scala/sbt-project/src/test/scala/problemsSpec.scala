import org.scalatest._
import com.problems.Problems

class ProblemsSpec extends FunSpec with Matchers {
  describe("99 problems") {
    describe("last") {
      it("should find the last element of a list") {
        Problems.last(List(1,2,3,4)) shouldBe 4
        Problems.last(List(1,2,3,4,6,7,8)) shouldBe 8
        Problems.last(List(1,4,6)) shouldBe 6
      }
    }
    describe("penultimate") {
      it("should find the penultimate element of a list") {
        Problems.penultimate(List(1,2,3,4)) shouldBe 3
        Problems.penultimate(List(1,2,3,4,6,7,8)) shouldBe 7
        Problems.penultimate(List(1,4,6)) shouldBe 4
      }
    }
    describe("nth") {
      it("should find the nth element of a list") {
        Problems.nth(2, List(1,2,3,4)) shouldBe 3
        Problems.nth(6, List(1,2,3,4,6,7,8)) shouldBe 8
        Problems.nth(0, List(1,4,6)) shouldBe 1
      }
    }
    describe("length") {
      it("should calculate the length element of a list") {
        Problems.length(List(1,2,3,4)) shouldBe 4
        Problems.length(List(1,2,3,4,6,7,8)) shouldBe 7
        Problems.length(List(1,4,6)) shouldBe 3
      }
    }
    describe("reverse") {
      it("should return the reverse of a given list") {
        Problems.reverse(List(1,2,3,4)) shouldBe List(4,3,2,1)
        Problems.reverse(List(1,2,3,4,6,7,8)) shouldBe List(8,7,6,4,3,2,1)
        Problems.reverse(List(1,4,6)) shouldBe List(6,4,1)
      }
    }
    describe("palindrome using the reverse method") {
      it("should return whether a given list is a palindrome or not") {
        Problems.palindromeReverse(List(1,2,3,4)) shouldBe false
        Problems.palindromeReverse(List(1,2,3,3,2,1)) shouldBe true
        Problems.palindromeReverse(List(1,4,1)) shouldBe true
      }
    }
    describe("flatten") {
      it("should return a flattened list from a given list of lists") {
        Problems.flatten(List(List(1,2,3,4))) shouldBe List(1,2,3,4)
        Problems.flatten(List(List(1),2,3,3,2,1)) shouldBe List(1,2,3,3,2,1)
        Problems.flatten(List(1,4,1)) shouldBe List(1,4,1)
      }
    }
    describe("compress") {
      it("should return a compressed list from a given list") {
        Problems.compress(List('a','a','a', 'b', 'b', 'c')) shouldBe List('a','b','c')
        Problems.compress(List('a','a','a', 'b', 'b', 'c', 'c', 'd')) shouldBe List('a','b','c', 'd')
      }
    }
    describe("pack") {
      it("should return a packed list from a given list") {
        Problems.pack(List('a','a','a', 'b', 'b', 'c')) shouldBe List(List('a', 'a', 'a'), List('b', 'b'), List('c'))
        Problems.pack(List('a','a','a', 'b', 'b', 'c', 'c', 'd')) shouldBe List(List('a', 'a', 'a'), List('b', 'b'), List('c', 'c'), List('d'))
      }
    }
    describe("encode") {
      it("should return a packed list from a given list") {
        Problems.encode(List('a','a','a', 'b', 'b', 'c')) shouldBe List((3, 'a'), (2, 'b'), (1, 'c'))
        Problems.encode(List('a','a','a', 'b', 'b', 'c', 'c', 'd')) shouldBe List((3, 'a'), (2, 'b'), (2, 'c'), (1, 'd'))
      }
    }
    describe("duplicate") {
      it("should return a duplicated list from a given list") {
        Problems.duplicate(List('a','b','c','d')) shouldBe List('a','a','b','b','c','c','d','d')
      }
    }
    describe("split") {
      it("should return a split list from a given list") {
        Problems.split(2, List('a','b','c','d')) shouldBe (List('a','b'), List('c','d'))
      }
    }
  }
}
