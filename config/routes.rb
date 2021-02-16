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


  get 'save_course' => 'website#add_course'
  post 'course' => 'website#save_course' , as: 'add_course'
end
