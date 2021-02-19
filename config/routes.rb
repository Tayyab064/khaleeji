Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'website#index'
  get 'course' => 'website#course' , as: "course"
  get 'signin' => 'website#signin' , as: 'signin'
  post 'signin' => 'website#signin_save' , as: 'signin_save'
  post 'signup' => 'website#signup' , as: 'signup'
  get 'instructor_:id' => 'website#teacher' , as: 'teacher_profile'
  get 'course_:id' => 'website#specific_course' , as: 'specific_course'
  get 'student_:id' => 'website#user' , as: 'student_profile'


  #get 'save_course' => 'website#add_course'
  post 'course' => 'website#save_course' , as: 'add_course'
  post 'buy_course' => 'website#buy_course' , as: 'web_buy_course'


  scope 'admin' do
    get 'signin' => 'admin#signin'
    post 'signin' => 'admin#approve_signin' , as: 'signin_admin'
    get 'signout' => 'admin#signout' , as: 'admin_signout'
    get 'index' => 'admin#index' , as: 'admin_index'
    get 'course' => 'admin#course' , as: 'admin_all_courses'
    get 'student' => 'admin#students' , as: 'admin_students'
    get 'instructor' => 'admin#instructor' , as: 'admin_instructor'
    get 'add_course' => 'admin#add_course' , as: 'admin_add_course'
    get 'course_:id' => 'admin#specific_course' , as: 'admin_specific_course'

    get 'article' => 'admin#article' , as: 'admin_article'
    get 'add_article' => 'admin#add_article' , as: 'admin_add_article'
    post 'add_artile' => 'admin#save_article' , as: 'admin_save_article'
    get 'article_:id' => 'admin#specific_article' , as: 'admin_specific_article'
  end
end
