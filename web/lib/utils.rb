def login_required
  redirect '/login' unless defined? session[:logged_in] 
  redirect '/login' unless session[:logged_in] == true
  puts session[:logged_in]
end
