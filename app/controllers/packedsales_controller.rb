class PackedsalesController < ApplicationController
  def index
    packedsales = Packedsale.all
    render status: 200, json: { packedsales: packedsales }
  end
end
