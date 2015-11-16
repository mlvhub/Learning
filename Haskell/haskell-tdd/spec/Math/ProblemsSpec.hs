import Test.Hspec
import Math.Problems

main = hspec $ do

  describe "Math.Problems" $ do

    describe "last" $ do
      it "should return the last element of a given list" $ do
        last' [1] `shouldBe` 1
        last' [1..5] `shouldBe` 5

    describe "butLast" $ do
      it "should return the last but one element of a given list" $ do
        butLast' [1..5] `shouldBe` 4
        butLast' [1, 2] `shouldBe` 1

    describe "elementAt" $ do
      it "should return element at the specified index of a given list" $ do
        elementAt' [1..5] 2 `shouldBe` 2
        elementAt' [1, 2] 1 `shouldBe` 1

    describe "length" $ do
      it "should return the length of a given list" $ do
        length' [1..5] `shouldBe` 5
        length' [1, 2] `shouldBe` 2
        length' [1..10] `shouldBe` 10

    describe "reverse" $ do
      it "should return the reversed list" $ do
        reverse' [1..5] `shouldBe` [5,4,3,2,1]
        reverse' [1, 2] `shouldBe` [2,1]
        reverse' [1..10] `shouldBe` [10,9,8,7,6,5,4,3,2,1]
        reverse' "ana" `shouldBe` "ana"

    describe "isPalindrome" $ do
      it "should determine whether a list is a palindrome or not" $ do
        isPalindrome' [1] `shouldBe` True
        isPalindrome' [1,2,3,2,1] `shouldBe` True
        isPalindrome' [1,2] `shouldBe` False
        isPalindrome' "ana" `shouldBe` True

    describe "flatten" $ do
      it "should flatten a list of lists" $ do
        flatten' (Elem 5) `shouldBe` [5]

    describe "compress" $ do
      it "should compress a list of repeated items" $ do
        compress' "aaaabccaadeeee" `shouldBe` "abcade"
        compress' "aabcaadeee" `shouldBe` "abcade"

    describe "pack" $ do
      it "should pack a list of repeated items" $ do
        pack' ['a'] `shouldBe` ["a"]
        pack' ['a', 'b'] `shouldBe` ["a", "b"]
        pack' ['a', 'a', 'b'] `shouldBe` ["aa", "b"]
        pack' ['a', 'a', 'b', 'b', 'c'] `shouldBe` ["aa", "bb", "c"]
        pack' ['a', 'a', 'a', 'b', 'b', 'c'] `shouldBe` ["aaa", "bb", "c"]
        pack' ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 
            'a', 'd', 'e', 'e', 'e', 'e'] `shouldBe` ["aaaa","b","cc","aa","d","eeee"]

    describe "encode" $ do
      it "should encode a list of chars, into a tuple of Int, Char" $ do
        encode' "a" `shouldBe` [(1, 'a')]
        encode' "aaaabccaadeeee" `shouldBe` [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
        encodePack' "a" `shouldBe` [(1, 'a')]
        encodePack' "aaaabccaadeeee" `shouldBe` [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
