require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "student_invite" do
    let(:user) { FactoryGirl.create(:user, invitation_code: 'testing') }
    let(:mail) { UserMailer.student_invite user.id }

    it "renders the headers" do
      expect(mail.subject).to eq("Student invite")
      expect(mail.to).to eq([user.public_email])
      expect(mail.from).to eq(["john@bitsushi.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("You have been invited")
    end
  end

end
