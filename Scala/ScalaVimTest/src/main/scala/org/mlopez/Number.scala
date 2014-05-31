package org.mlopez

case class Number(a: Int) {
  def plus(n: Number): Number = Number(a + n.a)
}
