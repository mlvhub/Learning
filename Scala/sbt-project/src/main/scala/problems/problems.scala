package com.problems

object Problems {
  def last(xs: List[Int]): Int = {
    if (xs.tail.isEmpty) xs.head
    else last(xs.tail)
  }
  def penultimate(xs: List[Int]): Int = {
    if (xs.tail.tail.isEmpty) xs.head
    else penultimate(xs.tail)
  }
  def nth(n: Int, xs: List[Int]): Int = {
    def loop(ys: List[Int], acc: Int): Int = {
      if (acc == n) ys.head
      else loop(ys.tail, acc + 1)
    }
    loop(xs, 0)
  }
  def length(xs: List[Int]): Int = {
    def loop(ys: List[Int], acc: Int): Int = {
      if (ys.isEmpty) acc
      else loop(ys.tail, acc + 1)
    }
    loop(xs, 0)
  }
  def reverse(xs: List[Int]): List[Int] = {
    def loop(ys: List[Int], acc: List[Int]): List[Int] = {
      if (ys.isEmpty) acc
      else loop(ys.tail, ys.head :: acc)
    }
    loop(xs, List())
  }
  def palindromeReverse(xs: List[Int]): Boolean = {
    val ys = reverse(xs)
    def loop(xs: List[Int], ys: List[Int]): Boolean = {
      if (xs.isEmpty && ys.isEmpty) true
      else if (xs.head == ys.head) loop(xs.tail, ys.tail)
      else false
    }
    loop(xs, ys)
  }
  def flatten(xs: List[Any]): List[Any] = xs match {
    case Nil => Nil
    case (y: List[Any]) :: ys => flatten(y) ::: flatten(ys)
    case y :: ys => y :: flatten(ys)
  }
  def compress(xs: List[Char]): List[Char] = {
    def loop(xs: List[Char], acc: List[Char], last: Char): List[Char] = {
      if (xs.isEmpty) acc
      else if (xs.head == last) loop(xs.tail, acc, last)
      else loop(xs.tail, acc ++ List(xs.head), xs.head)
    }
    loop(xs, List(), 0)
  }
  def pack(xs: List[Char]): List[List[Char]] = {
    def loop(xs: List[Char], acc: List[List[Char]], last: List[Char]): List[List[Char]] = {
      if (xs.isEmpty) acc :+ last
      else if (last.isEmpty || xs.head == last.head) loop(xs.tail, acc, last :+ xs.head)
      else loop(xs.tail, acc :+ last, List(xs.head))
    }
    loop(xs, List(), List())
  }
  def encode(xs: List[Char]): List[(Int, Char)] = pack(xs).map(x => (x.length, x.head))

  def duplicate[A](xs: List[A]): List[A] = xs.flatMap(x => List(x, x))

  def split[A](n: Int, xs: List[A]): (List[A], List[A]) = (xs.take(n), xs.drop (n))
}
