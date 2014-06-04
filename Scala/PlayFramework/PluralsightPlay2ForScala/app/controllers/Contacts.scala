package controllers

import play.api.mvc._
import models.Contact

object Contacts extends Controller {

  def index = Action {
    val contacts = Contact.all

    Ok(views.html.index(contacts, Contact.form))
  }

  def create = Action { implicit request =>
    Contact.form.bindFromRequest.fold(
      errors => BadRequest(views.html.index(Contact.all, errors)),
      contact => {
        Contact.create(contact)
        Redirect(routes.Contacts.index())
      }
    )
  }

  def edit(id: Long) = TODO

  def update(id: Long) = TODO

  def delete(id: Long) = TODO
    
}
