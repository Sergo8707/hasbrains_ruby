class Order

  attr_reader :items

  include ItemContainer

  def initialize
    @items = Array.new
  end

  def place
    thr = Thread.new do
      Pony.mail({
                    :to => StoreApplication::Admin.email,
                    :via => :smtp,
                    :via_options => {
                        :address => 'smtp.gmail.com',
                        :port => '587',
                        :enable_starttls_auto => true,
                        :user_name => 'example@gmail.com',
                        :password => 'example',
                        :authentication => :plain,
                        :domain => "localhost.localdomain"
                    },
                    subject: "New order has been placed", body: "Please check back you admin page to see it!"
                })
    end
    while (thr.alive?)
      puts '.'
      sleep(1)
    end

  end
end