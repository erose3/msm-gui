Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/directors/add", { :controller => "directors", :action => "add"})
  post("/edit_director/:path_id", { :controller => "directors", :action => "edit"})
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete"})

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/movies/add", { :controller => "movies", :action => "add" })
  post("/edit_movie/:path_id", { :controller => "movies", :action => "edit"})
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete"})
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/actors/add", { :controller => "actors", :action => "add"})
  post("/edit_actor/:path_id", { :controller => "actors", :action => "edit"})
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete"})
end
