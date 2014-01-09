package controllers

import play.api.mvc._
import scala.collection.mutable._
import models._
import play.api.data._
import play.api.data.Forms._
import anorm._
import play.api.libs.json._
import play.api.templates.Html

object Users extends Controller {

  def add = Action {
    Ok(views.html.users.add(form))
  }
  
  def list = Action { implicit request =>
    render {
      case Accepts.Html() => Ok(views.html.users.list(User.list))
      //case Accepts.Json() => Ok(toJsonLowLevel(User.list))
      //case Accepts.Json() => Ok(toJsonHighLevel(User.list))
      case Accepts.Json() => Ok(Json.toJson(User.list))
    }
  }

  def edit(id: Int) = Action {
    User.load(id).map { user =>
      val bindedForm = form.fill(user)
      Ok(views.html.users.edit(bindedForm))
    }.getOrElse(NotFound)
  }

  def save = Action { implicit request =>
    form.bindFromRequest.fold(
      formWithErrors => handleError(formWithErrors, views.html.users.add(formWithErrors)),
      user => {
        User.save(user)
        handleSuccess("User successfully created!")
      })
  }

  private def handleError(formWithErrors: Form[User], html: Html)(implicit request: RequestHeader) = render {
          case Accepts.Html() => BadRequest(html)
          case Accepts.Json() => BadRequest(toJson(formWithErrors))
        }

  private def handleSuccess(flashMessage: String)(implicit request: RequestHeader) = render {
          case Accepts.Html() => Redirect(routes.Users.list).flashing("success" -> flashMessage)
          case Accepts.Json() => Ok(Json.obj("status" -> "Ok"))
        }

  private def toJson(formWithErrors: Form[User]) = {
    Json.obj(
      "status" -> "Ko",
      "errors" -> formWithErrors.errorsAsJson)
  }

  def update(id: Int) = Action { implicit request =>
    User.load(id).map { user =>
      form.bindFromRequest.fold(
      formWithErrors => handleError(formWithErrors, views.html.users.edit(formWithErrors)),
        userWithNewValues => {
          User.update(id, userWithNewValues)
          handleSuccess("User successfully updated!")
        })
    }.getOrElse(NotFound)
  }


  def delete(id: Int) = Action { implicit request =>
    User.delete(id)
    render {
      case Accepts.Html() => Redirect(routes.Users.list).flashing("success" -> "User successfully deleted!")
      case Accepts.Json() => Ok("{status: \"Ok\"}")
    }
  }

  val form = Form(
    mapping(
      "id" -> ignored(NotAssigned: Pk[Int]),
      "username" -> nonEmptyText,
      "email" -> email,
      "age" -> number)(User.apply)(User.unapply))

  def toJsonLowLevel(user: User) = {
    JsObject(
      "id" -> JsNumber(user.id.get) ::
        "username" -> JsString(user.username) ::
        "email" -> JsString(user.email) ::
        "age" -> JsNumber(user.age) :: Nil)
  }

  def toJsonLowLevel(users: List[User]): JsObject = {
    JsObject(
      "users" -> JsArray(
        users.map { user => toJsonLowLevel(user) }) :: Nil)
  }

  def toJsonHighLevel(user: User): JsObject = {
    Json.obj(
      "id" -> JsNumber(user.id.get),
      "username" -> JsString(user.username),
      "email" -> JsString(user.email),
      "age" -> JsNumber(user.age))
  }

  def toJsonHighLevel(users: List[User]): JsObject = {
    Json.obj(
      "users" -> Json.arr(
        users map toJsonHighLevel))
  }
  
  implicit val userWrites = new Writes[User] {
    def writes(user: User) = {
          Json.obj(
            "id" -> JsNumber(user.id.get),
            "username" -> JsString(user.username),
              "email" -> JsString(user.email),
              "age" -> JsNumber(user.age)
              )
    }
  }

}