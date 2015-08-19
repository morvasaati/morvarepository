class UserMailer < ApplicationMailer
	default from: "memari.mohit11@gmail.com"

    def contact_email(contact)
        # @name = name
        # @email = email
        # @body = body
        @contact = contact

        mail(to: "memari.mohit11@gmail.com" , :subject => "Contact Request")
    end
end
