# 予約期間に重複がないかを検証するバリデーター
class SchedulePeriodValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 新規登録する期間
    new_start_date = record.start_at
    new_end_date   = record.end_at

    return unless new_start_date.present? && new_end_date.present?

     # 重複する期間を検索(編集時は自期間を除いて検索)
    if record.id.present?
      not_own_periods = Schedule.where('id NOT IN (?) AND room_id IN (?) AND start_at <= ? AND end_at >= ?', record.id, record.room_id, new_end_date, new_start_date)
    else
      not_own_periods = Schedule.where('room_id IN (?) AND start_at <= ? AND end_at >= ?', record.room_id, new_end_date, new_start_date)
    end

    record.errors.add(attribute, 'に他の予約と重複があります') if not_own_periods.present?
  end
end