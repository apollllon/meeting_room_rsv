# 予約期間が会議室の使用可能時間内かどうかを検証するバリデーター
class ScheduleRoomPeriodValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 新規登録する期間
    new_start_date = record.start_at
    new_end_date   = record.end_at
    
    # 部屋の使用可能時間
    room_open_time = Room.find(record.room_id).open_at
    room_close_time = Room.find(record.room_id).close_at
    
    return unless new_start_date.present? && new_end_date.present? && room_close_time.present? && room_open_time.present?

    # ルームの利用時間内かどうかを確認
    unless new_start_date >= room_open_time && new_end_date <= room_close_time
      record.errors.add(attribute, 'が会議室の利用可能時間の範囲外です') if not_own_periods.present?
    end
  end
end