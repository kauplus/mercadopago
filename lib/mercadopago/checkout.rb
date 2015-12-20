module MercadoPago

  module Checkout

    #
    # Allows you to configure the checkout process.
    # Receives an access_token and a prefereces hash and creates a new checkout preference.
    # Once you have created the checkout preference, you can use the init_point URL
    # to start the payment flow.
    #
    # - access_token: the MercadoPago account associated with this access_token will
    #                 receive the money from the payment of this checkout preference.
    # - data: a hash of preferences that will be trasmitted to checkout API.
    #
    def self.create_preference(access_token, data)
      payload = JSON.generate(data)
      headers = { content_type: 'application/json', accept: 'application/json' }

      MercadoPago::Request.wrap_post("/checkout/preferences?access_token=#{access_token}", payload, headers)
    end

    #
    # TODO
    #
    def self.update_preference
      # TODO
    end

    #
    # Returns the hash with the details of certain payment preference.
    #
    # - access_token: the MercadoPago account access token
    # - preference_id: the payment preference ID
    #
    def self.get_preference(access_token, preference_id)
      headers = { accept: 'application/json' }
      MercadoPago::Request.wrap_get("/checkout/preferences/#{preference_id}?access_token=#{access_token}")
    end

    #
    # Refunds payment
    # - access_token: the MercadoPago account associated with this access_token will
    #                 receive the money from the payment of this checkout preference.
    # - id: payment id.
    #
    def self.refund_payment(access_token, id)
      payload = JSON.generate({"status" => "refunded"})
      headers = { content_type: 'application/json', accept: 'application/json' }
      
      MercadoPago::Request.wrap_put("/collections/#{id}?access_token=#{access_token}", payload, headers)
    end

    #
    # - access_token: the MercadoPago account associated with this access_token will
    #                 receive the money from the payment of preapproval payment.
    # - data: a hash of preferences that will be trasmitted to checkout API.
    #
    def self.create_preapproval_payment(access_token, data)
      payload = JSON.generate(data)
      headers = { content_type: 'application/json', accept: 'application/json' }

      MercadoPago::Request.wrap_post("/preapproval?access_token=#{access_token}", payload, headers)
    end

    #
    # Returns the hash with the details of certain preapproval payment.
    #
    # - access_token: the MercadoPago account access token
    # - preapproval_id: the preapproval payment ID
    #
    def self.get_preapproval_payment(access_token, preapproval_id)
      headers = { accept: 'application/json' }
      MercadoPago::Request.wrap_get("/preapproval/#{preapproval_id}?access_token=#{access_token}")
    end

  end

end
