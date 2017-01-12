class Order
  attr_reader :items, :placed_at, :time_spent_on_sending_email

  include ItemContainer

  def initialize
    @items = []
  end

  def place
    @placed_at = Time.now
    thr = Thread.new do
      Pony.mail(to: StoreApplication::Admin.email,
                via: :smtp,
                via_options: {
                  address: 'smtp.gmail.com',
                  port: '587',
                  enable_starttls_auto: true,
                  user_name: 'example@gmail.com',
                  password: 'example',
                  authentication: :plain,
                  domain: 'localhost.localdomain'
                },
                subject: 'New order has been placed', body: 'Please check back you admin page to see it!')
    end
    while thr.alive?
      puts '.'
      sleep(1)
    end
    sent_mail_at = Time.now
    @time_spent_on_sending_email = sent_mail_at - @placed_at
  end
end
