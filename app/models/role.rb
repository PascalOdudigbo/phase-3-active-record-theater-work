class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def location
        self.auditions.pluck(:location)
    end

    def lead
        if self.auditions.find_by(hired: "true") != nil
            self.auditions.find_by(hired: "true").first
        else 
            "no actor has been hired for this role"
        end
    end

    def understudy
        if self.auditions.find_by(hired: "true").length > 0
            self.auditions.find_by(hired: "true").second
        else 
            "no actor has been hired for this role"
        end
    end

end