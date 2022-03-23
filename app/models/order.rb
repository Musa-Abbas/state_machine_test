class Order < ApplicationRecord
  state_machine :initial => :confirmed do
    event :picked_up do
      transition :confirmed => :picked_up
    end

    event :processed do
      transition :picked_up => :processed
      transition :failed => :processed
    end
    
    event :paid do
      transition :processed => :paid
    end

    event :delivery do
      transition :paid => :delivery
    end

    event :failed do
      transition :processed => :failed
    end
     
  end
    
end
