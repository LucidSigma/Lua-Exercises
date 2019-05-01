function get_next_month()
	local t = os.date("*t")
	t.month = t.month + 1
	t = os.date("*t", os.time(t))
	
	return t
end

function get_day_of_the_week(date)
	return date.wday
end

function get_seconds_since_epoch(date)
	return os.time(date)
end

function get_date_of_first_friday(y)
  local DAYS_IN_A_WEEK = 7

  for i = 1, DAYS_IN_A_WEEK
  do
    local FRIDAY = 6
    local time = os.date("*t", os.time({year = y, month = 1, day = i}))

    if (time.wday == FRIDAY)
    then
      return time
    end
  end
end

function get_day_difference(d1, d2)
  local SECONDS_PER_MINUTE = 60
  local MINUTES_PER_HOUR = 60
  local HOURS_PER_DAY = 24

  local difference = os.difftime(os.time(d1), os.time(d2))

  return difference / SECONDS_PER_MINUTE / MINUTES_PER_HOUR / HOURS_PER_DAY
end

function delay(seconds)
  local start = os.clock()

  while (os.clock() - start) < seconds
  do
  end
end