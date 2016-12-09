class NoticeMailer < ApplicationMailer

  default from: "from@example.com"

  def sendmail_confirm(params)
    @commenter = params[:commenter]
    @body = params[:body]
    mail(
      to:      'masashi.yokoi@koagen.com',
      subject: 'new comment',
    ) do |format|
      format.html
    end
  end

end
