import Test.Hspec
import Math.Calculator

main = hspec $ do

  describe "Math.calculator" $ do

    describe "length" $ do
      it "should calculate the length of a given list" $ do
        length' [] `shouldBe` 0
        length' [1] `shouldBe` 1

    describe "factors" $ do
      it "should determine the factors of a given number" $ do
        factors' 1 `shouldBe` [1]
        factors' 2 `shouldBe` [1, 2]
        factors' 4 `shouldBe` [1, 2, 4]
        factors' 5 `shouldBe` [1, 5]

    describe "head" $ do
      it "should return the first element of a list" $ do
        head' [1] `shouldBe` 1
        head' [1..5] `shouldBe` 1

    describe "last" $ do
      it "should return the last element of a list" $ do
        last' [2] `shouldBe` 2
        last' [1..5] `shouldBe` 5

    describe "tail" $ do
      it "should return all but the first element of a list" $ do
        tail' [2] `shouldBe` []
        tail' [2..5] `shouldBe` [3,4,5]
        tail' [1..6] `shouldBe` [2,3,4,5,6]

    describe "init" $ do
      it "should return all but the last element of a list" $ do
        init' [2] `shouldBe` []
        init' [2..5] `shouldBe` [2,3,4]
        init' [1..6] `shouldBe` [1,2,3,4,5]

    describe "null" $ do
      it "should determine whether a list is empty or not" $ do
        null' [2] `shouldBe` False
        null' [] `shouldBe` True

    describe "product" $ do
      it "should return the product of all the elements of the list" $ do
        product' [2] `shouldBe` 2
        product' [2..5] `shouldBe` 120

    describe "reverse" $ do
      it "should return the reversed list" $ do
        reverse' [2] `shouldBe` [2]
        reverse' [2..5] `shouldBe` [5,4,3,2]

    describe "take" $ do
      it "should return the n elements of a list" $ do
        take' 1 [2..5] `shouldBe` [2]
        take' 2 [2..5] `shouldBe` [2,3]

    describe "drop" $ do
      it "should drop the n elements of a list" $ do
        drop' 1 [2..5] `shouldBe` [3,4,5]
        drop' 3 [1..8] `shouldBe` [4,5,6,7,8]

    describe "fibonacci" $ do
      it "should return the fibonacci of a given number" $ do
        fibonacci' 3 `shouldBe` 2

    describe "zip" $ do
      it "should return the zipped version of a given list" $ do
        zip' [1] [1,2] `shouldBe` [(1,1)]
        zip' [1..5] [1..7] `shouldBe` [(1,1), (2,2), (3,3),(4,4),(5,5)]
        zip' [1..7] [1..5] `shouldBe` [(1,1), (2,2), (3,3),(4,4),(5,5)]

    describe "elem" $ do
      it "should return whether an element is a member of a given list" $ do
        elem' 1 [] `shouldBe` False
        elem' 1 [1,2] `shouldBe` True
        elem' 1 [2] `shouldBe` False
