class CatRentalRequest < ApplicationRecord
    STATUS = %w[PENDING APPROVED DENIED]
    belongs_to :cat

    validates :cat_id, :start_date, :end_date, presence: true
    validates :status, presence: true, inclusion: { in: STATUS }

    def overlapping_requests

    end

    def overlapping_approved_requests

    end

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists?
            errors.add(:base, 'Request overlaps with an approved request')
    end

end
