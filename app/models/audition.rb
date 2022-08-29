class Audition < ActiveRecord::Base
    belongs_to :role

    def call_back
        self.update(hired: 1)
    end
end