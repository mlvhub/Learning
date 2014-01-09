import org.specs2.mutable._
import models.User

class UserSpec extends Specification {

  "department" should {
    "be the first word before the first dot in the email domain" in {
      User(anorm.NotAssigned, "John Doe", "johndoe@finance.example.com", 24).department must beEqualTo("finance")
      User(anorm.NotAssigned, "John Doe", "johndoe@hr.example.com", 24).department must beEqualTo("hr")
    }
  }
}