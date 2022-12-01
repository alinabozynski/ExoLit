class Province < ApplicationRecord
  validates :name, presence: true
  validate :hst_if_no_gst_or_pst
  validates :hst, presence: true, if: -> {!gst.present? && !pst.present?}
  validates :gst, presence: true, if: -> {!hst.present?}

  def hst_if_no_gst_or_pst
    if hst.present? && gst.present? || hst.present? && pst.present?
      errors.add(:hst, 'HST can only exist if GST and PST are blank.')
    end
  end
end