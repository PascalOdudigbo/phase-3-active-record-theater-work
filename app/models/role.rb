class Role < ActiveRecord::Base
    has_many :auditions

    def lead
        if self.auditions.find_by(hired: 1).length > 0
            self.auditions.find_by(hired: 1).first
        else 
            "no actor has been hired for this role"
        end
    end

    def understudy
        if self.auditions.find_by(hired: 1).length > 0
            self.auditions.find_by(hired: 1).second
        else 
            "no actor has been hired for this role"
        end
    end

end