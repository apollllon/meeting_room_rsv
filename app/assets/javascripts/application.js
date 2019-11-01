// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap
//= require turbolinks
//= require_tree .

//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja

$(document).ready (function(){
  $('#calendar').fullCalendar({
  });
});

$(document).ready (function(){
  $('#my-calendar').fullCalendar({
    events: [
    {
      title  : 'event1',
      start  : '2019-10-01'
    },
    {
      title  : 'event2',
      start  : '2019-10-05',
      end    : '2019-10-07'
    },
    {
      title  : 'event3',
      start  : '2019-10-09T12:30:00',
      allDay : false // will make the time show
    }
  ]
  });
});