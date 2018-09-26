module Fleets
  class Create

    def intialize(params)
      @params = params
    end

    def save
      resource.save
    end

    def resource
      @resource ||=
        Fleet.new(extended_params)
    end

    private

    def extended_params
      @params.merge!(power: calculate_fleet_power)
    end

    def calculate_fleet_power
      #TODO CALCULATE FLEET POWER
    end
  end
end
