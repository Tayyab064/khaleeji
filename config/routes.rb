Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'website#index'
  get 'course' => 'website#course' , as: "course"
  get 'signin' => 'website#signin' , as: 'signin'
  post 'signin' => 'website#signin_save' , as: 'signin_save'
  get 'signout' => 'website#signout' , as: 'signout_user'
  post 'signup' => 'website#signup' , as: 'signup'
  get 'instructor_:id' => 'website#teacher' , as: 'teacher_profile'
  get 'course_:id' => 'website#specific_course' , as: 'specific_course'
  get 'student_:id' => 'website#user' , as: 'student_profile'

  get 'articles' => 'website#articles' , as: 'articles'
  get 'article_:id' => 'website#specific_article' , as: 'specific_article'

  get 'news' => 'website#announcements' , as: 'announcements'


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
    post 'course_image' => 'admin#update_image_course' , as: 'admin_update_image_course'
    get 'pending_course' => 'admin#pending_course' , as: 'admin_pending_course'
    get 'approve_course_:id' => 'admin#approve_course' , as: 'admin_approve_course'
    get 'approved_course' => 'admin#approved_course' , as: 'admin_approved_course'
    get 'block_course_:id' => 'admin#block_course' , as: 'admin_block_course'

    post 'video' => 'admin#add_video' , as: 'admin_add_video'

    get 'article' => 'admin#article' , as: 'admin_article'
    get 'add_article' => 'admin#add_article' , as: 'admin_add_article'
    post 'add_artile' => 'admin#save_article' , as: 'admin_save_article'
    get 'article_:id' => 'admin#specific_article' , as: 'admin_specific_article'

    get 'announcement' => 'admin#announcement' , as: 'admin_announcements'
    get 'add_announcement' => 'admin#save_announcement' , as: 'admin_add_announcement'
    post 'add_announcement' => 'admin#add_announcement' , as: 'admin_save_announcement'
    get 'visible_announcement_:id' => 'admin#announcement_mark_visible' , as: 'admin_announcement_visible'
    #get 'announcement_:id' => 'admin#specific_announcement' , as: 'admin_specific_announcement'
  end

  scope 'instructor' do
    get 'signup' => 'instructor#signup' , as: 'instructor_signup_page'
    get 'signin' => 'instructor#signin' , as: 'instructor_signin_page'
    post 'signin' => 'instructor#approve_signin' , as: 'instructor_signin'
    post 'signup' => 'instructor#approve_signup' , as: 'instructor_signup'
    get 'signout' => 'instructor#signout' , as: 'instructor_signout'

    get 'index' => 'instructor#index' , as: 'instructor_index'
    get 'course' => 'instructor#course' , as: 'instructor_course'
    get 'add_course' => 'instructor#add_course' , as: 'instructor_add_course'
    post 'course' => 'instructor#save_course' , as: 'instructor_save_course'
    get 'course_:id' => 'instructor#specific_course' , as: 'instructor_specific_course'

    post 'lesson' => 'instructor#save_lessons' , as: 'instructor_save_lesson'

  end

end
