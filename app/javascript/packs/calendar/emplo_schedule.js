import { Calendar} from '@fullcalendar/core';
import timeGridPlugin from '@fullcalendar/timegrid';

document.addEventListener('turbolinks:load', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new Calendar(calendarEl, {
        plugins: [ timeGridPlugin ],
        initialView: 'timeGridWeek',

        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        firstDay: 1,
        headerToolbar: {
          start: '',
          center: 'title',
          end: 'today prev,next'
        },
        expandRows: true,
        stickyHeaderDates: true,
        buttonText: {
           today: '今日'
        },
        allDayText: '終日',
        height: "auto",
        events: '/employee/schedules.json',
    });
    //カレンダー表示
    calendar.render();
});
