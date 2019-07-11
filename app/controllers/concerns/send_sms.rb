require 'twilio-ruby'

account_sid = 'AC05377eed0a2fe249abec193cbf88680a'
auth_token = 'd95fa324ce410cbcb3bfa0af5a38f4e8'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19733709632' # Your Twilio number
to = '+12016027876' # Your mobile phone number

client.account.messages.create(
from: from,
to: to,
body: "Hey friend!"
)