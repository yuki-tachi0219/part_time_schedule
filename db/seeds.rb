# rubocop:disable all
ActiveRecord::Base.transaction do
  2.times do |n|
    employee = Employee.create!(
      password: "testpass",
      last_name: "山田#{n + 1}",
      first_name: "太郎#{n + 1}",
      zipcode: "000-0000",
      address: "〇〇県〇〇市〇〇町0-0#{n + 1}",
      email: "e#{n + 1}@example.com",
      phone_number: "000-0000-000#{n + 1}",
      delete_flag: false,
    )
  end

  Administrator.create!(
    password: "testpass",
    last_name: "管理",
    first_name: "店長",
    zipcode: "000-0000",
    address: "〇〇県〇〇市〇〇町",
    email: "eee@example.com",
    phone_number: "000-0000-000",
    delete_flg: false,
  )

  2.times do |_n|
    Schedule.create!(
      starting_time: "2022-01-06 10:00:00",
      closing_time: "2022-01-06 16:00:00",
      employee_id: 1,
    )
  end
  2.times do |_n|
    Schedule.create!(
      starting_time: "2022-01-07 10:00:00",
      closing_time: "2022-01-07 18:00:00",
      employee_id: 2,
    )
  end
  AttendanceRequest.create!(
    state: 0,
    schedule_id: 1,
  )
  AttendanceRequest.create!(
    state: 0,
    schedule_id: 2,
  )
  AttendanceRequest.create!(
    state: 1,
    schedule_id: 3,
  )
  AttendanceRequest.create!(
    state: 2,
    schedule_id: 4,
  )

  Notification.create!(
    action: 0,
    checked: false,
  )
  Notification.create!(
    action: 0,
    checked: false,
  )
  Notification.create!(
    action: 1,
    checked: false,
  )
  Notification.create!(
    action: 2,
    checked: false,
  )
  AttendanceRequest.all.ids.sort.each do |attendance_request_id|
    Notification.all.ids.sort.each do |notification_id|
      AttendanceRequestNotification.create!(attendance_request_id: attendance_request_id, notification_id: notification_id)
    end
  end

  AbsenceRequest.create!(
    state: 0,
    reason: "私用のため1",
    schedule_id: 1,
  )
  AbsenceRequest.create!(
    state: 0,
    reason: "私用のため2",
    schedule_id: 2,
  )
  AbsenceRequest.create!(
    state: 1,
    reason: "私用のため3",
    schedule_id: 3,
  )
  AbsenceRequest.create!(
    state: 2,
    reason: "私用のため4",
    schedule_id: 4,
  )

  Notification.create!(
    action: 0,
    checked: false,
  )
  Notification.create!(
    action: 0,
    checked: false,
  )
  Notification.create!(
    action: 1,
    checked: false,
  )
  Notification.create!(
    action: 2,
    checked: false,
  )
  AbsenceRequest.all.ids.sort.each do |absence_request_id|
    Notification.all.ids.sort.each do |notification_id|
      AbsenceRequestNotification.create!(absence_request_id: absence_request_id, notification_id: notification_id)
    end
  end
end
# rubocop:enabale all
