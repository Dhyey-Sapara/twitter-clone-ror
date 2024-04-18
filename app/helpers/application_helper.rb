module ApplicationHelper
  def user_login_btn
    out = ''
    if user_signed_in?
      out << link_to('Logout', user_logout_path, data: { turbo_method: :delete }, class: "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800")
    else
      out << link_to('Login', user_login_path, class: "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"  )
    end
    out.html_safe
  end
end
