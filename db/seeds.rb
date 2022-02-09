2.times do |n|
  employee = Employee.create!(
    password:"testpass",
    last_name:"山田#{n + 1}",
    first_name:"太郎#{n + 1}",
    zipcode:"000-0000",
    address:"〇〇県〇〇市〇〇町0-0#{n + 1}",
    email:"e#{n + 1}@example.com",
    phone_number:"000-0000-000#{n + 1}",
    delete_flag: false,
  )
end

Administrator.create!(
  password:"testpass",
  last_name:"管理",
  first_name:"店長",
  zipcode:"000-0000",
  address:"〇〇県〇〇市〇〇町",
  email:"eee@example.com",
  phone_number:"000-0000-000",
  delete_flg: false,
)

# AbsenceRequest.create!(
#   state: 1,
#   reason: "私用のため。",
#   employee_id: 1,
#   administrator_id: 1,
# )

# AttendanceRequest.create!(
#   state: 1,
#   employee_id: 1,
#   administrator_id: 1,
# )

# Notification.create!(
#   type: 1,
#   checked: false,
# )

Schedule.create!(
  starting_time: "2022-01-06 10:00:00",
  closing_time: "2022-01-06 16:00:00",
  employee_id: 1,
)

Schedule.create!(
  starting_time: "2022-01-07 10:00:00",
  closing_time: "2022-01-07 17:00:00",
  employee_id: 2,
)

# AbsenceRequestNotification.create!(
#   absence_request_id: ,
#   notification_id: ,
# )

# AttendanceRequestNotifications.create!(
#   absence_request_id: ,
#   notification_id: ,
# )
