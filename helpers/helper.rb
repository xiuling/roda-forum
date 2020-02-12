def getduration time
  t = Time.now - time
  if (d = (t/60/60/24).to_i) > 0
    d.to_s + "天"
  elsif (h = (t/60/60).to_i) > 0
    h.to_s + '小时'
  elsif (m = (t/60).to_i) > 0
    m.to_s + '分钟'
  else
    "1分钟"
  end
end
