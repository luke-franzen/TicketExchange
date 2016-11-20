require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:user) { double(User) }
    let(:mail) { UserMailer.account_activation(user) }

    it "renders the headers" do
      expect(user).to receive(:email).at_least(:once).and_return("to@example.org")
      expect(user).to receive(:first_name).at_least(:once).and_return("dude")
      expect(user).to receive(:activation_token).at_least(:once).and_return("123")
      expect(mail.subject).to eq("Account Activation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["noreply@uiowaticketexchange.com"])
    end

    it "renders the body" do
      expect(user).to receive(:email).at_least(:once).and_return("to@example.org")
      expect(user).to receive(:first_name).at_least(:once).and_return("dude")
      expect(user).to receive(:activation_token).at_least(:once).and_return("123")
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "password_reset" do
    let(:user) { double(User) }
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      expect(user).to receive(:email).at_least(:once).and_return("to@example.org")
      expect(user).to receive(:reset_token).at_least(:once).and_return("123")
      expect(mail.subject).to eq("Password Reset")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["noreply@uiowaticketexchange.com"])
    end

    it "renders the body" do
      expect(user).to receive(:email).at_least(:once).and_return("to@example.org")
      expect(user).to receive(:reset_token).at_least(:once).and_return("123")
      expect(mail.body.encoded).to match("To reset your password")
    end
  end

end
