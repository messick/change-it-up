ChangeItUp::Application.routes.draw do
  match '*url' => 'convert#show'
  root :to => redirect("/http://change-it-up.herokuapp.com/images/test.jpg'?width=500&height=500&conv_type=resize")
end
