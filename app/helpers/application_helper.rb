module ApplicationHelper
  def user_login_btn
    out = ''
    if user_signed_in?
      out << "<div>
        <div class='relative mb-3 w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600'>
          <a href='/user/profile/#{current_user.id}'>
            <svg class='absolute w-12 h-12 text-gray-400 -left-1' fill='currentColor' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z' clip-rule='evenodd'></path></svg>
          </a>
        </div>"
      out << link_to("Logout", user_logout_path, data: { turbo_method: :delete }, class: "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800")
      out << '</div'
    else
      out << link_to('Login', user_login_path, class: "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"  )
    end
    out.html_safe
  end
end
