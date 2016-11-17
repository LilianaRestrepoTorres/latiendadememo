class PurchaseNotifierMailer < ApplicationMailer
  default :from => 'info@latiendadememo.com'

  def notify_account_balance(user, balance)
    @user = user
    @balance = balance

    mail(to: user.email, subject: 'Notificación deuda Store')
  end
end
