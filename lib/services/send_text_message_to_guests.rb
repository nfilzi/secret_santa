class SendTextMessageToGuests
  private
  attr_reader :list

  public
  def initialize(list)
    @list = list
  end

  def call
    @twilio_client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_ID'],
      ENV['TWILIO_AUTH_TOKEN']
    )

    message = "Bonjour %<santa>s !\nLe tirage au sort de notre Secret Santa est tombé !\n\n"
    message << "Voici le nom de l'heureu·x·se élu·e dont tu combleras les rêves de cadeaux les plus fous Samedi soir : \n"

    message_with_giftee = message + "%<receiver>s recevra ton cadeau !\n\nÀ Samedi :D\nNicolas"

    list.each do |node|
      santa  = node.data
      giftee = node.next_node.data

      send_text(santa, giftee, message_with_giftee)
    end
  end

  private

  def send_text(santa, giftee, message, debug: true)
    if debug
      puts "DEBUG mode, no text will be sent!"
      puts "Text sent to #{santa.name}, at #{santa.phone_number}, who's a secret santa for #{giftee.name}"
      puts message % {santa: santa.name, receiver: giftee.name}
      puts "*" * 40
      puts "*" * 40
    else
      @twilio_client.messages.create(
        from: ENV['TWILIO_PHONE_NUMBER'],
        to:   santa.phone_number,
        body: message % {santa: santa.name, receiver: giftee.name}
      )
      puts "Text message sent to #{santa.name}, gifting to #{giftee.name}!"
    end
  end
end
