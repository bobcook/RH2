require 'twilio-ruby'

account_sid = "ACe608c43e151fc83b2b76194f9c0ed6f2"
auth_token = "d24b8e2b75483ea72603d37b08e7919a"

begin
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
        :from => '+14357740145',
        :to => '+14357707799',
        :body => 'Hello world'
    })
rescue Twilio::REST::RequestError => e
    puts e.message
end
