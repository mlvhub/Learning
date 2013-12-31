package controllers

import play.api.mvc._
import scala.collection.mutable._
import models._
import play.api.data._
import play.api.data.Forms._

object Users extends Controller{
  
  val users: Map[String, User] = new HashMap

  def add = Action {
    Ok(views.html.users.add(form))
  }
  
  def save = Action { implicit request =>
    val user = form.bindFromRequest.get
    users.put(user.id.toString, user)
    Redirect(routes.Users.list)
  }
  
  def list = Action {
    Ok(views.html.users.list(users.values))
  }
  
  def edit(id: Int) = Action {
    val bindedForm = form.fill(users.get(id.toString).get)
    Ok(views.html.users.edit(bindedForm))
  }
  
  def update(id: Int) = Action { implicit request =>
    val user = form.bindFromRequest.get
    user.id = id
    users.put(id.toString, user)
    Redirect(routes.Users.list)
  }
  
  def delete(id: Int) = Action {
    users.remove(id.toString)
    Redirect(routes.Users.list)
  }
  
  val form = Form(
    mapping(
      "username" -> text,
      "email" -> text)(User.apply)(User.unapply))
  
}