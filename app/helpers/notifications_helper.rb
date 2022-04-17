module NotificationsHelper
  def associated_request_type(notification)
    # views/ja.ymlをコントローラ構造に合わせて書いているため、t("administrator.notifications.index.request_type.attendance")をt(".request_type.attendance")に省略できる lazy_lookupというテクニック
    notification.attendance_requests.present? ? t(".request_type.attendance") : t(".request_type.absence")
  end
end
