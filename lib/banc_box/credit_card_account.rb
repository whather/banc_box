module BancBox
  class CreditCardAccount

    attr_reader :number
    attr_reader :expiry_month
    attr_reader :expiry_year
    attr_reader :type
    attr_reader :name
    attr_reader :cvv
    attr_reader :address

    # Create a credit card account.
    #
    # @return [BancBox::CreditCardAccount] The account object
    # @param data [Hash] A customizable set of options.
    # @option data [String] :number The credit card number
    # @option data [String] :expiry_month As MM
    # @option data [String] :expiry_year As YY
    # @option data [String] :type  'VISA', 'MASTERCARD', or 'AMERICANEXPRESS'
    # @option data [String] :name The name on the card
    # @option data [String] :cvv
    # @option data [BancBox::Address] :address
    def initialize(data)
      attrs = [
        :number, :expiry_month, :expiry_year,
        :type, :name, :cvv, :address
      ]
      attrs.each do |attr|
        instance_variable_set("@#{attr}", data[attr])
      end
    end

    # Convert the credit card object to a hash appropriate for sending to BancBox
    #
    # @return [Hash] The data hash
    def to_hash
      {
        :number => @number,
        :expiryDate => "#{@expiry_month}/#{@expiry_year}",
        :type => @type,
        :name => @name,
        :cvv => @cvv,
        :address => @address.to_hash
      }
    end
  end
end
