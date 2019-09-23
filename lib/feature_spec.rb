require './lib/oyster_card'

oc = OysterCard.new

oc.top_up(10)

oc.touch_in

oc.touch_out

oc.balance