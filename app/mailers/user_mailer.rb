class UserMailer < ActionMailer::Base
  default from: "bot@mgmt.iaac.net"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.student_invite.subject
  #
  def student_invite student_id
    @user = User.find(student_id)
    mail to: @user.public_email
  end
end
